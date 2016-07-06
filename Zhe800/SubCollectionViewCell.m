//
//  SubCollectionViewCell.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "UIView+YMExtension.h"
#import "DataModels.h"
#import <UIKit+AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "SubCollectionViewCell.h"

@implementation SubCollectionViewCell
- (void)awakeFromNib {
   
    

}

- (IBAction)buttonCick:(UIButton *)sender {
    
    
    if (self.btnClick) {
        self.btnClick(self.index,sender.tag - 100);
    }
}


@end
