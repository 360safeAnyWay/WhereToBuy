//
//  NYPopover.m
//  NYReader
//
//  Created by Cassius Pacheco on 21/12/12.
//  Copyright (c) 2012 Nyvra Software. All rights reserved.
//

#import "NYPopover.h"

@implementation NYPopover

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -3, 34, 50)];
        [imageView setImage:[UIImage imageNamed:@"paopao.png"]];
        [self addSubview:imageView];
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 34, 20)];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont boldSystemFontOfSize:18];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.opaque = NO;
        [self setBackgroundColor:[UIColor clearColor]];
        [imageView addSubview:self.textLabel];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGFloat y = (frame.size.height - 26) / 3;
    
    if (frame.size.height < 38)
        y = 0;
    
    self.textLabel.frame = CGRectMake(0, y, frame.size.width, 26);
}

@end
