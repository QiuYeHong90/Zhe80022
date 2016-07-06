//
//  LogViewController.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
///Users/mac/Desktop/Zhe800/Zhe800/Resource/Icon-72.png
///Users/mac/Desktop/Zhe800/Zhe800/Resource/Icon-72@2x.png

#import "LogViewController.h"

@interface LogViewController ()<UIWebViewDelegate>

@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    NSURL * url = [NSURL URLWithString:@"http://www.zhe800.com/login?return_to=http%3A%2F%2Fwww.zhe800.com%2F"];
    NSURLRequest * request =[ NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    webView.delegate = self;
    
    UIButton * buttn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [buttn addTarget:self action:@selector(buttonCLick:) forControlEvents:UIControlEventTouchUpInside];
    [webView addSubview:buttn];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    NSLog(@"==%@",request);
    return YES;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    
}
- (IBAction)buttonCLick:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
