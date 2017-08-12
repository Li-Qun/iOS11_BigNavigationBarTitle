//
//  HFDynamicNavView.m
//  SectionDemo
//
//  Created by HF on 2017/8/12.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "HFDynamicNavView.h"


@interface HFDynamicNavView ()

@property (nonatomic, assign) CGFloat defaultBackButtonTitleWidth;

@end

@implementation HFDynamicNavView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //返回按钮文字过长被压缩 到极小宽度 显示默认返回文案
    if (self.navView.backButton.hf_width == 60) {
        NSString *defaultBackTitle = @"返回";
        CGSize titleSize = [self sizeWithText:self.backButtonTitle withFont:[UIFont systemFontOfSize:16]];
        if (titleSize.width > self.defaultBackButtonTitleWidth) {
            self.backButtonTitle = defaultBackTitle;
        }
    }
}

#pragma mark - private

- (void)configSubviews
{
    [self addSubview:self.navView];
    [self insertSubview:self.bigTitleView belowSubview:self.navView];
    
    CGSize titleSize = [self sizeWithText:@"返回" withFont:[UIFont systemFontOfSize:16]];
    self.defaultBackButtonTitleWidth = titleSize.width;
}

#pragma mark -- 计算单行宽度

- (CGSize)sizeWithText:(NSString *)text withFont:(UIFont *)font {
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}

#pragma mark - 实例方法

- (void)handleDefaultNormalNavigationBar
{
    [self dynamicNavViewAnimationWithYoffset:100];// 只要yOffset 大于等于51 就是默认高度(20 + 44) 100这里当极大值用
}

- (void)dynamicNavViewAnimationWithYoffset:(CGFloat)yOffset
{
    CGFloat headViewNormalHeight = 20 + 44;
    CGFloat smallTitleAlpha = 0;
    CGFloat bigTitleTop = 116 - 51;
    if (yOffset > 0) { //折叠。。。
        if (yOffset < 51) {
            bigTitleTop = 116 - 50 - yOffset;
            if (yOffset > 51 - 20) {
                smallTitleAlpha = 1;
            }
        } else {
            bigTitleTop = headViewNormalHeight - 49;
            smallTitleAlpha = 1;
        }
    } else {
        bigTitleTop -= yOffset;
    }
    [self.navView setNavViewAlpha:smallTitleAlpha];
     self.bigTitleView.hf_orgY = bigTitleTop;
    self.hf_height = bigTitleTop + 51;
}

#pragma mark - getter and setter

- (HFNormalNavView *)navView
{
    if (!_navView) {
        _navView = [[HFNormalNavView alloc]initWithFrame:CGRectMake(0, 0, self.hf_width, 20 + 44)];
        [_navView.backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_navView setBackgroundColor:[UIColor whiteColor]];
    }
    return _navView;
}

- (HFDynamicBigTitleView *)bigTitleView
{
    if (!_bigTitleView) {
        _bigTitleView = [[HFDynamicBigTitleView alloc]initWithFrame:CGRectMake(0, self.navView.hf_bottom, self.hf_width, 51)];
    }
    return _bigTitleView;
}

- (CGFloat)dynamicBottom
{
    return self.bigTitleView.hf_orgY;
}

- (NSString *)backButtonTitle
{
    return self.navView.backButton.titleLabel.text;
}

- (void)setBackButtonTitle:(NSString *)backButtonTitle
{
    if (!backButtonTitle) {
        backButtonTitle = @"";
    }
    [self.navView.backButton setTitle:backButtonTitle forState:UIControlStateNormal];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.navView.smallTitleLabel.text = title;
    self.bigTitleView.bigTitleLabel.text = title;
}

@end
