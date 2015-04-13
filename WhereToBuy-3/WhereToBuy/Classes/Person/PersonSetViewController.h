//
//  PersonSetViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-2.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"
#import "USERUSERDataBase.h"
#import "USERData.h"
#import "USERIntros.h"
@interface PersonSetViewController : BaseViewController
@property (nonatomic,retain)USERUSERDataBase * uudb;
@property (nonatomic,retain)USERData * userData;
@property (nonatomic,retain)USERIntros * intros;

@end
