# iOS11_BigNavigationBarTitle
仿 iOS11 大导航标题 UI
适用范围 iOS8 +
## 前言
iOS11全面应用大标题设计,（岂止于大—— 比逼格更逼格！）bigger than bigger. 
突出的大标题 特点：
> *  突出的大而粗的标题
> *  iOS 11标题设计的大且粗，把醒目优先级提到了最高
> *  明确整个page核心，结构更明朗，让用户减少疑惑
很多设计师把Apple、google或者微软的用户界面标准奉若神明，觉得只要是他们说的，都是对的 好看不好看，我相信必定还会引起国内的国产手机UI设计追“大苹果风”。


如果你们的设计师也已经开始设计了这种大标题导航的UI,并且让你适配到iOS11以下的iOS10 iOS9 iOS8 那么特别希望 我写的 这个小demo 能够帮到你，毕竟维护自家产品一般不可能只限制用户用iOS11系统吧。。。

效果图是这样的：

 ![image]( https://github.com/Li-Qun/iOS11_BigNavigationBarTitle/blob/master/iOS11_BigNavTitleDemo/show2.gif)
 
 为了使用方便，本人特意写了类别方法 UIViewController+HFDynamicBar.h
 
 ```python
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
 ```
## 使用方法 分5步：
> *  [self defaultShowDynamicNav];//导航大标题展示  【1】放在tableView 的上层
> *  [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(self.dynamicNavView.dynamicBottom));/////修改起始高度 【2】这个起始位置相对还是64
        make.left.right.bottom.equalTo(self.view);
    }];
> *  tableView.contentInset = UIEdgeInsetsMake(self.dynamicNavView.bigTitleView.hf_height, 0, 0, 0);////这行代码必须有 【3】为了连贯联动效果
> *  [tableView setContentOffset:CGPointMake(self.view.hf_width, - self.dynamicNavView.bigTitleView.hf_height) animated:NO];////这行代码必须有 【4】为了连贯联动效果
> * [self showDynamicBarAnimationWithScrollView:scrollView]; //该代码选择实现 需要导航折叠Animation 就要在该代理方法里面实现 不滚动就是默认大标题 【5】选择性实现
    
 ## 可扩展  
 
 暴露的属性都是可读写的，任何需要的地方可直接扩展 （比如添加右边导航按钮 。。。）
 注意要点：标题居中，约束合法
