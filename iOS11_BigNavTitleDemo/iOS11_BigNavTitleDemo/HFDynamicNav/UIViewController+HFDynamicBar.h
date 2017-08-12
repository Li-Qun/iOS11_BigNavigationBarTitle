//
//  UIViewController+HFDynamicBar.h
//  SectionDemo
//
//  Created by HF on 2017/8/12.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFDynamicNavView.h"

@interface UIViewController (HFDynamicBar)

@property (nonatomic, strong) HFDynamicNavView *dynamicNavView;

/**
 设置 展示导航大标题样式 UI
 */
- (void)defaultShowDynamicNav;

/**
 展示滚动 导航折叠Animation  就在滚动代理方法 UIScrollViewDelegate 中实现该方法
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView

 @param scrollView scrollView
 */
- (void)showDynamicBarAnimationWithScrollView:(UIScrollView *)scrollView;

@end
