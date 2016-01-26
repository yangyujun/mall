//
//  ThemeImageView.m
//  WXWeibo
//
//  Created by wei.chen on 13-5-14.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "ThemeImageView.h"
#import "ThemeManager.h"

@implementation ThemeImageView

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

- (id)initWithImageName:(NSString *)imageName {
    
    self = [super initWithFrame:CGRectZero];
    if (self != nil) {
        self.imageName = imageName;
        
        //监听主题切换的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
        [self loadThemeImage];        
    }
    return self;
}

//使用xib创建此类的对象，会调用此方法
- (void)awakeFromNib {
    [super awakeFromNib];
    
    //监听主题切换的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    
    [self loadThemeImage];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
    [_imageName release];
    [super dealloc];
}

- (void)loadThemeImage {
    if(self.imageName.length == 0) {
        return;
    }
    
    UIImage *image = [[ThemeManager shareInstance] getThemeImage:self.imageName];
    self.image = image;
}

- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
}

@end
