
//
//  YSHCollectionViewCell.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "UIView+YMExtension.h"
#import "YSHCollectionViewCell.h"
#import "SubCollectionViewCell.h"
@implementation YSHCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        UICollectionView * collectionView = [[UICollectionView  alloc]initWithFrame:frame collectionViewLayout:flowLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        self.collectionView = collectionView;
        flowLayout.itemSize =self.size;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //    [self.collectionView registerNib:[UINib nibWithNibName:@"YSHCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
        [collectionView registerClass:[SubCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
        [self addSubview:collectionView];

        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SubCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0  blue:(arc4random()%255)/255.0  alpha:1];
    return cell;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
}
@end
