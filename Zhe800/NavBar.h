//
//  NavBar.h
//  Zhe800
//
//  Created by Darius_mac on 16/7/3.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NavBar;
typedef void(^BarCLick)(NavBar *);

@interface NavBar : UIView<UISearchBarDelegate>

@property (nonatomic,copy) BarCLick barClickPush;

@end
