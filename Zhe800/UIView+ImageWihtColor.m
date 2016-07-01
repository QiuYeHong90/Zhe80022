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
    
    CGRect rect
      = self.layer.visibleRect;
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    CGContextStrokeRectWithWidth(context, rect,2);
    //    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
