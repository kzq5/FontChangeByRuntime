//
//  UIFont+ChangeFont.m
//  StreetAway
//
//  Created by kangzhiqiang on 2018/12/21.
//  Copyright © 2018 KZQ. All rights reserved.
//

#import "UIFont+ChangeFont.h"
#import <objc/runtime.h>
#import "KKTool.h"

@implementation UIFont (ChangeFont)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        Method orignalMethod = class_getClassMethod(class, @selector(systemFontOfSize:));
        Method newMethod = class_getClassMethod(class, @selector(changeFont:));
        method_exchangeImplementations(orignalMethod, newMethod);
        
        
        Method orignalBoldMethod = class_getClassMethod(class, @selector(boldSystemFontOfSize:));
        Method newBoldMethod = class_getClassMethod(class, @selector(changeBoldFont:));
        method_exchangeImplementations(orignalBoldMethod, newBoldMethod);
        
    });
}
+ (UIFont *)changeFont:(CGFloat )fontSize{
    UIFont *font = [UIFont fontWithName:NSStringApp(FONT_NAME_XIB, @"-Thin") size:fontSize*KZOOM_SCALE_X];
    if (!font) {
        return [self changeFont:fontSize];
    }
    return font;
}
+ (UIFont *)changeBoldFont:(CGFloat )fontSize{
    UIFont *font = [UIFont fontWithName:NSStringApp(FONT_NAME_XIB, @"-Blod") size:fontSize*KZOOM_SCALE_X];
    if (!font) {
        return [self changeBoldFont:fontSize];
    }
    return font;
}

@end
