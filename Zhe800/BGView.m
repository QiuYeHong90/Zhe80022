//
//  BGView.m
//  Zhe800
//
//  Created by Darius_mac on 16/7/1.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "BGView.h"

#import "UIColor+String.h"
#import "UIView+YMExtension.h"
@implementation BGView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame andArray:(NSArray*)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        UIView * bgView = [[UIView alloc]initWithFrame:self.bounds];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.5;
        self.bgView = bgView;
        [self addSubview:bgView];
        
        TitleView * titleView = [[TitleView alloc]initWithArray:array];
        self.titleView = titleView;
        titleView.x = self.x;
        titleView.y = -titleView.height;
        typeof(self) weakSelf = self;
        titleView.moreCategoryBtnClick = ^(UIButton* btn){
            [weakSelf.delegate bgView:weakSelf moreCategoryBtnClick:btn];
        };
        
        titleView.categoryBtnClick = ^(UIButton *btn){
            [weakSelf.delegate bgView:weakSelf CategoryBtnClick:btn];
        };
        [self addSubview:titleView];
        
        self.backgroundColor = [UIColor clearColor];
        [self addVisualEffectView];
        
        
    }
    return self;
}

- (void)addVisualEffectView
{
    
    //    [view setBackgroundColor:[UIColor whiteColor]];
    //    [view.layer setShadowOffset:CGSizeMake(-2.0, -2.0)];
    //    [view.layer setShadowPath:[[UIBezierPath bezierPathWithRect:CGRectMake(0.0, 0.0, view.bounds.size.width + 4.0, view.bounds.size.height + 4.0)] CGPath]];
    //    [view.layer setShadowColor:[[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5] CGColor]];
    //    [view.layer setShadowOpacity:0.5];
    
    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    [visualEffectView setFrame:self.titleView.bounds];
    [self.titleView addSubview:visualEffectView];
    [self.titleView insertSubview:visualEffectView atIndex:0];
}
-(void)setIndex:(NSInteger)index{
    _index = index;
    self.titleView.index = index;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.delegate cancelClickWithBgView:self];
}

@end
