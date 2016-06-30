//
//  YSHCollectionViewFlowLayout.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "YSHCollectionViewFlowLayout.h"

@interface YSHCollectionViewFlowLayout(){
    CGRect _agoRect;
}
@property (nonatomic, strong) NSArray *layoutAttributesArray;

@end

@implementation YSHCollectionViewFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !CGRectEqualToRect(newBounds, self.collectionView.bounds);
}


- (CGSize)collectionViewContentSize{
    
    
    return CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds),CGRectGetMaxY(_agoRect));
}
-(void)prepareLayout{
    
    self.shopList = [self.collectionView numberOfItemsInSection:0];
    
    NSMutableArray * mutArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<self.shopList; i++) {
        NSIndexPath *indexPath=[NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *collectionViewAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        if (i==0) {
             collectionViewAttributes.frame = CGRectMake(0, 0,CGRectGetWidth([UIScreen mainScreen].bounds), 0.35*CGRectGetWidth([UIScreen mainScreen].bounds));
        }else if (i==1){
             collectionViewAttributes.frame = CGRectMake(0,CGRectGetMaxY(_agoRect),CGRectGetWidth([UIScreen mainScreen].bounds),(319.0/1080.f)*CGRectGetWidth([UIScreen mainScreen].bounds));
        }else if (i==2){
              collectionViewAttributes.frame = CGRectMake(0,CGRectGetMaxY(_agoRect),CGRectGetWidth([UIScreen mainScreen].bounds),(319.0/1080.f)*CGRectGetWidth([UIScreen mainScreen].bounds));
        }
        if (i>2) {
            if (i==3) {
                collectionViewAttributes.frame = CGRectMake(0,CGRectGetMaxY(_agoRect),CGRectGetWidth([UIScreen mainScreen].bounds),(540.f/1080.f)*CGRectGetWidth([UIScreen mainScreen].bounds));
            }else if(i==4){
                collectionViewAttributes.frame = CGRectMake(0,CGRectGetMaxY(_agoRect),CGRectGetWidth([UIScreen mainScreen].bounds),(725.f/1080.f)*CGRectGetWidth([UIScreen mainScreen].bounds));
            }else if (i>=5){
              collectionViewAttributes.frame = CGRectMake(((i-1)%2)*(CGRectGetMaxX(_agoRect)+8),CGRectGetMaxY(_agoRect)-CGRectGetHeight(_agoRect)*((i-5)%2),CGRectGetWidth([UIScreen mainScreen].bounds)/2-4,(725.f/1080.f)*CGRectGetWidth([UIScreen mainScreen].bounds));
            }
           
        }
        
        _agoRect = collectionViewAttributes.frame;
         [mutArray addObject:collectionViewAttributes];
    }
   
    self.layoutAttributesArray = mutArray.copy;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.layoutAttributesArray;
}
@end
