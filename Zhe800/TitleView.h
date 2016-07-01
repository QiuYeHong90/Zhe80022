//
//  TitleView.h
//  Zhe800
//
//  Created by Darius_mac on 16/7/1.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton*);
@interface TitleView : UIView
- (instancetype)initWithArray:(NSArray*)array;

@property (nonatomic,copy) ButtonBlock moreCategoryBtnClick;
@property (nonatomic,copy) ButtonBlock categoryBtnClick;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,strong) NSMutableArray * titleArray;

@property (nonatomic,assign )UIButton * selectedBtn;
@end
