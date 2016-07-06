//
//  DetailShopViewController.m
//  Zhe800
//
//  Created by Darius_mac on 16/7/4.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "DetailShopViewController.h"
#import <AFNetworking.h>
@interface DetailShopViewController ()<UIWebViewDelegate>

@end

@implementation DetailShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.webView.delegate = self;
//    NSSet * sets = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
//    
//  
//    //1.将网址初始化成一个OC字符串对象
//    NSString *urlStr = self.urlStr;
//    // 如果网址中存在中文,进行URLEncode
//    NSString *newUrlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    // 2.构建网络URL对象, NSURL
//    NSURL *url = [NSURL URLWithString:newUrlStr];
//    // 3.创建网络请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
//    // 创建同步链接
//    NSURLResponse *response = nil;
//    NSError *error = nil;
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    
//    if (!error) {
////        NSLog(@"===%@",data);
//        NSError * errorr = nil;
//        id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorr];
//        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"===%@",obj);
//        
////        [self.webView loadHTMLString:str baseURL:nil];
//        
//        
//    }else{
//        NSLog(@"error ==%@",error);
//    }
    
    
    self.webView.delegate = self;
    
//    
//    [AFHTTPSessionManager manager].responseSerializer.acceptableContentTypes = sets;
//    [[AFHTTPSessionManager manager] GET:self.urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"===%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error ----%@",error);
//    }];
//    
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"===%@",request.URL.absoluteString);
    
    return YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (IBAction)backgo:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)butnSeclet:(UIButton *)sender {
    
    
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
