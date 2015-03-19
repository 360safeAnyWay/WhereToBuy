//
//  PatternViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-10.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PatternViewController.h"
#import "NormalCircle.h"

#define kCurrentPattern												@"KeyForCurrentPatternToUnlock"
#define kCurrentPatternTemp										@"KeyForCurrentPatternToUnlockTemp"

@interface PatternViewController()<LockScreenDelegate>

@property (nonatomic) NSInteger wrongGuessCount;

@end

@implementation PatternViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //	self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.backgroundColor = [UIColor colorWithRed:36 / 255.0 green:39 / 255.0 blue:54 / 255.0 alpha:1.0];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.lockScreenView = [[SPLockScreen alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
    self.lockScreenView.center = self.view.center;
    self.lockScreenView.delegate = self;
    self.lockScreenView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.lockScreenView];
    
    UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [headImage setCenter:CGPointMake(self.view.frame.size.width / 2, 140)];
    headImage.layer.borderColor = [UIColor colorWithRed:36 / 255.0 green:39 / 255.0 blue:54 / 255.0 alpha:1.0].CGColor;
    headImage.layer.borderWidth = 1.0f;
    headImage.layer.cornerRadius = 25.0f;
    [headImage setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:headImage];
    
    self.infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 175, self.view.frame.size.width, 20)];
    self.infoLabel.backgroundColor = [UIColor clearColor];
    self.infoLabel.font = [UIFont systemFontOfSize:16];
    self.infoLabel.textColor = [UIColor redColor];
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.infoLabel];
    
    [self updateOutlook];
    
    
    // Test with Circular Progress
}


- (void)updateOutlook
{
    switch (self.infoLabelStatus) {
        case InfoStatusFirstTimeSetting:
            self.infoLabel.text = @"设置一个新的手势!";
            break;
        case InfoStatusConfirmSetting:
            self.infoLabel.text = @"重新输入手势!";
            break;
        case InfoStatusFailedConfirm:
            self.infoLabel.text = @"验证手势失败,请重试!";
            break;
        case InfoStatusNormal:
            self.infoLabel.text = @"请输入手势密码进入";
            break;
        case InfoStatusFailedMatch:
            self.infoLabel.text = [NSString stringWithFormat:@"尝试错误%ld次, 请重试!",(long)self.wrongGuessCount];
            break;
        case InfoStatusSuccessMatch:
            self.infoLabel.text = @"欢迎!";
            break;
            
        default:
            break;
    }
    
}


#pragma -LockScreenDelegate

- (void)lockScreen:(SPLockScreen *)lockScreen didEndWithPattern:(NSNumber *)patternNumber
{
    NSUserDefaults *stdDefault = [NSUserDefaults standardUserDefaults];
    NSLog(@"self status: %d",self.infoLabelStatus);
    switch (self.infoLabelStatus) {
        case InfoStatusFirstTimeSetting:
            [stdDefault setValue:patternNumber forKey:kCurrentPatternTemp];
            self.infoLabelStatus = InfoStatusConfirmSetting;
            [self updateOutlook];
            break;
        case InfoStatusFailedConfirm:
            [stdDefault setValue:patternNumber forKey:kCurrentPatternTemp];
            self.infoLabelStatus = InfoStatusConfirmSetting;
            [self updateOutlook];
            break;
        case InfoStatusConfirmSetting:
            if([patternNumber isEqualToNumber:[stdDefault valueForKey:kCurrentPatternTemp]]) {
                [stdDefault setValue:patternNumber forKey:kCurrentPattern];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else {
                self.infoLabelStatus = InfoStatusFailedConfirm;
                [self updateOutlook];
            }
            break;
        case  InfoStatusNormal:
            if([patternNumber isEqualToNumber:[stdDefault valueForKey:kCurrentPattern]]) [self dismissViewControllerAnimated:YES completion:nil];
            else {
                self.infoLabelStatus = InfoStatusFailedMatch;
                self.wrongGuessCount ++;
                [self updateOutlook];
            }
            break;
        case InfoStatusFailedMatch:
            if([patternNumber isEqualToNumber:[stdDefault valueForKey:kCurrentPattern]]) [self dismissViewControllerAnimated:YES completion:nil];
            else {
                self.wrongGuessCount ++;
                self.infoLabelStatus = InfoStatusFailedMatch;
                [self updateOutlook];
            }
            break;
        case InfoStatusSuccessMatch:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
            
        default:
            break;
    }
}

- (void)viewDidUnload {
    [self setInfoLabel:nil];
    [self setLockScreenView:nil];
    [super viewDidUnload];
}


@end
