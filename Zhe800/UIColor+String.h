//
//  UIColor+String.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/28.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (String)

///字符串转换color
/**
 *@param : string 必须是 @"255,255,255,1"
 */
+(UIColor*)getColorWithString:(NSString*)string;
@end
