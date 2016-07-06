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
- (UIImage *)backgroundImageFromColor:(UIColor *)color{
    
    CGRect rect
    = self.layer.visibleRect;
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

//    CGContextSetStrokeColorWithColor(context, [color CGColor]);
//    CGContextStrokeRectWithWidth(context, rect,2);
    CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (UIImage *)backgroundImageFromColor:(UIColor *)color withRect:(CGRect)rect {
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    //    CGContextStrokeRectWithWidth(context, rect,2);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)addVisualEffectView
{
    
    //    [view setBackgroundColor:[UIColor whiteColor]];
    //    [view.layer setShadowOffset:CGSizeMake(-2.0, -2.0)];
    //    [view.layer setShadowPath:[[UIBezierPath bezierPathWithRect:CGRectMake(0.0, 0.0, view.bounds.size.width + 4.0, view.bounds.size.height + 4.0)] CGPath]];
    //    [view.layer setShadowColor:[[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5] CGColor]];
    //    [view.layer setShadowOpacity:0.5];
    
    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    [visualEffectView setFrame:self.bounds];
    [self addSubview:visualEffectView];
    [self insertSubview:visualEffectView atIndex:0];
}

@end
