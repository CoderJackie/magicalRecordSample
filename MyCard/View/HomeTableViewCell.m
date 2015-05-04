//
//  HomeTableViewCell.m
//  MyCard
//
//  Created by xujiaqi on 15/4/29.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(BankCardModel *)model
{
    _model = model;
}
@end
