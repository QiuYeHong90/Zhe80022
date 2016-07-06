//
//  SelectionCollectionViewCell.h
//  presents
//
//  Created by dapeng on 16/1/7.
//  Copyright © 2016年 dapeng. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Carousel.h"
@class SHOPObjects,YSBase,SCModule;
@protocol selecttionCollectionViewCellDelegate <NSObject>
///商品详情
- (void)toPDetailVCDelegate:(SHOPObjects *)obj withImageUrl:(NSString *)imageUrl withTitle:(NSString *)title;

///scrollView
-(void)toScrollDataVCDelegate:(YSBase  *)obj withImageUrl:(NSString *)imageUrl withTitle:(NSString *)title;


/// SCModule
-(void)toSCModuleDataVCDelegate:(SCModule  *)obj withImageUrl:(NSString *)imageUrl withTitle:(NSString *)title;
- (void)toCarsouselNextVC:(NSString *)ids withUrl:(NSString *)url withNavTitle:(NSString *)title;
@end


@interface SelectionCollectionViewCell : UICollectionViewCell
@property (nonatomic, retain) NSMutableArray *carouselArray;
@property (nonatomic, retain) NSMutableArray *carouselTitleArray;
@property (nonatomic, strong) NSMutableArray *target_urlArr;

@property (nonatomic, retain) NSMutableArray *buttonModelArray;
@property (nonatomic, retain) NSMutableArray *CellModelArray;
@property (nonatomic, retain) NSMutableArray *IdArray;
//@property (nonatomic, strong) Carousel *carousel;






@property (nonatomic, assign) id<selecttionCollectionViewCellDelegate>selectionDelegate;
@end
