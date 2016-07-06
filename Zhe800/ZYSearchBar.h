//
//  ZYSearchBar.h
//  Zhe800
//
//  Created by Darius_mac on 16/7/2.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^backBlock)();

@interface ZYSearchBar : UIView<UITextFieldDelegate>

@property (nonatomic,strong) UITextField * textField;
@property (nonatomic,strong) UIButton * leftBtn;
@property (nonatomic,strong) UIButton * rightBtn ;
@property (nonatomic,copy) backBlock back;
@end
