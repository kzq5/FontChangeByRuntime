# FontChangeByRuntime
全局替换app字体，包括代码写的和xib做拽的控件。也有通过屏幕尺寸设置字体比例。

![Image text](https://github.com/kzq5/FontChangeByRuntime/blob/master/8841545651784_.pic.jpg)

# 代码中实现了UIfont和UiView分类，其中UiView中包括了UIButton，UILabel，UiTextField，UITextView分类，重要都是通过方法交换来设置字体的。
## 由于我工程中代码写的控件用的都是systemFontOfSize：和boldSystemFontOfSize：两个方法设置字体的，所以我直接用fontWithName：size：和这两个方法交换来实现字体替换

```
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
```
