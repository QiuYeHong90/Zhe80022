//
//  FirstViewController.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/24.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController


@property (nonatomic,strong) UIView * titlesView;

@property (nonatomic,strong) UIView * indicatorView;
@property (nonatomic,strong) UIView * indicatorViewScroll;
@property (nonatomic,strong) UIButton * selectedButton;
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) NSArray * titleArray;

@property (nonatomic,strong) UIView * temp;
@property (nonatomic,strong) UICollectionView *collectionView;
@end
