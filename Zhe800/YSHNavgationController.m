


//
//  YSHNavgationController.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "YSHNavigationBar.h"
#import "YSHNavgationController.h"

@interface YSHNavgationController ()

@end

@implementation YSHNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"navi_back.png"];
    
    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"navi_back"];
    
    
}

/**
 *  统一所有控制器导航栏左上角的返回按钮
 *  让所有push进来的控制器，它的导航栏左上角的内容都一样
 *  能拦截所有的push操作
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //如果push进来的不是第一个控制器
    if (self.childViewControllers.count > 0) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
//        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        //        [backButton sizeToFit];
        backButton.size = CGSizeMake(70, 30);
        // 让按钮的内容往左边偏移10
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        // 让按钮内部的所有内容左对齐
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //这句super的push要放在后面，让viewController可以覆盖上面设置leftBarButtonItem
    [super pushViewController:viewController animated:YES];
}

/**
 *  返回按钮
 */
-(void)back{
    [self popViewControllerAnimated:YES];
}

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController   type:(TypeOfStyle) type
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self setUpNavBarWith:type];
        
      
        switch (type) {
            case NormalType:
                
                break;
            case HomeType:
            {
                ////tao800home_logo@2x.png
                
            
//                /Users/mac/Desktop/Zhe800/Zhe800/Resource/tao800home_message@2x.png
                
                self.navigationBar.barTintColor = [UIColor redColor];
            }
                break;
            case PureSearchType:
                
                break;
            case PersonalType:
            {
                
                self.navigationBar.barTintColor = [UIColor redColor];
                
                
            }
                break;
                
            default:
                break;
        }
    }
    return self;
}
///使用kvc 替换掉 bar
-(void)setUpNavBarWith:(TypeOfStyle)type
{
    [self setValue:[[YSHNavigationBar alloc]initWithType:type] forKey:@"navigationBar"] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    
    
    
    
    
    
    
    
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
