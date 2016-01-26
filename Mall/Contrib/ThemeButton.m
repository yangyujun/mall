//
//  ThemeButton.m
//  WXWeibo
//
//  Created by wei.chen on 13-5-14.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManager.h"

@implementation ThemeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //监听主题切换的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
        [self loadThemeImage];
    }
    return self;
}

- (id)initWithImage:(NSString *)imageName
        highlighted:(NSString *)highligtImageName {
    self = [super initWithFrame:CGRectZero];
    if (self != nil) {
        self.imageName = imageName;
        self.highligtImageName = highligtImageName;
        
        //监听主题切换的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
        [self loadThemeImage];
    }
    return self;
}

- (void)dealloc {
    //移除指定的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
    [_imageName release];
    [_highligtImageName release];
    [super dealloc];
}

- (void)loadThemeImage {
    ThemeManager *themeManager = [ThemeManager shareInstance];
    //获取当前主题normal状态下的图片
    UIImage *image = [themeManager getThemeImage:self.imageName];
    UIImage *highligtImage = [themeManager getThemeImage:self.highligtImageName];
    
    //设置图片
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highligtImage forState:UIControlStateHighlighted];
}

#pragma mark - NSNotification actions
//当切换主题时，会调用的方法
- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
}



@end
