//
//  SubCollectionViewCell.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong)NSMutableArray * dataArray;
@end
