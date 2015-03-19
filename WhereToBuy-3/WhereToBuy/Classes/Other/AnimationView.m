//
//  AnimationView.m
//  核心动画02-关键帧动画
//
//  Created by apple on 13-9-29.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView
/*
 将动画和图层进行解耦
 
 1. 给每一个动画方法增加一个返回值，返回对应的关键帧动画或者基本动画
 2. 把每一个成员方法，修改为类方法，从 - 变成 + 
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

#pragma mark - 私有方法
#pragma mark 生成屏幕上的随机点
+ (CGPoint)randomPoint
{
    // 获得父视图的大小
    CGSize size = [UIScreen mainScreen].applicationFrame.size;
    
    CGFloat x = arc4random_uniform(size.width);
    CGFloat y = arc4random_uniform(size.height);
    
    return CGPointMake(x, y);
}

#pragma mark - 关键帧动画方法
/*
 在做核心动画是，一定记住动画的效果要是随机的，否则，无论多么绚丽的效果，用户都会审美疲劳！
 
 因为核心动画做的效果属于装饰性动画，动画过程中不需要用户的交互，因此动画效果就格外重要。
 */
// 使用屏幕上的随机点作为中间点，指定中间点的数量
#pragma mark 摇晃动画
// 课下练习动画的暂停和恢复
+ (CAKeyframeAnimation *)shakeAnimation
{
    // 1. 实例化关键帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    // 晃动
//    [anim setDuration:0.5f];
    
    // 1> 角度
    CGFloat angel = M_PI_4 / 12.0;
    [anim setValues:@[@(angel), @(-angel), @(angel)]];
    
    // 2> 循环晃
    [anim setRepeatCount:HUGE_VALF];
    
    // 3. 将动画添加到图层
    return anim;
}

#pragma mark 贝塞尔曲线，两个控制点
+ (CAKeyframeAnimation *)moveCurveWithDuration:(CFTimeInterval)duration from:(CGPoint)from to:(CGPoint)to
{
    // 1. 实例化关键帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // 2. 设置路径
    [anim setDuration:duration];
    
    // 中间的控制点使用屏幕上得随机点
    CGPoint cp1 = [AnimationView randomPoint];
    CGPoint cp2 = [AnimationView randomPoint];
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 设置起始点
    CGPathMoveToPoint(path, NULL, from.x, from.y);
    // 添加带一个控制点的贝塞尔曲线
    CGPathAddCurveToPoint(path, NULL, cp1.x, cp1.y, cp2.x, cp2.y, to.x, to.y);
    
    [anim setPath:path];
    CGPathRelease(path);
    
//    // 5) 设置键值记录目标位置，以便动画结束后，修正位置
//    [anim setValue:@"translationTo" forKey:@"animationType"];
//    [anim setValue:[NSValue valueWithCGPoint:to] forKey:@"targetPoint"];
//    [anim setDelegate:self];
    
    // 3. 将动画添加到图层
    return anim;
}

#pragma mark 贝塞尔曲线，一个控制点
+ (CAKeyframeAnimation *)moveQuadCurveWithDuration:(CFTimeInterval)duration from:(CGPoint)from to:(CGPoint)to
{
    // 1. 实例化关键帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // 2. 设置路径
    [anim setDuration:duration];
    
    // 中间的控制点使用屏幕上得随机点
    CGPoint cp = [self randomPoint];
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 设置起始点
    CGPathMoveToPoint(path, NULL, from.x, from.y);
    // 添加带一个控制点的贝塞尔曲线
    CGPathAddQuadCurveToPoint(path, NULL, cp.x, cp.y, to.x, to.y);
    
    [anim setPath:path];
    CGPathRelease(path);
    
    // 5) 设置键值记录目标位置，以便动画结束后，修正位置
    [anim setValue:@"translationTo" forKey:@"animationType"];
    [anim setValue:[NSValue valueWithCGPoint:to] forKey:@"targetPoint"];
    [anim setDelegate:self];
    
    // 3. 将动画添加到图层
    return anim;
}

#pragma mark 按照矩形路径平移动画
// 移动的矩形是以当前点为矩形的一个顶点，目标点为矩形的对脚顶点
+ (CAKeyframeAnimation *)moveRectWithDuration:(CFTimeInterval)duration from:(CGPoint)from to:(CGPoint)to
{
    // 1. 实例化关键帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // 2. 按照矩形移动，需要使用到路径
    [anim setDuration:duration];
    
    // 1) 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    // 2) 设置路径内容
    // 起点，宽、高
    CGFloat w = to.x - from.x;
    CGFloat h = to.y - from.y;
    CGRect rect = CGRectMake(from.x, from.y, w, h);
    CGPathAddRect(path, nil, rect);
    
    // 3) 将路径添加到动画
    [anim setPath:path];
    
    // 4) 释放路径
    CGPathRelease(path);
    
    // 3. 将动画添加到图层
    return anim;
}

#pragma mark 使用随机中心点控制动画平移
+ (CAKeyframeAnimation *)moveWithDuration:(CFTimeInterval)duration from:(CGPoint)from to:(CGPoint)to controlPointCount:(NSInteger)cpCount
{
    // 1. 实例化关键帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // 2. 设置关键帧动画属性
    [anim setDuration:duration];
    
    // 设置values
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:cpCount + 2];
    
    // 1) 将起始点添加到数组
    [array addObject:[NSValue valueWithCGPoint:from]];
    
    // 2) 循环生成控制点位置数组
    for (NSInteger i = 0; i < cpCount; i++) {
        CGPoint p = [self randomPoint];
        
        [array addObject:[NSValue valueWithCGPoint:p]];
    }
    
    // 3) 将目标点添加到数组
    [array addObject:[NSValue valueWithCGPoint:to]];
    
    // 4) 设置values
    [anim setValues:array];
    
    // 5) 设置键值记录目标位置，以便动画结束后，修正位置
//    [anim setValue:@"translationTo" forKey:@"animationType"];
//    [anim setValue:[NSValue valueWithCGPoint:to] forKey:@"targetPoint"];
//    [anim setDelegate:self];
    
    // 3. 将动画添加到图层
    return anim;
}

#pragma mark - 基本动画
#pragma mark 缩放方法
+ (CABasicAnimation *)scaleWithDuration:(CFTimeInterval)duration from:(CGFloat)from to:(CGFloat)to
{
    // 1. 实例化基本动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 2. 设置动画属性
    // fromValue & toValue
    [anim setFromValue:@(from)];
    // 从当前大小缩小到一半，然后恢复初始大小
    [anim setToValue:@(to)];
    // 自动翻转动画
//    [anim setAutoreverses:YES];
    
    // 动画时长
    [anim setDuration:duration];
    
    return anim;
}

+ (CABasicAnimation *)opacityWithDuration:(CFTimeInterval)duration from:(CGFloat)from to:(CGFloat)to
{
    // 1. 实例化基本动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    // 2. 设置动画属性
    // fromValue & toValue
    [anim setFromValue:@(from)];
    // 从当前大小缩小到一半，然后恢复初始大小
    [anim setToValue:@(to)];
    // 自动翻转动画
    //    [anim setAutoreverses:YES];
    
    // 动画时长
    [anim setDuration:duration];
    
    return anim;
}

+ (CABasicAnimation *)rotationWithDuration:(CFTimeInterval)duration from:(CGFloat)from to:(CGFloat)to
{
    // 1. 实例化基本动画
    // 默认按照z轴旋转
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];

    // 2. 设置动画属性
    // 不停的旋转
    // 1) 旋转一周
    [anim setToValue:@(to)];
    
    [anim setDuration:duration];
    
    return anim;
}


@end
