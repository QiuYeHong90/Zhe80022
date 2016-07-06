//
//  YSHNavigationBar.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "YSHNavigationBar.h"

@implementation YSHNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithType:(TypeOfStyle)type
{
    self = [super init];
    if (self) {
        self.type = type;
        switch (type) {
            case NormalType:
            {
                
            }
                break;
            case HomeType:
            {
                if (self.searchBar==nil) {
                    self.searchBar = [[UISearchBar alloc]init];
                }
               _imageView = [[UIImageView alloc]init];
                [self addSubview:_imageView];
                [self addSubview:self.searchBar];
                
            }
                break;
            case PureSearchType:
            {
                
            }
                break;
            case PersonalType:
            {
                
                
            }
                break;
                
            default:
                break;
        }

    }
    return self;
}



-(void)layoutSubviews{
    
    
    NSLog(@"%s",__func__);
    
    [super layoutSubviews];
    
    switch (self.type) {
        case NormalType:
        {
            
        }
            break;
        case HomeType:
        {
//            UIImage * image = [UIImage imageNamed:@"tao800home_logo"];
//            _imageView.frame = CGRectMake(0, 0, 46*image.size.width/image.size.height, 46);
//            _imageView.image = image;
//            
//            if (self.searchBar) {
//                self.searchBar.frame = CGRectMake(CGRectGetMaxX(_imageView.frame), 0, 100, 30);
//            }
//            
            
        }
            break;
        case PureSearchType:
        {
           
        }
            break;
        case PersonalType:
        {
//            self.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 133);
            
        }
            break;
            
        default:
            break;
    }

    
   
}

-(void)setFrame:(CGRect)frame
{    [super setFrame:frame];
}

@end
