//
//  NotNetWorking.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/4/11.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "NotNetWorking.h"

@implementation NotNetWorking

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor  = [Tools colorWithRed:214 angGreen:214 andBlue:214];
        if (IPhone4) {
            UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(320/2-149/2, 480/2-149/2, 149, 149)];
            image.image = [UIImage imageNamed:@"nowifi@1x.png"];
            [self addSubview:image];
        }else if (IPhone5||IPhone6){
            UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-298/2, [UIScreen mainScreen].bounds.size.height/2-298/2, 298, 298)];
            image.image = [UIImage imageNamed:@"nowifi@2x.png"];
            [self addSubview:image];
        }else{
            UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-447/2, [UIScreen mainScreen].bounds.size.height/2-447/2, 447, 447)];
            image.image = [UIImage imageNamed:@"nowifi@3x.png"];
            [self addSubview:image];
        }
        

    }
    return self;
}

@end
