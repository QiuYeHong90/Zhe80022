
//
//  TitleView.m
//  Zhe800
//
//  Created by Darius_mac on 16/7/1.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "TitleView.h"
#import "UIView+YMExtension.h"
#import "UIColor+String.h"

@interface ZYButton : UIButton
@property (nonatomic,strong) UIImageView * zy_imagView;
@property (nonatomic,strong) UILabel * zy_label;
@end

@implementation ZYButton
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.zy_imagView = [[UIImageView alloc]init];
        [self addSubview:self.zy_imagView];
        self.zy_label = [[UILabel alloc]init];
        [self addSubview:self.zy_label];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
   
    self.zy_label.width = self.width*282.f/469.f;
    self.zy_label.height = self.height;
    self.zy_label.x = 0;
    self.zy_label.y = 0;
    self.zy_imagView.width = self.height*43.f/106.f;
    self.zy_imagView.height = self.zy_imagView.width;
    self.zy_imagView.x = self.width*(1-152.f/469.f);
    self.zy_imagView.centerY = self.height/2;
    self.zy_imagView.layer.cornerRadius = self.zy_imagView.width/2;
    self.zy_imagView.clipsToBounds = YES;
    self.zy_imagView.layer.borderColor = [UIColor blackColor].CGColor;
    self.zy_imagView.layer.borderWidth = 1;
   
}
@end

@implementation TitleView


- (instancetype)initWithArray:(NSArray*)array
{
    self = [super init];
    if (self) {
        self.width = [UIScreen mainScreen].bounds.size.width;
       
        CGFloat height = 0;
        self.titleArray  = [[NSMutableArray alloc]init];
        for (int i = 0 ; i<array.count; i++) {
            NSString * title = array[i];
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i;
            btn.width = self.width/4;
            btn.height = 45;
            btn.x = (i%4)*btn.width;
            btn.y = (i/4)*btn.height;
            [btn setTitle:title forState:UIControlStateNormal];
            [self addSubview:btn];
            [btn addTarget:self  action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
//            btn.backgroundColor = [UIColor getColorWithString:@"240,236,236,1"];
            height = btn.height + btn.y;
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.layer.borderColor = [UIColor getColorWithString:@"214,214,213,1"].CGColor;
            btn.layer.borderWidth = 0.7;
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            if (i==0) {
                btn.selected = YES;
                self.selectedBtn = btn;
            }
            
            [self.titleArray addObject:btn];
        }
        ZYButton * btn = [[ZYButton alloc]init];
        
        
        
        btn.zy_imagView.image = [UIImage imageNamed:@"common_webbar_forward_gray_btn"];
        btn.width = self.width*396.f/1080.f;
        btn.height = 35.7;
        btn.centerX = self.centerX;
        btn.y = height + 8;
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds = YES;
        [btn addTarget:self  action:@selector(buttoClick:) forControlEvents:UIControlEventTouchUpInside];

        btn.zy_label.text = @"更多分类";
        btn.tag = 100;
        btn.zy_label.font = [UIFont systemFontOfSize:15];
        btn.backgroundColor = [UIColor whiteColor];
        btn.alpha = 0.5;
        
        
        
        
        
        btn.zy_label.textAlignment = NSTextAlignmentRight;
        
        
        [self addSubview:btn];
        self.backgroundColor = [UIColor clearColor];
        height = btn.y + btn.height + 13;
        
        
        
        self.height = height;
        
    }
    return self;
}
-(void)setIndex:(NSInteger)index{
    if (_index!= index) {
        _index = index;
        self.selectedBtn.selected = NO;
        UIButton * btn = self.titleArray[index];
        btn.selected = YES;
        self.selectedBtn = btn;
    }
    
}


-(void)buttoClick:(ZYButton*)btn {
    
    NSLog(@"更多分类");
    
    if (self.moreCategoryBtnClick) {
        self.moreCategoryBtnClick(btn);
    }
    
}
-(void)btClick:(UIButton *)btn{
    NSLog(@"===%ld",btn.tag);
    self.index = btn.tag;
    if (self.categoryBtnClick) {
        self.categoryBtnClick(btn);
    }
}
@end
