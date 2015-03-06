//
//  BaseViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IPhone4 ([UIScreen mainScreen].bounds.size.height == 480)
#define IPhone5 ([UIScreen mainScreen].bounds.size.height == 568)
#define IPhone6 ([UIScreen mainScreen].bounds.size.height == 667)
#define IPhone6P ([UIScreen mainScreen].bounds.size.height == 736)

@interface BaseViewController : UIViewController

@end
