//
//  YSHNavgationController.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "YSHHeader.h"
#import <UIKit/UIKit.h>
@interface YSHNavgationController : UINavigationController
///导航风格
@property (nonatomic,assign) TypeOfStyle navType;
///导航初始化
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController   type:(TypeOfStyle) type;
@end
