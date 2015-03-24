//
//  SearchTableViewCell.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-12.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "SearchTableViewCell.h"
@interface SearchTableViewCell()

@property (weak, nonatomic) UIImageView *imageView1;
@property (weak, nonatomic) UILabel *nameLabel;
@property (weak, nonatomic) UILabel *infoLabel;


@end

@implementation SearchTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (id)init
{
    self = [super init];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(8), GTFixHeightFlaot(30), 30, 30)];
//        [imageView setBackgroundColor:[UIColor redColor]];
        [imageView setContentMode:UIViewContentModeRight];
        [self addSubview:imageView];
        self.imageView1 = imageView;
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(45), GTFixHeightFlaot(7), 40, 30)];
        [nameLabel setTextColor:kMainColor];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(100), GTFixHeightFlaot(7), 150, 30)];
        [infoLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:infoLabel];
        self.infoLabel = infoLabel;
    }
    return self;
}

- (void)cellInitWithArr:(NSArray *)arr atIndex:(NSInteger) index
{
    [self.imageView setImage:[UIImage imageNamed:arr[index * 3]]];
    [self.nameLabel setText:arr[index * 3 +1]];
    [self.infoLabel setText:arr[index * 3 +2]];
}

@end
