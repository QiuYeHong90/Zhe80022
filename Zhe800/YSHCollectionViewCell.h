//
//  YSHCollectionViewCell.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSHCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong)NSArray * dataArray;
@end
