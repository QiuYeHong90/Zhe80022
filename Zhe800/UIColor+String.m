//
//  UIColor+String.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/28.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "UIColor+String.h"

@implementation UIColor (String)

+(UIColor*)getColorWithString:(NSString*)string{
    NSArray * array = [string componentsSeparatedByString:@","];
    UIColor * color;
    if (array!=nil&&array.count==4) {
        color = [UIColor colorWithRed:[array[0] floatValue]/255.0 green:[array[1] floatValue]/255.0 blue:[array[2] floatValue]/255.0 alpha:[array[3] floatValue]];
    }
    
    return color;
}

@end
