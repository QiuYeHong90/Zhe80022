//
//  YSScrollView.m
//  Zhe800
//
//  Created by Darius_mac on 16/7/3.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "YSScrollView.h"
#import "UIView+YMExtension.h"
@implementation YSScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray*)titleArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //底部红色指示器
        UIView *indicatorView = [[UIView alloc] init];
        indicatorView.backgroundColor = [UIColor redColor];
        indicatorView.width = 5;
        
        indicatorView.tag = -1;
        indicatorView.x = 0;
        self.indicatorView = indicatorView;
        
        
        CGFloat btHeight = 60;
        self.titleArray = titleArray;
        self.btnArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < titleArray.count; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, btHeight*i, 90, btHeight)];
            
//            button.height = btHeight;
//            button.width = 95 ;
            button.tag = i;
//            button.y = btHeight*i;
//            button.x = 5;
//            button.backgroundColor = [UIColor redColor];
            [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
//            button.titleLabel.font = [UIFont systemFontOfSize:20];
            [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.textAlignment = NSTextAlignmentLeft;
            
            
            //默认点击了第一个按钮
            if (i == 0) {
                button.enabled = NO;
                self.selectedButton = button;
                //让按钮内部的Label根据文字来计算内容
                [button.titleLabel sizeToFit];
                self.indicatorView.height = button.height;
                self.indicatorView.centerY = button.centerY;
            }
            [self.btnArray addObject:button];
            [self addSubview:button];
            
        }
        
        
        self.contentSize = CGSizeMake(self.width,self.titleArray.count*btHeight);
        self.showsVerticalScrollIndicator = NO;
        [self addSubview:indicatorView];
        
        
    }
    return self;
}

////内部标签点击事件
-(void)titleClick:(UIButton*)btn{
    if (self.selectedButton != btn) {
        self.selectedButton.enabled = YES;
        btn.enabled = NO;
        self.selectedButton = btn;
//        [self.delegate topView:self clickBtn:btn];
        [self scrollToDistancePosionWithTag:btn];
        NSLog(@"=========我被点击了");
    }
    
}

-(void)scrollToDistancePosionWithTag:(UIButton*)button{
    
    UIButton * lastBtn  = self.btnArray.lastObject;
    CGFloat postX = 0;
    if (CGRectGetMaxX(lastBtn.frame) - button.x > self.width) {
        postX = button.x;
        
        [self setContentOffset:CGPointMake(postX,0) animated:YES];
    }else{
        [self setContentOffset:CGPointMake(self.contentSize.width - self.width, 0)];
    }
    
    
//    self.indicatorViewScroll.hidden = button.tag !=0 ? NO:YES;
//    self.indicatorView.hidden  = button.tag !=0 ? YES:NO;
//    self.indicatorViewScroll.width = button.titleLabel.width;
//    self.indicatorViewScroll.centerX = button.centerX;
    
    
}

@end
