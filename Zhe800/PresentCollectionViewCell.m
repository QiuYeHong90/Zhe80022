//
//  PresentCollectionViewCell.m
//  presents
//
//  Created by dapeng on 16/1/7.
//  Copyright © 2016年 dapeng. All rights reserved.
//

#import "PresentCollectionViewCell.h"
#import "MBProgressHUD.h"

#import "Tool.h"
#import "DataModels.h"
//#import "UpImageDownLabCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "ImageAndTextCollectionViewCell.h"
#import "UIView+YMExtension.h"

#import "UpImageDownLabCollectionViewCell.h"

#import <MJRefresh.h>

@interface PresentCollectionViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *presentArr;
@property (nonatomic, copy) NSString *next_url;
@property (nonatomic, strong) MBProgressHUD *HUD;

@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation PresentCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.dataArray = [[NSMutableArray alloc]init];
        
        self.page = 0;
        [self createCollectionView];
        [self addheader];
    }return self;
    
}



-(void)addheader{
    MJRefreshGifHeader * gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        NSLog(@"===刷新了");
        
        [self getData];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3ull *NSEC_PER_SEC), dispatch_get_main_queue(), ^{
             NSLog(@"===刷新了");
            [self.collectionView.header endRefreshing];
        });
        
    }];
    NSMutableArray * mutImages = [NSMutableArray array];
    for (int i =0; i<37; i++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"refreshHeader_pig%d",i]];
        [mutImages addObject:image];
    }
    
    NSMutableArray * mutLoadImages = [NSMutableArray array];
    for (int i = 1; i< 15; i++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"refreshLoading_pig%d",i]];
        [mutLoadImages addObject:image];
    }
    gifHeader.mj_h= 10+gifHeader.mj_h;
    [gifHeader setImages:mutImages forState:MJRefreshStateIdle];
    [gifHeader setImages:mutLoadImages duration:0.5  forState:MJRefreshStateRefreshing];
    gifHeader.lastUpdatedTimeLabel.hidden = YES;
    gifHeader.stateLabel.hidden = YES;
    self.collectionView.header = gifHeader;
    
//    [self.collectionView.header beginRefreshing];
}

#pragma mark ------------set---------------

-(void)setParamUrl:(NSString *)paramUrl{
    if (_paramUrl != paramUrl) {
        _paramUrl = paramUrl;
        [self getData];
        [self addFooter];
    }
    
}

-(void)setPicArray:(NSArray *)picArray{
    if (_picArray!= picArray) {
        _picArray = nil;
        _picArray = picArray;
        
    }
}

#pragma mark ------------------数据请求--------------------


- (void)getData {

    NSString *url = [NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?parent_tag=&url_name=%@&order=&min_price=&max_price=&shop_type=&third_tag=&user_type=1&user_role=1&student=0&image_type=si3&image_model=webp&super=2&deal_source=1&baoyou_type=1&show_config=1&page=1&per_page=20",self.paramUrl];
    NSLog(@"%@", url);
    _HUD = [MBProgressHUD showHUDAddedTo:self animated:YES];
    _HUD.color = [UIColor blackColor];
    _HUD.dimBackground = YES;
    _HUD.labelText = @"正在加载";
    [_HUD hide:YES afterDelay:1];
    [[Tool managerTool] getShopDataWithUrl:url Success:^(id responseObject) {
        SHOPBase * base = (SHOPBase*)responseObject;
        [self.dataArray setArray: base.objects];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
         NSLog(@"===%@",error );
    }];

}

- (void)addFooter {
    
    MJRefreshBackNormalFooter * backNormalFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2ull *NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            NSLog(@"===加载了");
            [self.collectionView.footer endRefreshing];
        });
    }];
    
    backNormalFooter.arrowView.image  = [UIImage imageNamed:@"message_big_loading.png"];
    self.collectionView.footer = backNormalFooter;
    
    
    
//        [self.tableView addFooterWithCallback:^{
//            
//            block.page += 20;
//            [SAPNetWorkTool getWithUrl:[NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/%@/items?limit=20&offset=%ld&gender=1&generation=1",block.ids, block.page] parameter:nil httpHeader:nil responseType:ResponseTypeJSON   success:^(id result) {
//                NSArray *array = [result[@"data"] objectForKey:@"items"];
//                for (NSDictionary *dic in array) {
//                    
//                    PresentMdoel *model = [[PresentMdoel alloc] initWithDictionary:dic];
//                    [block.presentArr addObject:model];
//                }
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [block.tableView reloadData];
//                    [block.tableView footerEndRefreshing];
//                });
//            } fail:^(NSError *error) {
//                NSLog(@"%@", error);
//            }];
//            
//        }];
}
#pragma mark ------------collectionView--------------------
- (void)createCollectionView {
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    layout.minimumInteritemSpacing = CGFLOAT_MIN;
    layout.minimumLineSpacing= 4;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = YES;
    [self.collectionView registerNib:[UINib nibWithNibName:@"UpImageDownLabCollectionViewCell" bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:@"UpImageDownLabCollectionViewCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ImageAndTextCollectionViewCell" bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:@"ImageAndTextCollectionViewCell"];
    [self addSubview:self.collectionView];

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.picArray) {
        return 2;
    }
    return 1;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.picArray) {
        if (indexPath.section==0) {
            return CGSizeMake((self.width-4*3)/4.0, self.width*340.f/1080.f);
        }else{
            return CGSizeMake(self.width*0.496, self.width*0.7);
        }
    }else{
        return CGSizeMake(self.width*0.496, self.width*0.7);
    }
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.picArray) {
        if (section==0) {
            return self.picArray.count;
        }
        return self.dataArray.count;
    }
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UpImageDownLabCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UpImageDownLabCollectionViewCell" forIndexPath:indexPath];
        IMGCategory * imgCate  = self.picArray[indexPath.row];
        NSString *url = [imgCate.pic componentsSeparatedByString:@".webp"][0];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
        cell.title.text = imgCate.categoryName;
        return cell;
    }else{
        ImageAndTextCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageAndTextCollectionViewCell" forIndexPath:indexPath];
        SHOPObjects * obj  = self.dataArray[indexPath.row];
        [cell setObject:obj];
        return cell;
    }
    
}
//- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
//    [super applyLayoutAttributes:layoutAttributes];
////    self.tableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//}

@end
