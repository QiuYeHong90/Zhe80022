//
//  NavBar.m
//  Zhe800
//
//  Created by Darius_mac on 16/7/3.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "NavBar.h"
#import "UIView+ImageWihtColor.h"
#import "UIView+YMExtension.h"
@implementation NavBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor grayColor];
        [self addVisualEffectView];
        UISearchBar * bar = [[UISearchBar alloc] initWithFrame:self.bounds];
        [self addSubview:bar];
        bar.placeholder = @"满满的都是套路";
        bar.delegate = self;
        
    
    
}
    return self;
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    NSLog(@"ssssssssaaaaa");
    if (self.barClickPush) {
        self.barClickPush(self);
    }
    return NO;
}


@end
