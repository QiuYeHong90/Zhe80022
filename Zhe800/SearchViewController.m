//
//  SearchViewController.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "SearchViewController.h"
#import "EMSearchBar.h"
#import "UIView+YMExtension.h"
#import "SearchReaultViewController.h"

#import "ZYSearchBar.h"
@interface SearchViewController ()<UISearchDisplayDelegate,UISearchBarDelegate>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZYSearchBar * searchBar = [[ZYSearchBar alloc]initWithFrame:CGRectMake(0, 20,self.view.width,44)];
    [self.view addSubview:searchBar];
    typeof(self) weakSelf = self;
    searchBar.back = ^(){
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
    
    
    
    
    
    
    
    
    
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
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
