//
//  KKTool.h
//  FontChangeByRuntime
//
//  Created by kangzhiqiang on 2018/12/24.
//  Copyright © 2018 kangxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#define FONT_NAME_XIB @"MarkerFelt"//此字体是系统自带的，可以加载自己下载的字体，具体方法百度一堆
#define NSStringApp(str1,str2) [NSString stringWithFormat:@"%@%@",str1,str2]

#define FRAME_WIDTH     [[UIScreen mainScreen] bounds].size.width
#define FRAME_HEIGHT    [[UIScreen mainScreen] bounds].size.height

//屏幕缩放比例，以4.7寸屏为参照
#define KZOOM_SCALE_X (float)(FRAME_WIDTH/375.0)

#define FontScale KZOOM_SCALE_X //可以根据屏幕大小设置字体大小

NS_ASSUME_NONNULL_BEGIN

@interface KKTool : NSObject
+ (NSString *)fontName;
+ (NSString *)formatFontName:(NSString *)fontName;
@end

NS_ASSUME_NONNULL_END
