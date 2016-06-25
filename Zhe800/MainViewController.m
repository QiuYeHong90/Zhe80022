//
//  MainViewController.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/24.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#define DWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0] //<<< 用10进制表示颜色，例如（255,255,255）黑色
#import "MainViewController.h"
#import "GroupViewController.h"
#import "FirstViewController.h"
#import "ClassViewController.h"
#import "ShoppingCartViewController.h"
#import "PersonalViewController.h"
#import "UIView+YMExtension.h"
#import "YSHNavgationController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self setUpTabBarTextAttributes];
   
     [self setUpChildViewControllers];
    
    
    

    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    
}
/**
 * 设置子视图
 */
-(void)setUpChildViewControllers
{
    NSArray * classArray =
    @[@{@"className":NSStringFromClass([FirstViewController class]),
        @"title":@"首页",
        @"imageName":@"home_tab_home_btn",
        @"imageNameSelected":@"home_tab_home_selected_btn",
        @"type":@(HomeType) },
      @{@"className":NSStringFromClass([ClassViewController class]),
        @"title":@"分类",
        @"imageName":@"home_tab_saunter_btn",
        @"imageNameSelected":@"home_tab_saunter_selected_btn",
        @"type":@(PureSearchType)},
      @{@"className":NSStringFromClass([GroupViewController class]),
        @"title":@"品牌团",
        @"imageName":@"home_tab_branc_btn",
        @"imageNameSelected":@"home_tab_branc_selected_btn",
        @"type":@(NormalType)},
      @{@"className":NSStringFromClass([ShoppingCartViewController class]),
        @"title":@"购物车",
        @"imageName":@"home_tab_shopcart_btn",
        @"imageNameSelected":@"home_tab_shopcart_selected_btn",
        @"type":@(NormalType)},
      @{@"className":NSStringFromClass([PersonalViewController class]),
        @"title":@"个人中心",
        @"imageName":@"home_tab_personal_btn",
        @"imageNameSelected":@"home_tab_personal_selected_btn",
        @"type":@(PersonalType)}];
    
    for (NSDictionary * dic in classArray) {
        NSString * className = dic[@"className"];
        UIViewController * vc = [[NSClassFromString(className) alloc]init];
        vc.view.backgroundColor = [UIColor yellowColor];
        YSHNavgationController * nav = [[YSHNavgationController alloc]initWithRootViewController:vc type:[dic[@"type"] integerValue]];
        [self addChildViewController:nav];
        vc.tabBarItem.title = dic[@"title"];
        [vc.tabBarItem setImage:[UIImage imageNamed:dic[@"imageName"]]];
        UIImage * image = [UIImage imageNamed:dic[@"imageNameSelected"]];
        UIImage * newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setSelectedImage:newImage];
        
    }
}
/**
 *  tabBarItem 的选中和不选中文字属性
 */

-(void)setUpTabBarTextAttributes
{
    NSDictionary * normalAtt =
    @{NSForegroundColorAttributeName:[UIColor grayColor],
      NSFontAttributeName:[UIFont systemFontOfSize:10]};
    NSDictionary * selectedAtt =
  @{NSForegroundColorAttributeName:[UIColor redColor],
    NSFontAttributeName:[UIFont systemFontOfSize:10]};
    UITabBarItem * tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAtt forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAtt forState:UIControlStateSelected];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
