//
//  YcKeyBoardView.m
//  KeyBoardAndTextView
//
//  Created by zzy on 14-5-28.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import "YcKeyBoardView.h"

@interface YcKeyBoardView()<UITextViewDelegate>
@property (nonatomic,assign) CGFloat textViewWidth;
@property (nonatomic,assign) BOOL isChange;
@property (nonatomic,assign) BOOL reduce;
@property (nonatomic,assign) CGRect originalKey;
@property (nonatomic,assign) CGRect originalText;
@end

@implementation YcKeyBoardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        [self initTextView:frame];
    }
    return self;
}
//初始化view 创建ui
-(void)initTextView:(CGRect)frame
{
    NSLog(@"%f",self.frame.origin.y);
    self.textView=[[UITextView alloc]init];
    self.textView.delegate=self;
    self.textView.layer.cornerRadius =self.frame.size.height/2-15;
    CGFloat textX=kStartLocation*0.5;
    self.textViewWidth=frame.size.width-2*textX-10;
    self.textView.frame=CGRectMake(textX, kStartLocation*0.2,self.textViewWidth -60, frame.size.height-2*kStartLocation*0.2);
    self.textView.font=[UIFont systemFontOfSize:20.0];
    [self addSubview:self.textView];
    self.backgroundColor  = [UIColor lightGrayColor];
    self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sendButton.frame  = CGRectMake(self.textView.frame.size.width+20, self.textView.frame.origin.y, 65, frame.size.height-2*kStartLocation*0.2);
    self.sendButton.layer.cornerRadius = 5;
    self.sendButton.clipsToBounds = YES;
    [self.sendButton setBackgroundImage:[UIImage imageNamed:@"sendButton.png"] forState:0];
    [self addSubview:self.sendButton];
   
}
//判断换行
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]){
        
        if([self.delegate respondsToSelector:@selector(keyBoardViewHide: textView:)]){
        
            [self.delegate keyBoardViewHide:self textView:self.textView];
        }
        return NO;
    }
    
    return YES;
}
//换行时 改变Frame的大小
-(void)textViewDidChange:(UITextView *)textView
{
      NSString *content=textView.text;
    CGSize contentSize=[content sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    NSLog(@"%f",contentSize.width);
    NSLog(@"%f",self.textViewWidth-70);
      if(contentSize.width>self.textViewWidth-70){
          
          if(!self.isChange){
              
              CGRect keyFrame=self.frame;
              self.originalKey=keyFrame;
              keyFrame.size.height+=keyFrame.size.height;
              keyFrame.origin.y-=keyFrame.size.height*0.25;
              self.frame=keyFrame;
              
              CGRect textFrame=self.textView.frame;
              self.originalText=textFrame;
              textFrame.size.height+=textFrame.size.height*0.5+kStartLocation*0.2;
              self.textView.frame=textFrame;
              self.isChange=YES;
              self.reduce=YES;
            }
      }
    
    if(contentSize.width+70<=self.textViewWidth){
        
        if(self.reduce){
            
            self.frame=self.originalKey;
            self.textView.frame=self.originalText;
            self.isChange=NO;
            self.reduce=NO;
       }
    }
}
@end
