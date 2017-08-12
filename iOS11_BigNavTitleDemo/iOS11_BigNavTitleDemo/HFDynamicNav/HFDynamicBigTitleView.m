//
//  HFDynamicBigTitleView.m
//  SectionDemo
//
//  Created by HF on 2017/8/11.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "HFDynamicBigTitleView.h"

@interface HFDynamicBigTitleView  ()

@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation HFDynamicBigTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}

#pragma mark - private

- (void)configSubviews
{
    [self addSubview:self.bigTitleLabel];
    [self.bigTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(- 20);
        make.bottom.equalTo(self).offset(- 10);
    }];
    
    [self addSubview:self.bottomLine];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(1 / kSCreenScale));
        make.bottom.equalTo(self);
    }];
}


#pragma mark - getter and setter

- (UILabel *)bigTitleLabel
{
    if (!_bigTitleLabel) {
        _bigTitleLabel = [UILabel new];
        _bigTitleLabel.font = [UIFont boldSystemFontOfSize:28];
        _bigTitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }
    return _bigTitleLabel;
}

- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = [UIColor redColor];
    }
    return _bottomLine;
}

@end
