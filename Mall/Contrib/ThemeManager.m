//
//  ThemeManager.m
//  WXWeibo
//
//  Created by wei.chen on 13-5-14.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "ThemeManager.h"

static ThemeManager *sigleton = nil;

@implementation ThemeManager

- (id)init {
    self = [super init];
    if (self != nil) {
        //初始化主题配置文件
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        _themesConfig = [NSDictionary dictionaryWithContentsOfFile:filePath];
        [_themesConfig retain];
        
        //初始化字体配置文件
        NSString *fontConfigPath = [[NSBundle mainBundle] pathForResource:@"fontColor" ofType:@"plist"];
        _fontConfig = [[NSDictionary dictionaryWithContentsOfFile:fontConfigPath] retain];
        
        self.themeName = @"默认";
    }
    return self;
}

- (void)setThemeName:(NSString *)themeName {
    if (_themeName != themeName) {
        [_themeName release];
        _themeName = [themeName copy];
    }
    

    //获取主题包的根目录
    NSString *themePath = [self getThemePath];
    NSString *filePath = [themePath stringByAppendingPathComponent:@"fontColor.plist"];
    
    self.fontConfig = [NSDictionary dictionaryWithContentsOfFile:filePath];
}

//获取当前主题包的目录
- (NSString *)getThemePath {
    //项目包的根路径
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    if ([self.themeName isEqualToString:@"默认"]) {
        return resourcePath;
    }

    //取得当前主题的子路径: Skins/blue
    NSString *subPath = [_themesConfig objectForKey:self.themeName];
    //主题的完整路径
    NSString *path = [resourcePath stringByAppendingPathComponent:subPath];
    return path;
}

//获取当前主题下的图片
- (UIImage *)getThemeImage:(NSString *)imageName {
    if (imageName.length == 0) {
        return nil;
    }
    
    //获取当前主题包的目录
    NSString *path = [self getThemePath];
    
    //imageName在当前主题的文件路径
    NSString *imagePath = [path stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}

//返回当前主题下的颜色
- (UIColor *)getColorWithName:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    
    
    NSString *rgb = [self.fontConfig objectForKey:name];
    NSArray *rgbs = [rgb componentsSeparatedByString:@","];
    if (rgbs.count == 3) {
        float r = [rgbs[0] floatValue];
        float g = [rgbs[1] floatValue];
        float b = [rgbs[2] floatValue];
        UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
        return color;
    }
    
    return nil;
}



#pragma mark - 单列相关的方法
+ (ThemeManager *)shareInstance {
    if (sigleton == nil) {
        @synchronized(self){
            sigleton = [[ThemeManager alloc] init];
        }
    }
    return sigleton;
}

//限制当前对象创建多实例
#pragma mark - sengleton setting
+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sigleton == nil) {
            sigleton = [super allocWithZone:zone];
        }
    }
    return sigleton;
}

+ (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;
}

- (oneway void)release {
}

- (id)autorelease {
    return self;
}

@end
