//
//  ViewController.m
//  iOS11_BigNavTitleDemo
//
//  Created by HF on 2017/8/12.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+HFDynamicBar.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.clipsToBounds = YES;
    self.title = @"Setting";
    

    tableView = [[UITableView alloc]init];
    [self.view addSubview:tableView];
    
    [self defaultShowDynamicNav];//导航大标题展示  【1】放在tableView 的上层
    [self.dynamicNavView.navView.backButton setHidden:YES];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(self.dynamicNavView.dynamicBottom));/////修改起始高度 【2】这个起始位置相对还是64
        make.left.right.bottom.equalTo(self.view);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.contentInset = UIEdgeInsetsMake(self.dynamicNavView.bigTitleView.hf_height, 0, 0, 0);////这行代码必须有 【3】为了连贯联动效果
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSInteger row =  indexPath.row;
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    if (row == 0) {
        cell.textLabel.text = @"二级页面不可滚动";
    }
    if (row == 1) {
        cell.textLabel.text = @"二级页面custom普通导航";
    }
    if (row == 2) {
        cell.textLabel.text = @"二级页面可滚带返回按钮";
    }
    if (row == 3) {
        cell.textLabel.text = @"二级页面systom普通导航";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row =  indexPath.row;
    if (row == 0) {
        
        FirstViewController *vc = [[FirstViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (row == 1) {
        SecondViewController *vc = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (row == 2) {
        FourViewController *vc = [[FourViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (row == 3) {
        ThirdViewController *vc = [[ThirdViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //下面代码选择实现 需要导航折叠Animation 就要在该代理方法里面实现 不滚动就是默认大标题 【4】选择性实现
    ////
    [self showDynamicBarAnimationWithScrollView:scrollView];
    ///
}

@end
