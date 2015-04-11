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
        self.backgroundColor  = [UIColor darkGrayColor];
        if (IPhone4) {
            UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(320/2-149/2, 480/2-149/2, 149, 149)];
            image.image = [UIImage imageNamed:@"nowifi@1x.png"];
            [self addSubview:image];
        }else if (IPhone5||IPhone6){
            UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
            image.image = [UIImage imageNamed:@"网络异常.jpg"];
            [self addSubview:image];
        }else{
            UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
            image.image = [UIImage imageNamed:@"网络异常.jpg"];
            [self addSubview:image];
        }
        

    }
    return self;
}

@end
