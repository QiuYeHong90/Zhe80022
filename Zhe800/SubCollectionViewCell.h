//
//  SubCollectionViewCell.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClick)(NSInteger idx, NSInteger imgTag);


@interface SubCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong)NSMutableArray * dataArray;
@property (nonatomic,assign) NSInteger index;

@property (nonatomic,copy) ButtonClick btnClick;
@end
