//
//  MFTextView.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/26.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "MFTextView.h"

@interface MFTextView () {
    BOOL _shouldDrawPlaceholder;
}

@end

@implementation MFTextView

#pragma mark - 重写父类方法
- (void)setText:(NSString *)text {
    [super setText:text];
    [self drawPlaceholder];
    return;
}

- (void)setPlaceholder:(NSString *)placeholder {
    if (![placeholder isEqual:_placeholder]) {
        _placeholderTextColor = [UIColor lightGrayColor];
        _placeholder = placeholder;
        [self drawPlaceholder];
    }
    return;
}

#pragma mark - 父类方法
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _placeholderTextColor = [UIColor lightGrayColor];

        [self configureBase];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _placeholderTextColor = [UIColor lightGrayColor];

        [self configureBase];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (_shouldDrawPlaceholder) {
        [_placeholderTextColor  set];
//        [_placeholder drawInRect:CGRectMake(8.0f, 8.0f, self.frame.size.width - 16.0f,
//                                            self.frame.size.height - 16.0f) withFont:self.font];
        [_placeholder drawInRect:CGRectMake(8.0f, 8.0f, self.frame.size.width - 16.0f,
                                            self.frame.size.height - 16.0f)  withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.0f],NSForegroundColorAttributeName:kMainTextColor}];
    self.placeholderTextColor= [UIColor colorWithWhite:0.702f alpha:1.0f];
     

    }
    return;
}
- (void)configureBase {

    [[NSNotificationCenter defaultCenter] addObserver:self
                            selector:@selector(textChanged:)
                                name:UITextViewTextDidChangeNotification
                              object:self];
    
    self.placeholderTextColor = [UIColor lightGrayColor];
    _shouldDrawPlaceholder = NO;
    _placeholderTextColor = [UIColor lightGrayColor];
    return;
}

- (void)drawPlaceholder {
    BOOL prev = _shouldDrawPlaceholder;
    _shouldDrawPlaceholder = self.placeholder && self.placeholderTextColor && self.text.length == 0;
    _placeholderTextColor = [UIColor lightGrayColor];
    if (prev != _shouldDrawPlaceholder) {
        [self setNeedsDisplay];
    }
    return;
}

- (void)textChanged:(NSNotification *)notification {
    _placeholderTextColor = [UIColor lightGrayColor];

    [self drawPlaceholder];
    return;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    return;
}

@end
