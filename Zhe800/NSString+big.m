//
//  NSString+big.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/28.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "NSString+big.h"

@implementation NSString (big)
-(CGRect)getRectWithFontSize:(int)size{
    CGRect rect  = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    return rect;
}
@end
