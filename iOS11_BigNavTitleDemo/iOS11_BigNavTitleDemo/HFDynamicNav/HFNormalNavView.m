//
//  HFNormalNavView.m
//  SectionDemo
//
//  Created by HF on 2017/8/11.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "HFNormalNavView.h"
#define BackButtonWidth  60 //返回按钮默认展示极小宽度是 60

@interface HFNormalNavView ()

@end

@implementation HFNormalNavView

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
    [self addSubview:self.backButton];
    [self addSubview:self.smallTitleLabel];
    [self addSubview:self.rightMenuView];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(7);
        make.top.equalTo(self).offset(20);
        make.width.greaterThanOrEqualTo(@(BackButtonWidth));
        make.height.equalTo(@(44));
    }];
    
    [self.smallTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backButton);
        make.left.equalTo(self.backButton.mas_right);
        make.centerX.equalTo(self);
    }];
    
    [self.rightMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backButton);
        make.width.greaterThanOrEqualTo(@(BackButtonWidth));
        make.height.equalTo(@(44));
        make.left.greaterThanOrEqualTo(self.smallTitleLabel.mas_right);
        make.right.equalTo(self);
    }];
}

#pragma mark -  设置导航只有返回箭头 没文字 也没有右边导航按钮

- (void)updateSubviewsWithoutAnyButtonTitles
{
    [self.backButton setTitle:@"" forState:UIControlStateNormal];
    
    CGFloat buttonWidth = 20;
    [self.backButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(@(buttonWidth));
    }];
    
    [self.rightMenuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(@(buttonWidth));
    }];
}

#pragma mark - 更新状态

- (void)setNavViewAlpha:(CGFloat)alpha
{
    self.smallTitleLabel.alpha = alpha;
}

#pragma mark - getter and setter

- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setTitleColor:[UIColor colorWithRed:1.00f green:0.49f blue:0.59f alpha:1.00f] forState:UIControlStateNormal];
        [_backButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
        [_backButton setImage:[UIImage imageNamed:@"icon_btn_back"] forState:UIControlStateNormal];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        _backButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;//左右方向，居左对齐
        _backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
    }
    return _backButton;
}

- (UILabel *)smallTitleLabel
{
    if (!_smallTitleLabel) {
        _smallTitleLabel = [UILabel new];
        _smallTitleLabel.font = [UIFont boldSystemFontOfSize:16];
        _smallTitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }
    return _smallTitleLabel;
}

- (UIView *)rightMenuView
{
    if (!_rightMenuView) {
        _rightMenuView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _rightMenuView;
}

@end
