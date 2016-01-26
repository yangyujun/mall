//
//  TabbarView.m
//  FansEnd
//
//  Created by iHope on 13-10-12.
//  Copyright (c) 2013年 iHope. All rights reserved.
//

#import "TabbarView.h"
#define TabbarButtonTag 100

@implementation TabbarView

-(id)initWithFrame:(CGRect)frame withImageArray:(NSArray*)array
{
    self = [super initWithFrame:frame];
    if (self) {
        int width = 320/array.count;
        int x = 0;
        
        //背影条
        UIView *backgroudView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, frame.size.height)];
        [self addSubview:backgroudView];
        backgroudView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        
        for (int i = 0; i<array.count; i++) {
            //添加背景灰色小球
            UIImageView *imageViewgray = [[UIImageView alloc]initWithFrame:CGRectMake(x, 4,width, 41)];
            imageViewgray.backgroundColor = [UIColor clearColor];
            imageViewgray.image = [UIImage imageNamed:@"tabbar_gray"];
            [self addSubview:imageViewgray];
            
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(x, 4, width, 41);
            button.backgroundColor = [UIColor clearColor];
            
            [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_gray",[array objectAtIndex:i]]] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_red",[array objectAtIndex:i]]]  forState:UIControlStateSelected];
            [button addTarget:self action:@selector(tabBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            
            button.tag = TabbarButtonTag+i;
            [self addSubview:button];
            
            if (i == 0) {
                button.selected = YES;
                self.selectBtn = button;
                
                //添加背景红色小球
                imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, 4,width, 41)];
                imageView.backgroundColor = [UIColor clearColor];
                imageView.image = [UIImage imageNamed:@"tabbar_red"];
                [self insertSubview:imageView belowSubview:self.selectBtn];
            }
            x +=width;
        }
        
        
    }
    return self;
}

-(void)tabBtnAction:(UIButton*)btn
{
    if (self.selectBtn.tag != btn.tag) {
        self.selectBtn.selected = NO;
    }else{
        return;
    }
    self.selectBtn = btn;
    
    //动画效果--后期加
    
    //缩小
	CABasicAnimation *scaoleAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
	scaoleAnimation.duration = 0.2;
	scaoleAnimation.autoreverses = YES;
	scaoleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
	scaoleAnimation.toValue = [NSNumber numberWithFloat:0.2];
	
    //移动位置
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
	animation.fromValue = [NSValue valueWithCGPoint:imageView.layer.position];
	CGPoint toPoint = imageView.layer.position;
	toPoint.x = self.selectBtn.frame.origin.x+imageView.frame.size.width/2;
	animation.toValue = [NSValue valueWithCGPoint:toPoint];
    
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.duration = 0.4;
	group.animations = [NSArray arrayWithObjects:animation,scaoleAnimation, nil];
	group.repeatCount = 1;
    group.delegate = self;
    /* 动画的开始与结束的快慢*/
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
	[imageView.layer addAnimation:group forKey:@"move"];
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //结束时执行
    self.selectBtn.selected = YES;
    if (_tabDelegate && _onButtonClick) {
        [_tabDelegate performSelector:_onButtonClick withObject:[NSNumber numberWithInt:self.selectBtn.tag-TabbarButtonTag]];
    }
    [self insertSubview:imageView belowSubview:self.selectBtn];
    imageView.frame = CGRectMake(self.selectBtn.frame.origin.x, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height);
}
@end
