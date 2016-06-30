
//
//  YSHCollectionViewCell.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "UIView+YMExtension.h"
#import "YSHCollectionViewCell.h"
#import "SubCollectionViewCell.h"
#import "DataModels.h"
#import <UIKit+AFNetworking.h>
#import <UIImageView+WebCache.h>
//#import "UIImageView+WebCache"
@implementation YSHCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
        for (int i = 0; i<6; i++) {
        UIImageView * imageView = [[UIImageView alloc]init];
        [self.scrollView addSubview:imageView];
            imageView.hidden = YES;
    }
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
}

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = nil;
    _dataArray =dataArray;
    if (_dataArray.count != 0) {
        [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.hidden = YES;
           
            if ([obj isKindOfClass:[UIImageView class]]) {
                if (idx>dataArray.count-1) {
                    obj.hidden = YES;
                }else{
                    obj.hidden = NO;
                    UIImageView * imageView = (UIImageView *)obj;
                    YSBase * base  = _dataArray[idx];
                    NSString * str = [base.imageBigIosUrl componentsSeparatedByString:@".webp"][0];
                    NSLog(@"imageViewstr===%@",str);
                    [imageView sd_setImageWithURL:[NSURL URLWithString:str]];
                    imageView.frame =CGRectMake(CGRectGetWidth(self.scrollView.frame)*idx,0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
                }
                
                
            }
        }];
         self.scrollView.contentSize = CGSizeMake(self.scrollView.width*dataArray.count, self.scrollView.height);
    }
    
       
    
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //http://m.api.zhe800.com/tao800/bannerv2.json?banner_types=17%2C1%2C10%2C16%2C99&platform=android&channelid=918ee9&productkey=tao800&cityid=410104&url_name=&userType=1&userRole=1&unlock=1&image_model=webp
     
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
}
@end
