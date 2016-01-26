//
//  WXNavigationController.m
//  WXWeibo
//
//  Created by wei.chen on 13-5-13.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "WXNavigationController.h"
#import "ThemeManager.h"

//5.0以下系统自定义UINavigationBar背景
@implementation UINavigationBar(setbackgroud)

- (void)drawRect:(CGRect)rect {
    UIImage *image = [[ThemeManager shareInstance] getThemeImage:@"navigationbar_background.png"];
    [image drawInRect:rect];
}

@end

@interface WXNavigationController ()

@end

@implementation WXNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //监听主题切换的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
    }
    return self;
}

- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
}

- (void)loadThemeImage {
    float version = [[UIDevice currentDevice].systemVersion floatValue];
    if (version >= 5.0) {
        UIImage *image = [[ThemeManager shareInstance] getThemeImage:@"navigationbar_background.png"];
        
        [self.navigationBar setBackgroundImage:image
                                 forBarMetrics:UIBarMetricsDefault];
    } else {
        //让视图重新调用drawRect
        [self.navigationBar setNeedsDisplay];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadThemeImage];
    
}

@end
