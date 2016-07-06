//
//  UIView+ImageWihtColor.h
//  Zhe800
//
//  Created by Darius_mac on 16/6/30.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ImageWihtColor)
- (UIImage *)ImageFromColor:(UIColor *)color;
- (void)addVisualEffectView
;
- (UIImage *)backgroundImageFromColor:(UIColor *)color;

- (UIImage *)imageFromColor:(UIColor *)color withRect:(CGRect)rect;
@end
