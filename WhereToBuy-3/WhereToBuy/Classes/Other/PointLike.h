//
//  PointLike.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/10.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PointLike : UIView
@property (nonatomic,copy)NSString * number;
@property (weak, nonatomic) UIView *viewDown;//为了兼容发表的评论
@property (weak, nonatomic) UIImageView *zanImage;//点赞动画的哪个image
@property (strong, nonatomic) UIButton *plusBtn;//点赞按钮
@property (strong, nonatomic) UIButton *subBtn;//踩按钮
@property (strong, nonatomic) UILabel *zanCount;//点赞按钮
- (instancetype)initWithString:(NSString *)str;
@end
