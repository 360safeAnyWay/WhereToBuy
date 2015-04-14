//
//  YcKeyBoardView.h
//  KeyBoardAndTextView
//
//  Created by zzy on 14-5-28.
//  Copyright (c) 2014年 zzy. All rights reserved.
//
#define kStartLocation 20
#import <UIKit/UIKit.h>
#import "MFTextView.h"
@class YcKeyBoardView;
@protocol YcKeyBoardViewDelegate <NSObject>

-(void)keyBoardViewHide:(YcKeyBoardView *)keyBoardView textView:(UITextView *)contentView;
@end

@interface YcKeyBoardView : UIView
//文本框赋值
@property (nonatomic,strong) MFTextView *textView;
//发送按钮发送请求
@property (nonatomic,strong) UIButton   *sendButton;
@property (nonatomic,assign) id<YcKeyBoardViewDelegate> delegate;
@end
