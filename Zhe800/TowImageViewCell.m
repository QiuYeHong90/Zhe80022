//
//  TowImageViewCell.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/27.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "TowImageViewCell.h"

@implementation TowImageViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)buttonClick:(UIButton *)sender {
    if (self.btnClick) {
        self.btnClick(self.index,sender.tag - 100);
    }
}
@end
