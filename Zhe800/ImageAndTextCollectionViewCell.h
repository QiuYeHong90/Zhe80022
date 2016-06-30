//
//  ImageAndTextCollectionViewCell.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/26.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
//#import "SHOPObjects.h"
@interface ImageAndTextCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
///最新上架
@property (weak, nonatomic) IBOutlet UILabel *lastShop;
///商品标题
@property (weak, nonatomic) IBOutlet UILabel *detail;
///商品价格
@property (weak, nonatomic) IBOutlet UILabel *price;

///包邮 或打折
@property (weak, nonatomic) IBOutlet UILabel *send;

///已经售货多少件
@property (weak, nonatomic) IBOutlet UILabel *sold;
///来源
@property (weak, nonatomic) IBOutlet UILabel *source;

//icon_grid 左上角的 打折优惠活动
@property (weak, nonatomic) IBOutlet UIImageView* iconGrid ;

@property (nonatomic,strong) SHOPObjects *object;

@end
