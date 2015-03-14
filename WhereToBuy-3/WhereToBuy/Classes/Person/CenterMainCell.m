//
//  CenterMainCell.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-2.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "CenterMainCell.h"
#import "Tools.h"

@implementation CenterMainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(40, 10, 17.5, 17.5)];
        [self.contentView addSubview:_image];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_image.frame.origin.x + _image.frame.size.width + 5, _image.frame.origin.y, 100, 20)];
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:_titleLabel];
        
        UIView *viewTopLine = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.contentView.frame.size.width - 40, 1)];
        [viewTopLine setBackgroundColor:[Tools colorWithRed:239 angGreen:239 andBlue:239]];
        [self.contentView addSubview:viewTopLine];
    }
    
    return self;
}

@end
