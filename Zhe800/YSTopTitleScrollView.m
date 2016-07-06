//
//  YSTopTitleScrollView.m
//  Zhe800
//
//  Created by Darius_mac on 16/7/1.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "UIView+YMExtension.h"
#import "YSTopTitleScrollView.h"

@implementation YSTopTitleScrollView

- (instancetype)initWithFrame:(CGRect)frame andArray:(NSArray*)titleArray
{
    self = [super initWithFrame:frame];
    if (self) {
        //底部红色指示器
        UIView *indicatorView = [[UIView alloc] init];
        indicatorView.backgroundColor = [UIColor redColor];
        indicatorView.height = 2;
        indicatorView.tag = -1;
        indicatorView.y = self.height - indicatorView.height;
        self.indicatorView = indicatorView;
        
        ///在scrollview 上的红色指示条
        self.indicatorViewScroll = [[UIView alloc] init];
        self.indicatorViewScroll.backgroundColor = [UIColor redColor];
        self.indicatorViewScroll.height = 2;
        self.indicatorViewScroll.tag = -2;
        self.indicatorViewScroll.y = self.height - self.indicatorViewScroll.height;
        
        
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(55, 0, CGRectGetWidth([UIScreen mainScreen].bounds)-50-55,36)];
        //    self.scrollView.backgroundColor = [UIColor blackColor];
        [self addSubview:_scrollView];
        
        //内部子标签
        self.titleArray = titleArray;
        NSInteger count = self.titleArray.count;
        CGFloat width = 23;
        CGFloat OldMaxX= 0;
        CGFloat height = self.height;
        self.btnArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < count; i++) {
            UIButton *button = [[UIButton alloc] init];
            button.height = height;
            button.width = width ;
            button.tag = i;
            
            [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            if (i==0) {
                button.width = 55 ;
                button.x = OldMaxX;
                [self addSubview:button];
            }else{
                button.width = width + CGRectGetWidth([button.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil]);
                [self.scrollView addSubview:button];
                button.x = OldMaxX;
                OldMaxX = button.x + button.width;
            }
            
            
            
            
            //默认点击了第一个按钮
            if (i == 0) {
                button.enabled = NO;
                self.selectedButton = button;
                //让按钮内部的Label根据文字来计算内容
                [button.titleLabel sizeToFit];
                self.indicatorView.width = button.titleLabel.width;
                self.indicatorView.centerX = button.centerX;
            }
            [self.btnArray addObject:button];
        }
        self.scrollView.contentSize = CGSizeMake(OldMaxX, 36);
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:indicatorView];
        self.indicatorViewScroll.hidden = YES;
        [self.scrollView addSubview:self.indicatorViewScroll];
        
        ///右侧的button
        UIButton * RightBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.scrollView.frame), 0,40, 36)];
        [RightBtn setImage:[UIImage imageNamed:@"muying_title_selected"] forState:UIControlStateNormal];
        [RightBtn setImage:[UIImage imageNamed:@"muying_title_unselected"] forState:UIControlStateSelected];
        [RightBtn addTarget:self  action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:RightBtn];
        self.rightBtn = RightBtn;


    }
    return self;
}

-(void)markClickWithIndex:(NSInteger)index{
    
     [self titleClick:self.btnArray[index]];
}

////内部标签点击事件
-(void)titleClick:(UIButton*)btn{
    if (self.selectedButton != btn) {
        self.selectedButton.enabled = YES;
        btn.enabled = NO;
        self.selectedButton = btn;
        [self.delegate topView:self clickBtn:btn];
        [self scrollToDistancePosionWithTag:btn];
    }
    
}

-(void)scrollToDistancePosionWithTag:(UIButton*)button{

    UIButton * lastBtn  = self.btnArray.lastObject;
    CGFloat postX = 0;
    if (CGRectGetMaxX(lastBtn.frame) - button.x > self.scrollView.width) {
        postX = button.x;
        
       [self.scrollView setContentOffset:CGPointMake(postX,0) animated:YES];
    }else{
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.width, 0)];
    }

    
    self.indicatorViewScroll.hidden = button.tag !=0 ? NO:YES;
    self.indicatorView.hidden  = button.tag !=0 ? YES:NO;
   self.indicatorViewScroll.width = button.titleLabel.width;
    self.indicatorViewScroll.centerX = button.centerX;
    

}
///TODO:顶部视图的右侧button点击事件
-(void)btnClick:(UIButton*)btn
{
    
    [self.delegate topView:self clickRightBtn:btn];
    
   }



@end
