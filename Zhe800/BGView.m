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
        bgView.backgroundColor = [UIColor getColorWithString:@"99,99,99,0.9"];
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
        
        
    }
    return self;
}

-(void)setIndex:(NSInteger)index{
    _index = index;
    self.titleView.index = index;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.delegate cancelClickWithBgView:self];
}

@end
