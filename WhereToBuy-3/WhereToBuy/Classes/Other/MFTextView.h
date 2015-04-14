//
//  MFTextView.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/26.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>
/*!
 * @brief 继承于UITextView，添加了placeholder支持，就像UITextField一样的拥有placeholder功能
 * @author huangyibiao
 */
@interface MFTextView : UITextView

/*!
 * @brief 占位符文本,与UITextField的placeholder功能一致
 */
@property (nonatomic, strong) NSString *placeholder;

/*!
 * @brief 占位符文本颜色
 */
@property (nonatomic, strong) UIColor *placeholderTextColor;

@end
