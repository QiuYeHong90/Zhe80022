//
//  GroupViewController.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/24.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GropScrollView;
@interface GroupViewController : UIViewController
@property (nonatomic,strong) NSArray * titleArray;
@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) GropScrollView * gropScro;
@end
