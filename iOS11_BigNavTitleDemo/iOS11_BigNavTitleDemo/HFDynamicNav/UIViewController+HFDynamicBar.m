//
//  UIViewController+HFDynamicBar.m
//  SectionDemo
//
//  Created by HF on 2017/8/12.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "UIViewController+HFDynamicBar.h"
#import <objc/runtime.h>


@implementation UIViewController (HFDynamicBar)

#pragma mark - 设置 展示导航大标题样式 UI

- (void)defaultShowDynamicNav
{
    [self.view addSubview:self.dynamicNavView];
    //设置 标题
    [self.dynamicNavView setTitle:self.title];
    //设置 返回按钮标题
    NSString *backTitle = @"返回";
    NSString *showBackTitle = [UINavigationBar appearance].backItem.title;
    if (showBackTitle) {
        backTitle = showBackTitle;
    }
    [self.dynamicNavView setBackButtonTitle:backTitle];
    [self.dynamicNavView.navView.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.dynamicNavView.navView setNavViewAlpha:0];
}

#pragma mark - 展示滚动animation

- (void)showDynamicBarAnimationWithScrollView:(UIScrollView *)scrollView
{
    CGFloat yOffset = scrollView.contentOffset.y + scrollView.contentInset.top;
    [self.dynamicNavView dynamicNavViewAnimationWithYoffset:yOffset];
}

#pragma mark - event

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - getter and setter

- (HFDynamicNavView *)dynamicNavView
{
    id object = objc_getAssociatedObject(self, _cmd);
    if (! object) {
        object = [[HFDynamicNavView alloc]initWithFrame:CGRectMake(0, 0, self.view.hf_width, 20 + 44 + 51)];
        [self setDynamicNavView:object];
    }
    return object;
}

- (void)setDynamicNavView:(HFDynamicNavView *)dynamicNavView
{
    objc_setAssociatedObject(self, @selector(dynamicNavView), dynamicNavView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
