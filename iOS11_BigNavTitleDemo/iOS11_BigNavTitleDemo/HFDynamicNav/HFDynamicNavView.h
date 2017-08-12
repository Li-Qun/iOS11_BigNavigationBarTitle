//
//  HFDynamicNavView.h
//  SectionDemo
//
//  Created by HF on 2017/8/12.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFNormalNavView.h"
#import "HFDynamicBigTitleView.h"

@interface HFDynamicNavView : UIView

@property (nonatomic, strong) HFNormalNavView *navView;
@property (nonatomic, strong) HFDynamicBigTitleView *bigTitleView;
@property (nonatomic, strong) NSString *title; //设置导航标题
@property (nonatomic, strong) NSString *backButtonTitle;//设置导航返回名称
@property (nonatomic, assign) CGFloat  lastYoffset;
@property (nonatomic, assign,readonly) CGFloat  dynamicBottom; //跟踪大标题底部位置变化 是视图控制器中其他Ui的起始高度

/**
 可以手动设置使用默认 通用正常导航
 */
- (void)handleDefaultNormalNavigationBar;

/**
 在滚代理方法里面获取偏移量
 根据变化偏移量设置导航UI效果animation
 
 @param yOffset 变化偏移量
 */
- (void)dynamicNavViewAnimationWithYoffset:(CGFloat)yOffset;


@end
