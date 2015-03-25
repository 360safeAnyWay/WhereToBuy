//
//  MoreReplyViewController.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/23.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YcKeyBoardView.h"

@interface MoreReplyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,YcKeyBoardViewDelegate>
@property (nonatomic,copy)NSString                  *   infoMessage_Str;
@property (nonatomic,strong)YcKeyBoardView          *   key;
@property (nonatomic,assign) CGFloat                    keyBoardHeight;



@end
