//
//  ThemeButton.h
//  WXWeibo
//
//  Created by wei.chen on 13-5-14.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton

//normal状态下的图片名称
@property(nonatomic,copy)NSString *imageName;
//高亮状态下的图片名称
@property(nonatomic,copy)NSString *highligtImageName;

- (id)initWithImage:(NSString *)imageName
        highlighted:(NSString *)highligtImageName;

@end
