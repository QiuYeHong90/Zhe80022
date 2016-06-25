//
//  YSHNavSearchView.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^tapBlock)(id);
@protocol YSHNavSearchViewDelegate ;

@interface YSHNavSearchView : UIView

{
    tapBlock _block;
}
@property (nonatomic,strong)UILabel * textLab;
@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,assign) id<YSHNavSearchViewDelegate> delegate;
///初始化,并且回调点击事件 
- (instancetype)initWithFrame:(CGRect)frame block:(tapBlock)block;
@end
@protocol YSHNavSearchViewDelegate <NSObject>

@required
-(void)btnClickSearchView:(YSHNavSearchView*)searchView;

@end