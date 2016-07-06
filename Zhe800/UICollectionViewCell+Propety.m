//
//  UICollectionViewCell+Propety.m
//  Zhe800
//
//  Created by Darius_mac on 16/7/4.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "UICollectionViewCell+Propety.h"
#import <objc/runtime.h>


@implementation UICollectionViewCell (Propety)
static const char YSCellLaberKey = '\0';
-(void)setLabel:(UILabel *)label{
    objc_setAssociatedObject(self, &YSCellLaberKey,
                             label, OBJC_ASSOCIATION_ASSIGN);
}
-(UILabel *)label{
   return  objc_getAssociatedObject(self, &YSCellLaberKey);
}


@end
