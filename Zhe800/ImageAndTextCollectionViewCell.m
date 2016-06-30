//
//  ImageAndTextCollectionViewCell.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/26.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "UIView+YMExtension.h"
#import <UIImageView+WebCache.h>
#import "ImageAndTextCollectionViewCell.h"
#import "UIColor+String.h"
#import "NSString+big.h"
@implementation ImageAndTextCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setObject:(SHOPObjects *)object
{
    _object = nil;
    _object = object;
    SHOPImageUrl * imageUrl = object.imageUrl;
    NSString *str = [imageUrl.si3 componentsSeparatedByString:@".webp"][0];
    NSURL * url = [NSURL URLWithString:str];
    [self.imageView sd_setImageWithURL:url];
    
    self.detail.text = object.shortTitle;
    NSString * lastText = object.configInfo.activityText;
    if (![lastText isEqualToString:@""]) {
        self.lastShop.text  = lastText;
        self.lastShop.textColor = [UIColor getColorWithString:object.configInfo.activityColor];
        self.lastShop.backgroundColor = [UIColor getColorWithString:object.configInfo.activityBgColor];
    }

    NSLog(@"==%@",lastText);
    ////字体大小没有改动 查查灵感
    NSString * newStr = [NSString stringWithFormat:@"%d",(int)object.price/100] ;
    NSString * longStr  = [NSString stringWithFormat:@"¥%.1f",object.price/100];
    
    NSRange range  = [longStr rangeOfString:newStr];
    NSMutableAttributedString * mutAttStr = [[NSMutableAttributedString alloc]initWithString:longStr attributes:@{NSForegroundColorAttributeName:[UIColor redColor]} ];
    
    [mutAttStr setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25],NSForegroundColorAttributeName:[UIColor redColor]} range:range];
    ///价格
    self.price.attributedText =mutAttStr;
    
    
    ///包邮
    
    self.send.text = object.configInfo.baoyouText;
    self.send.textColor = [UIColor getColorWithString:object.configInfo.baoyouColor];
    ///已经售货多少
    self.sold.text = [NSString stringWithFormat:@"%.f件已售",object.salesCount];
    //brand_youpin_text 左上角的活动
    
    [self.iconGrid sd_setImageWithURL:[NSURL URLWithString:object.configInfo.iconGrid]];
    ///来源
    if (object.configInfo.brandYoupinText!=nil && ![object.configInfo.brandYoupinText isEqualToString:@""]) {
        self.source.text =object.configInfo.brandYoupinText;
        self.source.textColor = [UIColor getColorWithString:object.configInfo.brandYoupinColor];
        self.source.backgroundColor = [UIColor getColorWithString:object.configInfo.brandYoupinBgColor];
        self.source.layer.borderColor = [UIColor getColorWithString:object.configInfo.brandYoupinBorderColor].CGColor;
    }else{
        
        self.source.text = @"特卖商城";
        self.source.textColor = [UIColor getColorWithString:@"153,153,153,1"];
        self.source.backgroundColor = [UIColor whiteColor];
        self.source.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    
   
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    SHOPObjects * object = _object;
    self.price.width =object.priceWith;
    self.send.x = self.price.width+self.price.x;
    self.lastShop.width = 0;
    NSString * lastText = object.configInfo.activityText;
    if (![lastText isEqualToString:@""]) {
        self.lastShop.width = CGRectGetWidth([lastText getRectWithFontSize:17]);
    }
    self.detail.x = self.lastShop.width+self.lastShop.x;
}
@end
