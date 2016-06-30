//
//  YSHChildViewController.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "YSHChildViewController.h"

@interface YSHChildViewController ()

@end

@implementation YSHChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    switch (self.index) {
        case 0:
        {
            self.view.backgroundColor = [UIColor redColor];
            
        }
            break;
        case 1:
        {
            UIButton  * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
            btn.backgroundColor = [UIColor blueColor];
            [self.view addSubview:btn];
            self.view.backgroundColor = [UIColor blackColor];
        }
            break;
        case 2:
        {
            self.view.backgroundColor = [UIColor blueColor];
        }
            break;
            
        default:
            break;
    }
    
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
