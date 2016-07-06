//
//  ClassViewController.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/24.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassViewController : UIViewController

@property (nonatomic,strong) NSMutableDictionary * dataDict;
@property (nonatomic,strong) UICollectionView * collectionView;

@property (nonatomic,strong) NSDictionary * picDict;
@end
