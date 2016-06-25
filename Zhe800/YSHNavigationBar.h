//
//  YSHNavigationBar.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "YSHHeader.h"
#import <UIKit/UIKit.h>

@interface YSHNavigationBar : UINavigationBar
{
    UIImageView * _imageView;
    
}
@property (nonatomic,assign)TypeOfStyle type;
- (instancetype)initWithType:(TypeOfStyle)type;
@property (nonatomic,strong) UISearchBar * searchBar;
@end
