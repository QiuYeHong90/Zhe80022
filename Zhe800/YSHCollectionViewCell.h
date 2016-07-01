//
//  YSHCollectionViewCell.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <SDCycleScrollView.h>


typedef void(^BlockClick)(NSInteger);

@interface YSHCollectionViewCell : UICollectionViewCell<SDCycleScrollViewDelegate>



@property (weak, nonatomic) IBOutlet SDCycleScrollView *scrollView;
@property (nonatomic,strong)NSArray * dataArray;

@property (nonatomic,copy) BlockClick block;

@property (nonatomic,assign) NSInteger page;
@end


