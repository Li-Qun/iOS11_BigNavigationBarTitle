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
}


@end
