//
//  AppDelegate.m
//  iOS11_BigNavTitleDemo
//
//  Created by HF on 2017/8/12.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ViewController *homeVC = [ViewController new];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = navC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self setNavigatonBarAppear];
    
    return YES;
}

#pragma mark - UI

- (void)setNavigatonBarAppear {
    [UINavigationBar appearance].translucent = NO;
    //导航相关字体颜色设置
    UIFont *font = [UIFont boldSystemFontOfSize:16.0];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : font,
                                     NSForegroundColorAttributeName : [UIColor blackColor]
                                     };
    
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];//修改字体颜色及字体大小
    UIColor *mainColor = [UIColor colorWithRed:1.00f green:0.49f blue:0.59f alpha:1.00f];
    [[UINavigationBar appearance] setTintColor:mainColor];//导航键颜色
}


@end
