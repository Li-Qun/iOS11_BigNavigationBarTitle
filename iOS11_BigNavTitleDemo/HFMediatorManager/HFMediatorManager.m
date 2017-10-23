//
//  HFMediatorManager.m
//  HFMediator
//
//  Created by HF on 2017/10/23.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "HFMediatorManager.h"

// NSUserDefaults
#define kUSERDEFAULTS_OBJ_KEY(key)              [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define KUSERDEFAULTS_SET_OBJ_KEY(_obj_,_key_)  [[NSUserDefaults standardUserDefaults] setObject:_obj_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]
#define kUSERDEFAULTS_SET_VOBJ_KEY(_value_,_key_)    [[NSUserDefaults standardUserDefaults] setValue:_value_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]
//

#define HFUSER_UID @"HFMUser_Uid"
#define HFUSER_AUTHORIZATION @"HFMUser_Authorization"

@implementation HFMediatorManager

#pragma mark - read / cache
#pragma mark -- read
+ (NSString *)uid
{
    return kUSERDEFAULTS_OBJ_KEY(HFUSER_UID);
}

+ (NSString *)authorization
{
    return kUSERDEFAULTS_OBJ_KEY(HFUSER_AUTHORIZATION);
}

#pragma mark -- cache
+ (void)setUid:(NSString *)uid
{
    kUSERDEFAULTS_SET_VOBJ_KEY(uid, HFUSER_UID);
}

+ (void)setAuthorization:(NSString *)authorization
{
    kUSERDEFAULTS_SET_VOBJ_KEY(authorization, HFUSER_AUTHORIZATION);
}

@end
