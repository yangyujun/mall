//
//  TabbarView.h
//  FansEnd
//
//  Created by iHope on 13-10-12.
//  Copyright (c) 2013年 iHope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TabbarView : UIView
{
    UIImageView *imageView;    
}
@property (nonatomic, strong) UIButton *selectBtn;

@property(nonatomic, assign)id tabDelegate;
@property(nonatomic, assign)SEL onButtonClick;

-(id)initWithFrame:(CGRect)frame withImageArray:(NSArray*)array;

@end
