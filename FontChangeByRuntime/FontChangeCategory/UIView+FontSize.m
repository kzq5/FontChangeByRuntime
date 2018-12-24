//
//  UIView+FontSize.m
//  FontSizeModify
//
//  Created by dyw on 16/10/22.
//  Copyright © 2016年 dyw. All rights reserved.
//

#import "UIView+FontSize.h"
#import <objc/runtime.h>
#import "KKTool.h"

#define ScrenScale [UIScreen mainScreen].bounds.size.width/375.0

@implementation UIView (FontSize)

@end

@interface UILabel (FontSize)

@end

@interface UIButton (FontSize)

@end

@interface UITextField (FontSize)

@end

@interface UITextView (FontSize)

@end

@implementation UILabel (FontSize)

+ (void)load{
    if(!UILabelEnable) return;
    Class class = [self class];
    [self exchangeWithOrignal:@selector(awakeFromNib) new:@selector(testFontAwakeFromNib) withClass:class];
}
+ (void)exchangeWithOrignal:(SEL)orignalSel new:(SEL)newSel withClass:(Class)class{
    SEL orignalSel3 = orignalSel;
    Method orignalM3 = class_getInstanceMethod(class, orignalSel3);
    SEL swizzledSel3 = newSel;
    Method swizzledM3 = class_getInstanceMethod(class, swizzledSel3);
    BOOL didAddMethod3 = class_addMethod(class, orignalSel3, method_getImplementation(swizzledM3), method_getTypeEncoding(swizzledM3));
    if (didAddMethod3) {
        class_replaceMethod(class, swizzledSel3, method_getImplementation(orignalM3), method_getTypeEncoding(orignalM3));
    }else{
        method_exchangeImplementations(orignalM3, swizzledM3);
    }
}
- (void)testFontAwakeFromNib{
    [self testFontAwakeFromNib];
    
    CGFloat fontSize = self.font.pointSize;
    NSLog(@"self.font.fontName= %@",self.font.fontName);
    UIFont *font = [UIFont fontWithName:[KKTool formatFontName:self.font.fontName] size:fontSize*KZOOM_SCALE_X];
    if (font) {
        self.font = font;
    }
    
}
@end

@implementation UIButton (FontSize)

+ (void)load {
    if(!UIButtonEnable) return;
    Class class = [self class];
    [self exchangeWithOrignal:@selector(awakeFromNib) new:@selector(testFontAwakeFromNib) withClass:class];
}
+ (void)exchangeWithOrignal:(SEL)orignalSel new:(SEL)newSel withClass:(Class)class{
    SEL orignalSel3 = orignalSel;
    Method orignalM3 = class_getInstanceMethod(class, orignalSel3);
    SEL swizzledSel3 = newSel;
    Method swizzledM3 = class_getInstanceMethod(class, swizzledSel3);
    BOOL didAddMethod3 = class_addMethod(class, orignalSel3, method_getImplementation(swizzledM3), method_getTypeEncoding(swizzledM3));
    if (didAddMethod3) {
        class_replaceMethod(class, swizzledSel3, method_getImplementation(orignalM3), method_getTypeEncoding(orignalM3));
    }else{
        method_exchangeImplementations(orignalM3, swizzledM3);
    }
}
- (void)testFontAwakeFromNib{
    [self testFontAwakeFromNib];
    
    CGFloat fontSize = self.titleLabel.font.pointSize;
    UIFont *font = [UIFont fontWithName:[KKTool formatFontName:self.titleLabel.font.fontName] size:fontSize*KZOOM_SCALE_X];
    if (font) {
        self.titleLabel.font = font;
    }
    
}
@end

@implementation UITextField (FontSize)

+ (void)load {
    if(!UITextFieldEnable) return;
    Class class = [self class];
    [self exchangeWithOrignal:@selector(awakeFromNib) new:@selector(testFontAwakeFromNib) withClass:class];
}
+ (void)exchangeWithOrignal:(SEL)orignalSel new:(SEL)newSel withClass:(Class)class{
    SEL orignalSel3 = orignalSel;
    Method orignalM3 = class_getInstanceMethod(class, orignalSel3);
    SEL swizzledSel3 = newSel;
    Method swizzledM3 = class_getInstanceMethod(class, swizzledSel3);
    BOOL didAddMethod3 = class_addMethod(class, orignalSel3, method_getImplementation(swizzledM3), method_getTypeEncoding(swizzledM3));
    if (didAddMethod3) {
        class_replaceMethod(class, swizzledSel3, method_getImplementation(orignalM3), method_getTypeEncoding(orignalM3));
    }else{
        method_exchangeImplementations(orignalM3, swizzledM3);
    }
}
- (void)testFontAwakeFromNib{
    [self testFontAwakeFromNib];
    
    CGFloat fontSize = self.font.pointSize;
    UIFont *font = [UIFont fontWithName:[KKTool formatFontName:self.font.fontName] size:fontSize*KZOOM_SCALE_X];
    if (font) {
        self.font = font;
    }
    
}

@end

@implementation UITextView (FontSize)

+ (void)load {
    if(!UITextViewEnable) return;
    Class class = [self class];
    [self exchangeWithOrignal:@selector(awakeFromNib) new:@selector(testFontAwakeFromNib) withClass:class];
}
+ (void)exchangeWithOrignal:(SEL)orignalSel new:(SEL)newSel withClass:(Class)class{
    SEL orignalSel3 = orignalSel;
    Method orignalM3 = class_getInstanceMethod(class, orignalSel3);
    SEL swizzledSel3 = newSel;
    Method swizzledM3 = class_getInstanceMethod(class, swizzledSel3);
    BOOL didAddMethod3 = class_addMethod(class, orignalSel3, method_getImplementation(swizzledM3), method_getTypeEncoding(swizzledM3));
    if (didAddMethod3) {
        class_replaceMethod(class, swizzledSel3, method_getImplementation(orignalM3), method_getTypeEncoding(orignalM3));
    }else{
        method_exchangeImplementations(orignalM3, swizzledM3);
    }
}
- (void)testFontAwakeFromNib{
    [self testFontAwakeFromNib];
    
    CGFloat fontSize = self.font.pointSize;
    UIFont *font = [UIFont fontWithName:[KKTool formatFontName:self.font.fontName] size:fontSize*KZOOM_SCALE_X];
    if (font) {
        self.font = font;
    }
    
}
@end
