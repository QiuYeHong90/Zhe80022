//
//  Tool.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/27.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

@property (nonatomic,strong) NSDictionary * tagDictionary;
@property (nonatomic,strong) NSArray * titleArray;
@property (nonatomic,strong) NSMutableDictionary * PICDict;
///热门品牌
@property (nonatomic,strong) NSMutableDictionary * hotBrand;

+(instancetype)managerTool;
-(void)getScrollDataSuccess:(void (^)(NSArray* responseObject))success
                    failure:(void (^)(NSError *error))failure;
///首页数据
-(void)get:(NSString*)str DataSuccess:(void(^)(id obj))success failure:(void (^)(NSError *error))failure;

///商品列表获取数据方法
-(void)getShopDataWithUrl:(NSString*)url Success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure;

///对get的封装 
-(void)GETDataWithUrl:(NSString*)url parameters:(id)parameters    Success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;

//=============第二个界面的数据
-(void)getSecondDataWithSuccess:(void (^)(id responseObject))success
                        failure:(void (^)(NSError *error))failure;
///公共的数据
-(void)getComnDataWithSuccess:(void (^)(NSDictionary* responseObject))success failure:(void (^)(NSError *error))failure;




@end
