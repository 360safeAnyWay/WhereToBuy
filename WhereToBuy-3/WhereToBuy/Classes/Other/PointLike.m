//
//  PointLike.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/10.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PointLike.h"
#import "AnimationView.h"
@implementation PointLike


- (instancetype)initWithString:(NSString *)str
{
    self = [super init];
    if (self) {
        _number = str;
//         设置button
        [self createButton];
    }
    return self;
}
-(void)createButton
{
    //点赞按钮＋1
    UIButton *plusBtn = [[UIButton alloc] initWithFrame:CGRectMake(14, 6.5, 19, 19)];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"isBuyUp.png"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"up_highlighted.png"] forState:UIControlStateSelected];
    [plusBtn addTarget:self action:@selector(zanPlusOnes:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:plusBtn];
    self.plusBtn = plusBtn;
    
    //点赞数
    UILabel *numZan = [[UILabel alloc] initWithFrame:CGRectMake(plusBtn.frame.origin.x + plusBtn.frame.size.width, plusBtn.frame.origin.y, 45, plusBtn.frame.size.height)];
    [numZan setText:_number];
    [numZan setFont:[UIFont systemFontOfSize:12]];
    [numZan setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:numZan];
     self.zanCount = numZan;
    
    //踩按钮－1
    UIButton *subBtn = [[UIButton alloc] initWithFrame:CGRectMake(numZan.frame.origin.x + numZan.frame.size.width, numZan.frame.origin.y, plusBtn.frame.size.width, plusBtn.frame.size.height)];
    [subBtn setBackgroundImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    [subBtn setBackgroundImage:[UIImage imageNamed:@"down_highlighted.png"] forState:UIControlStateSelected];
    [subBtn addTarget:self action:@selector(zanSubOnes:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:subBtn];
    self.subBtn = subBtn;

}
//赞加1
- (void)zanPlusOnes:(UIButton *)btn
{
    if (btn.selected != YES) {
        //先取反
        self.plusBtn.selected = YES;
        //先定义一个UIimageview
        UIImageView *zanImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plusOne.png"]];
        [zanImage setCenter:CGPointMake(self.zanCount.center.x, self.zanCount.center.y)];
        [self insertSubview:zanImage atIndex:0];
        self.zanImage = zanImage;
        
        CAAnimationGroup *plusAnimation = [CAAnimationGroup animation];
        //定义动画组的执行时间
        [plusAnimation setDuration:1.0f];
        CABasicAnimation *opcity = [AnimationView opacityWithDuration:1.0f from:1.0 to:0.1];
        CAKeyframeAnimation *move = [AnimationView moveWithDuration:1.0f from:CGPointMake(self.zanCount.center.x, self.zanCount.center.y) to:CGPointMake(self.zanCount.center.x, self.zanCount.center.y - 40) controlPointCount:0];
        [plusAnimation setAnimations:@[opcity, move]];
        [plusAnimation setDelegate:self];
        [plusAnimation setValue:@"plus1" forKey:@"animatioType1"];
        [zanImage.layer addAnimation:plusAnimation forKey:nil];
    }
}

//赞减1
- (void)zanSubOnes:(UIButton *)btn
{
    if (btn.selected != YES) {
        //先取反
        self.subBtn.selected = YES;
        //先定义一个UIimageview
        UIImageView *zanImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subOne.png"]];
        [zanImage setCenter:CGPointMake(self.zanCount.center.x, self.zanCount.center.y)];
        [self insertSubview:zanImage atIndex:0];
        self.zanImage = zanImage;
        
        CAAnimationGroup *subAnimation = [CAAnimationGroup animation];
        //定义动画组的执行时间
        [subAnimation setDuration:1.0f];
        CABasicAnimation *opcity = [AnimationView opacityWithDuration:1.0f from:1.0 to:0.1];
        CAKeyframeAnimation *move = [AnimationView moveWithDuration:1.0f from:CGPointMake(self.zanCount.center.x, self.zanCount.center.y) to:CGPointMake(self.zanCount.center.x, self.zanCount.center.y - 40) controlPointCount:0];
        [subAnimation setAnimations:@[opcity, move]];
        [subAnimation setDelegate:self];
        [subAnimation setValue:@"sub1" forKey:@"animatioType1"];
        [zanImage.layer addAnimation:subAnimation forKey:nil];
    }
}

//动画结束的代理方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.zanImage.alpha = 0.0f;
    [self.zanImage removeFromSuperview];
    NSString *type = [anim valueForKey:@"animatioType1"];
    if ([type isEqualToString:@"plus1"]) {
        self.subBtn.selected = NO;
    }else if ([type isEqualToString:@"sub1"])
    {
        self.plusBtn.selected = NO;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
