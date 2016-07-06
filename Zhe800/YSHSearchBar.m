//
//  YSHSearchBar.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#define YSHCOLOR(r,g,b,a)    colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)
#import "YSHHeader.h"
#import "YSHSearchBar.h"

@implementation YSHSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
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

    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.imageView.image) {
        self.imageView.frame = CGRectMake(30, 0,20,20);
        self.imageView.center = CGPointMake(self.imageView.center.x,self.center.y);
    }
    
    self.textLab.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+10, 0, CGRectGetWidth(self.frame)-CGRectGetMaxX(self.imageView.frame)+10, 24);
    self.textLab.center = CGPointMake(self.textLab.center.x,self.center.y);

}
@end
