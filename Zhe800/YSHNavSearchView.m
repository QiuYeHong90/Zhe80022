//
//  YSHNavSearchView.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#define YSHCOLOR(r,g,b,a)    colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)
#import "YSHNavSearchView.h"
#import "YSHHeader.h"
#import "UIView+ImageWihtColor.h"
@implementation YSHNavSearchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame block:(tapBlock)block
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        
        self.backgroundColor = [UIColor YSHCOLOR(207, 1, 11, 1)];
        self.imageView = [[UIImageView alloc]init];
        [self addSubview:self.imageView];
        
        self.textLab = [[UILabel alloc]init];
        self.textLab.text = @"畅享足球激情时刻";
        self.textLab.textColor = [UIColor whiteColor];
        [self addSubview:self.textLab];
        ///加手势比较卡动画
//        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
//        [self addGestureRecognizer:tap];
        _block = block;
        UIButton * btn = [[UIButton alloc]initWithFrame:frame];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
        /// - (UIImage*) createImageWithColor: (UIColor*) color
        [btn setBackgroundImage:[btn ImageFromColor:[UIColor redColor]] forState:UIControlStateHighlighted];
        
        [self addSubview:btn];
    }
    return self;
}


-(void)btnClick{
    [self.delegate btnClickSearchView:self];
}
-(void)tapView:(UITapGestureRecognizer*)tap
{
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.imageView.image) {
        self.imageView.frame = CGRectMake(30, 0,20,20);
        self.imageView.center = CGPointMake(self.imageView.center.x,self.center.y);
    }
    
    self.textLab.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+10, 0, CGRectGetWidth(self.frame)-CGRectGetMaxX(self.imageView.frame)+10, 24);
    self.textLab.center = CGPointMake(self.textLab.center.x,self.center.y);
    
}

@end
