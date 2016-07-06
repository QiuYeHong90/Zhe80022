
//
//  YSHCollectionViewCell.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/25.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//
#import "UIView+YMExtension.h"
#import "YSHCollectionViewCell.h"
#import "SubCollectionViewCell.h"
#import "DataModels.h"
#import <UIKit+AFNetworking.h>
#import <UIImageView+WebCache.h>
//#import "UIImageView+WebCache"
@implementation YSHCollectionViewCell

- (void)awakeFromNib {
    self.scrollView.delegate = self;
}

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = nil;
    _dataArray =dataArray;
    if (_dataArray.count != 0) {
        
        NSMutableArray * mutPicUrl = [NSMutableArray array];
        [_dataArray enumerateObjectsUsingBlock:^(YSBase *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
              NSString * str = [obj.imageBigIosUrl componentsSeparatedByString:@".webp"][0];
            [mutPicUrl addObject:str];
        }];
        self.picArray = mutPicUrl.copy;
        
        self.scrollView.imageURLStringsGroup = mutPicUrl;
        self.scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        self.scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
       
    }
    
       
    
    
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"我被点击了==%ld",index);
    self.page = index;
    if (self.block) {
        self.block(index,self.picArray[index]);
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //http://m.api.zhe800.com/tao800/bannerv2.json?banner_types=17%2C1%2C10%2C16%2C99&platform=android&channelid=918ee9&productkey=tao800&cityid=410104&url_name=&userType=1&userRole=1&unlock=1&image_model=webp
     
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
}
@end
