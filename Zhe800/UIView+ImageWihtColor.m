//
//  UIView+ImageWihtColor.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/30.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "UIView+ImageWihtColor.h"

@implementation UIView (ImageWihtColor)
- (UIImage *)ImageFromColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextStrokeRectWithWidth(context, rect, 4);
    //    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
