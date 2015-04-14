//
//  PersonSetCell.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-5.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonSetCell.h"
@interface PersonSetCell()<UITextFieldDelegate>



@end

@implementation PersonSetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //标题标签
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 70, 30)];
        [nameLabel setTextColor:[UIColor lightGrayColor]];
        [nameLabel setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:nameLabel];
        _nameLabel = nameLabel;
<<<<<<< HEAD
        
=======
>>>>>>> parent of e1f60e4... d大是大非上的
        //内容
        UITextField *detailLabel = [[UITextField alloc] initWithFrame:CGRectMake(nameLabel.frame.origin.x + nameLabel.frame.size.width + 10, nameLabel.frame.origin.y, 220, 30)];
        [self.contentView addSubview:detailLabel];
        detailLabel.delegate = self;
        [detailLabel setFont:[UIFont systemFontOfSize:14]];
        [detailLabel setReturnKeyType:UIReturnKeyDone];
        [detailLabel setBackgroundColor:[UIColor clearColor]];
        _detailLabel = detailLabel;
        
<<<<<<< HEAD
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(detailLabel.frame.size.width - 34, 7, 16, 16)];
        [icon setUserInteractionEnabled:NO];
        [detailLabel addSubview:icon];
        _icon = icon;

        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 39, self.frame.size.width, 1)];
=======
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-46, 7, 16, 16)];
        [icon setUserInteractionEnabled:NO];
        [self addSubview:icon];
        _icon = icon;

        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 39, [UIScreen mainScreen].bounds.size.width-20, 1)];
>>>>>>> parent of e1f60e4... d大是大非上的
        [view setBackgroundColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:view];
    }
    return self;
}

- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row
{
    if (row == 0 || row == 1 || row == 3 || row == 2) {
        [_icon setImage:[UIImage imageNamed:@"edit.png"]];
    }else
    {
        [_detailLabel setUserInteractionEnabled:NO];
    }
    
    _icon.tag = row + 1;
    _nameLabel.text = arr[0][row];
    _detailLabel.text = arr[1][row];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
