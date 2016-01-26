//
//  ViewController.m
//  Theme
//
//  Created by wei.chen on 13-5-20.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "ViewController.h"
#import "ThemeLabel.h"
#import "ThemeManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _themes = [[ThemeManager shareInstance].themesConfig allKeys];
    [_themes retain];
    
    ThemeLabel *titleLabel = [[ThemeLabel alloc] initWithColorName:@"kNavigationbarTitleLabel"];
    titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"主题切换";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    [titleLabel release];
    
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _themes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"themeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify] autorelease];
        
        UILabel *textLabel = [[ThemeLabel alloc] initWithColorName:@"kThemeCellLabel"];
        textLabel.frame = CGRectMake(10, 10, 200, 30);
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        textLabel.tag = 2013;
        [cell.contentView addSubview:textLabel];
    }
    
    UILabel *textLabel = (UILabel *)[cell.contentView viewWithTag:2013];
    textLabel.text = _themes[indexPath.row];
    //    cell.textLabel.text = _themes[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取出选中的主题名称
    NSString *themeName = _themes[indexPath.row];
    
    [ThemeManager shareInstance].themeName = themeName;
    
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:themeName];
    
    //保存主题到本地
    [[NSUserDefaults standardUserDefaults] setObject:themeName forKey:kThemeName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
