//
//  BGView.h
//  Zhe800
//
//  Created by Darius_mac on 16/7/1.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleView.h"

@protocol BGViewDelegate;

@interface BGView : UIView
- (instancetype)initWithFrame:(CGRect)frame andArray:(NSArray*)array;

@property (nonatomic,strong)TitleView * titleView;
@property (nonatomic,strong)UIView * bgView;
@property (nonatomic,assign) id<BGViewDelegate> delegate;
@property (nonatomic,assign )NSInteger index;
@end

@protocol BGViewDelegate <NSObject>

@required

-(void)bgView:(BGView*)bgView moreCategoryBtnClick:(UIButton*)btn;

-(void)bgView:(BGView *)bgView CategoryBtnClick:(UIButton *)btn;

-(void)cancelClickWithBgView:(BGView *)bgView ;


@end