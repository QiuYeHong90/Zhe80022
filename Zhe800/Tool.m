//
//  Tool.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/27.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//


#import "Tool.h"
#import "DataModels.h"
#import <UIKit+AFNetworking.h>
#import <UIImageView+WebCache.h>
@implementation Tool
+(instancetype)managerTool
{
    static id tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[Tool alloc]init];
        
    });
    return tool;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.titleArray = @[@"推荐",@"男装",@"数码家电",@"文娱运动",@"鞋品",@"美食",@"居家",@"女装",@"内衣",@"美妆配饰",@"儿童",@"箱包",@"家纺家装",@"母婴",@"中老年"];
        self.tagDictionary = @{@"男装":@"wireless1004",
                               @"数码家电":@"wireless3296",
                               @"文娱运动":@"wireless1015",
                               @"鞋品":@"wireless1009",
                               @"美食":@"wireless1008",
                               @"居家":@"wireless1006",
                               @"女装":@"wireless1002",
                               @"内衣":@"wireless1003",
                               @"美妆配饰":@"wireless1007",
                               @"儿童":@"wireless1011",
                               @"箱包":@"wireless1010",
                               @"家纺家装":@"wireless1005",
                               @"母婴":@"wireless1012",
                               @"中老年":@"wireless3469"};
        
        
        self.hotBrand = [[NSMutableDictionary alloc]init];
        
        
    }
    return self;
}


-(NSMutableDictionary *)PICDict{
    if (!_PICDict) {
        
    }
    return _PICDict;
}

//http://m.api.zhe800.com/tags/v2?user_type=1&user_role=1&student=0&image_model=webp
-(void)GETDataWithUrl:(NSString*)url parameters:(id)parameters    Success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
    
        success(responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        failure(error);
    }];

}



//http://m.api.zhe800.com/brand/wall/v1?user_role=1&student=0&image_model=webp&user_type=1
-(void)getComnDataWithSuccess:(void (^)(NSDictionary* responseObject))success failure:(void (^)(NSError *error))failure{
    
    if (!self.PICDict) {
        self.PICDict = [[NSMutableDictionary alloc]init];
        [self GETDataWithUrl:@"http://m.api.zhe800.com/tags/v2?user_type=1&user_role=1&student=0&image_model=webp" parameters:nil Success:^(id responseObject) {
            NSArray * array = responseObject;
            NSMutableArray * tempMutArr  = [NSMutableArray array];
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                IMGCategory * imgCate = [IMGCategory modelObjectWithDictionary:obj];
                [tempMutArr addObject:imgCate];
                
            }];
            
            for (int i = 1; i< self.titleArray.count; i++) {
                NSString * str = self.tagDictionary[self.titleArray[i]];
                
                NSPredicate * predicate = [NSPredicate predicateWithFormat:@"parentUrlName=%@",str];
                ///parentUrlName
                NSArray * objArray  = [tempMutArr filteredArrayUsingPredicate:predicate];
                
                [self.PICDict setObject:objArray forKey:self.titleArray[i]];
                
            }
            success(self.PICDict);
            
        } failure:^(NSError *error) {
            failure(error);
        }];

    }else{
        success(self.PICDict);
    }
    
    
   
}




//=============第二个界面的数据
-(void)getSecondDataWithSuccess:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure{
    if (self.hotBrand.count == 0) {
        
        [self GETDataWithUrl:@"http://m.api.zhe800.com/brand/wall/v1?user_role=1&student=0&image_model=webp&user_type=1" parameters:nil Success:^(id responseObject) {
            
            CLASSBase * base = [CLASSBase modelObjectWithDictionary:responseObject];
            
            
            for (int i = 1; i< self.titleArray.count; i++) {
                NSString * str = self.tagDictionary[self.titleArray[i]];
                
                NSPredicate * predicate = [NSPredicate predicateWithFormat:@"brandUrlName=%@",str];
                ///parentUrlName
                NSArray * objArray  = [base.objects filteredArrayUsingPredicate:predicate];
                
                [self.hotBrand setObject:objArray forKey:self.titleArray[i]];
                
            }
            
            
            
            success(self.hotBrand);
            
            
            
            
        } failure:^(NSError *error) {
            failure(error);
        }];

    }
   
}




-(void)get:(NSString*)str DataSuccess:(void(^)(id obj))success failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:str parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
     
        
        
        
            
            
            NSArray  *array = [NSJSONSerialization JSONObjectWithData: [responseObject[@"/homepromotion/v3"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
            
            
            success(array);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"是字典");
        }

        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
         failure(error);
    }];

}
///http://m.api.zhe800.com/v5/deals?image_type=si3&image_model=webp&user_type=1&user_role=1&student=0&url_name=&super=2&deal_source=1&baoyou_type=1&show_config=1&page=1&per_page=20
-(void)getShopDataWithUrl:(NSString*)url Success:(void (^)(id responseObject))success
failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        id  array = responseObject;
        NSLog(@"===%@",array);
        SHOPBase * shopBase = [SHOPBase modelObjectWithDictionary:responseObject];
        
        success(shopBase);
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        failure(error);
    }];
}


-(void)getScrollDataSuccess:(void (^)(NSArray* responseObject))success
                    failure:(void (^)(NSError *error))failure
{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://m.api.zhe800.com/tao800/bannerv2.json?banner_types=17%2C1%2C10%2C16%2C99&platform=android&channelid=918ee9&productkey=tao800&cityid=410104&url_name=&userType=1&userRole=1&unlock=1&image_model=webp" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSArray * array = responseObject;
        NSMutableArray * temp = [[NSMutableArray alloc]init];

        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            YSBase * base = [YSBase modelObjectWithDictionary:obj];
            [temp addObject:base];
        }];
        success(temp);
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        failure(error);
    }];
    
   
}


@end
