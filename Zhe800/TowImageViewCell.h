//
//  TowImageViewCell.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/27.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ButtonClick)(NSInteger idx, NSInteger imgTag);
@interface TowImageViewCell : UICollectionViewCell
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy) ButtonClick btnClick;
@end
