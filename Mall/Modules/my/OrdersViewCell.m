//
//  OrdersViewCell.m
//  Mall
//
//  Created by wenchuang on 14-3-20.
//  Copyright (c) 2014年 wenchuang. All rights reserved.
//

#import "OrdersViewCell.h"

@implementation OrdersViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
