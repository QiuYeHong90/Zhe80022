//
//  GropScrollView.h
//  Zhe800
//
//  Created by Darius_mac on 16/7/4.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GropScrollView : UIScrollView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray * dataArray;
- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array;
@end
