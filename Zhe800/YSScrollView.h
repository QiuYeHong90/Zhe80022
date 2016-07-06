//
//  YSScrollView.h
//  Zhe800
//
//  Created by Darius_mac on 16/7/3.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSScrollView : UIScrollView
- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray*)titleArray;
////标题数组
@property (nonatomic,strong) NSArray * titleArray;
///按钮数组
@property (nonatomic,strong) NSMutableArray * btnArray;
///被选中的按钮
@property (nonatomic,strong) UIButton * selectedButton;

@property (nonatomic,strong)UIView *indicatorView;
@end
