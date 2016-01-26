//
//  ThemeManager.h
//  WXWeibo
//
//  Created by wei.chen on 13-5-14.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//更主题的通知
#define kThemeDidChangeNotification @"kThemeDidChangeNotification"
#define kThemeName @"kThemeName"

@interface ThemeManager : NSObject {
@private
    //主题配置信息
    NSDictionary *_themesConfig;
}

//当前使用的主题名称
@property(nonatomic,copy)NSString *themeName;
//主题的配置信息
@property(nonatomic,retain)NSDictionary *themesConfig;
//字体的配置信息
@property(nonatomic,retain)NSDictionary *fontConfig;

+ (ThemeManager *)shareInstance;

//获取当前主题下的图片
- (UIImage *)getThemeImage:(NSString *)imageName;

//返回当前主题下的颜色
- (UIColor *)getColorWithName:(NSString *)name;

@end
