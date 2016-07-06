//
//  YSTopTitleScrollView.h
//  Zhe800
//
//  Created by Darius_mac on 16/7/1.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YSToopTitleScrollViewDelegate;
@interface YSTopTitleScrollView : UIView
{
 
}
- (instancetype)initWithFrame:(CGRect)frame andArray:(NSArray*)titleArray;

-(void)markClickWithIndex:(NSInteger)index;


@property (nonatomic,assign) id<YSToopTitleScrollViewDelegate> delegate;
///指示符 在view上的
@property (nonatomic,strong)UIView *indicatorView;

///在scrollView 上的红色指示符
@property (nonatomic,strong) UIView *indicatorViewScroll;
////标题数组
@property (nonatomic,strong) NSArray * titleArray;
///scrollView 滚动视图
@property (nonatomic,strong) UIScrollView * scrollView;
///被选中的按钮
@property (nonatomic,strong) UIButton * selectedButton;
///按钮数组
@property (nonatomic,strong) NSMutableArray * btnArray;
///最右边的按钮
@property (nonatomic,strong) UIButton * rightBtn;

@property (nonatomic,strong) UILabel * choiceLab;
@end

@protocol YSToopTitleScrollViewDelegate <NSObject>
///标签点击事件
-(void)topView:(YSTopTitleScrollView*)topView clickBtn:(UIButton*)btn;
-(void)topView:(YSTopTitleScrollView *)topView clickRightBtn:(UIButton *)rithtBtn;

@end