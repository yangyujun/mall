//
//  ViewController.h
//  Theme
//
//  Created by wei.chen on 13-5-20.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
    NSArray *_themes;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
