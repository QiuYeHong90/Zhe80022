//
//  SelectionCollectionViewCell.m
//  presents
//
//  Created by dapeng on 16/1/7.
//  Copyright © 2016年 dapeng. All rights reserved.
//

#import "SelectionCollectionViewCell.h"
#import "MBProgressHUD.h"
#import "UIView+YMExtension.h"

#import "SubCollectionViewCell.h"
#import "YSHCollectionViewCell.h"
#import "YSHCollectionViewFlowLayout.h"
#import "UIView+YMExtension.h"
#import "DataModels.h"
#import <UIKit+AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "ImageAndTextCollectionViewCell.h"
#import "YYYCollectionViewCell.h"

#import "TowImageViewCell.h"



#import <MJRefresh.h>
//#import "RACollectionViewReorderableTripletLayout.h"

#import "Tool.h"
@interface SelectionCollectionViewCell()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSInteger _currentPage;
    BOOL _isLoad;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *presentArr;
@property (nonatomic, strong) NSMutableArray *scrollImageArr;
@property (nonatomic, strong) NSMutableArray *NavTitleArr;
@property (nonatomic, copy) NSString *next_url;
@property (nonatomic, strong) MBProgressHUD *HUD;
@property (nonatomic,strong)NSMutableArray * dataArray;

@property (nonatomic,strong) NSMutableArray * scrollDataArray;

@property (nonatomic,strong) NSMutableArray * shopListArray;
@end



@implementation SelectionCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
       
        _currentPage = 1;
        self.scrollDataArray = [[NSMutableArray alloc]init];
        self.dataArray = [[NSMutableArray alloc]init];
        self.shopListArray = [[NSMutableArray alloc]init];
        //获取scrollview 数组
        [self getData];
        ///获取数据
        [self getCarouselData];
        //创建collectionView
        [self createCollectionView];
        [self addheader];
        [self addFooter];
        
    }return self;
    
}

- (void)addFooter {
    
    MJRefreshBackNormalFooter * backNormalFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _isLoad = YES;
        _currentPage ++;
        NSLog(@"===%ld",_currentPage);
        [self getCarouselData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2ull *NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            NSLog(@"===加载了");
            
            
            [self.collectionView.footer endRefreshing];
        });
    }];
    
    backNormalFooter.arrowView.image  = [UIImage imageNamed:@"message_big_loading.png"];
    self.collectionView.footer = backNormalFooter;
    
    
}


-(void)addheader{
    MJRefreshGifHeader * gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        NSLog(@"===刷新了");
        _currentPage = 1 ;
        [self getCarouselData];
        
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
    
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    self.collectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}
#pragma mark -------------------数据请求------------------------
- (void)getData {
    //获取scrollView
    Tool * tool = [Tool managerTool];
     [tool getScrollDataSuccess:^(NSArray *responseObject) {
         NSLog(@"==%@",responseObject);
         [self.scrollDataArray setArray:responseObject];
         [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"==%@",error);
    }];
    
    
    ///获取 首页
    [tool get:@"http://th5.m.zhe800.com/h5new/real/index?user_type=1&user_role=1&student=0&platform=iOS&model=MI%203&image_type=si2&area=410104&page=2&per_page=20" DataSuccess:^(id obj) {
        NSArray * array = (NSArray*)obj;
        NSMutableArray * mutArray = [[NSMutableArray alloc]init];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            SCBAS * base = [SCBAS modelObjectWithDictionary:obj];
            
            
            [mutArray addObject:base];
            
        }];
        [self.dataArray setArray:mutArray];
        
        NSLog(@"===%ld",self.dataArray.count);
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"error%@",error);
    }];
    
    
    
}

///刷新列表
- (void)getCarouselData {
     Tool * tool = [Tool managerTool];
    ///获取商品列表
    
    ///http://m.api.zhe800.com/v5/deals?image_type=si3&image_model=webp&user_type=1&user_role=1&student=0&url_name=&super=2&deal_source=1&baoyou_type=1&show_config=1&page=1&per_page=20
    NSString * str = [NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?image_type=si3&image_model=webp&user_type=1&user_role=1&student=0&url_name=&super=2&deal_source=1&baoyou_type=1&show_config=1&page=%ld&per_page=20",_currentPage];
    [tool getShopDataWithUrl:str Success:^(id responseObject) {
        SHOPBase * shopBase = responseObject;
        if (_isLoad == YES) {
            _isLoad = NO;
            [self.shopListArray addObjectsFromArray:shopBase.objects];
        }else{
            [self.shopListArray setArray:shopBase.objects];
        }
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"error===%@",error);
    }];
}
///下拉加载
-(void)loadShopListData{
    _currentPage ++;
    Tool * tool = [Tool managerTool];
    ///获取商品列表
    ///http://m.api.zhe800.com/v5/deals?image_type=si3&image_model=webp&user_type=1&user_role=1&student=0&url_name=&super=2&deal_source=1&baoyou_type=1&show_config=1&page=1&per_page=20
     NSString * str = [NSString stringWithFormat:@"http://m.api.zhe800.com/v5/deals?image_type=si3&image_model=webp&user_type=1&user_role=1&student=0&url_name=&super=2&deal_source=1&baoyou_type=1&show_config=1&page=%ld&per_page=20",_currentPage];
    [tool getShopDataWithUrl:str Success:^(NSArray *responseObject) {
        
    } failure:^(NSError *error) {
        NSLog(@"error===%@",error);
    }];
}



#pragma mark ---------------CollectionView-----------------------
- (void)createCollectionView {
    
   
 
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    
    layout.minimumInteritemSpacing = CGFLOAT_MIN;
    layout.minimumLineSpacing= CGFLOAT_MIN;
    
    
    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.scrollEnabled = YES;
    [self.collectionView registerNib:[UINib nibWithNibName:@"YSHCollectionViewCell" bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:@"YSHCollectionViewCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"YYYCollectionViewCell" bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:@"YYYCollectionViewCell"];
     [self.collectionView registerNib:[UINib nibWithNibName:@"SubCollectionViewCell" bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:@"SubCollectionViewCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TowImageViewCell" bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:@"TowImageViewCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ImageAndTextCollectionViewCell" bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:@"ImageAndTextCollectionViewCell"];
    [self addSubview:self.collectionView];
 
}

#pragma mark -------------------collectionViewDelegateAndDataSoucrceDelegate------

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //第0区 scrollView
    if (indexPath.section ==0) {
        return CGSizeMake(self.width, self.width*0.351);
        
    }
    ///第一区
    if (indexPath.section == 1) {
        if (indexPath.row==0) {
            return CGSizeMake(self.width, self.width*0.3);
        }
        if (indexPath.row==1) {
            return CGSizeMake(self.width, self.width*0.15);
        }
        if (indexPath.row == 2){
            return CGSizeMake(self.width, self.width*0.4777);
        }
        //最后一个
        if (indexPath.row==self.dataArray.count-1) {
            return CGSizeMake(self.width, self.width*0.142);
        }
//        剩下的
        return CGSizeMake(self.width, self.width*0.21);
        
    }
    ///商品列表区
    if (indexPath.section== 2) {
         return CGSizeMake(self.width*0.496, self.width*0.7);
    }
    return CGSizeMake(self.width, self.width*0.3);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section==1) {
        
        return self.dataArray.count;
    }
    if (section == 2) {
        return self.shopListArray.count;
    }
    return 0;
}

- (UIEdgeInsets)insetsForCollectionView:(UICollectionView *)collectionView
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (UIEdgeInsets)autoScrollTrigerEdgeInsets:(UICollectionView *)collectionView
{
    
    return UIEdgeInsetsMake(50.f, 0, 50.f, 0); //Sorry, horizontal scroll is not supported now.
}

- (UIEdgeInsets)autoScrollTrigerPadding:(UICollectionView *)collectionView
{
    return UIEdgeInsetsMake(64.f, 0, 0, 0);
}

- (CGFloat)reorderingItemAlpha:(UICollectionView *)collectionview
{
    return .3f;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ///scrollView
    if (indexPath.section == 0) {
        
        YSHCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"YSHCollectionViewCell" forIndexPath:indexPath];
        __weak typeof(self) weakSelf = self;
        cell.block = ^(NSInteger index){
            
            NSLog(@"传代理协议=====%ld===%@",index,weakSelf.scrollDataArray[index]);
        };
        cell.dataArray = self.scrollDataArray;
        
        return cell;
    }else if(indexPath.section == 1) {
        ///d第一区
        SCBAS * base = self.dataArray[indexPath.row];
        if (indexPath.row>=0&&indexPath.row<=1) {
            YYYCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"YYYCollectionViewCell" forIndexPath:indexPath];
            
            NSString *str = [[base.module[0] pic] componentsSeparatedByString:@".webp"][0];
            
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:str]];
            
            
            return cell;
        }
        if (indexPath.row==2) {
            
        SubCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"SubCollectionViewCell" forIndexPath:indexPath];
        
            for (int i=0; i<base.module.count; i++) {
                NSString *str = [[base.module[i] pic] componentsSeparatedByString:@".webp"][0];
                NSLog(@"===++++%@",str);
                UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:i+2];
                [imageView sd_setImageWithURL:[NSURL URLWithString:str]];
            }
           
            
            
            return cell;
        }
        if (indexPath.row>=3&&indexPath.row<=5) {
            TowImageViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"TowImageViewCell" forIndexPath:indexPath];
            
            for (int i=0; i<base.module.count; i++) {
                NSString *str = [[base.module[i] pic] componentsSeparatedByString:@".webp"][0];
                NSLog(@"===++++%@",str);
                UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:i+1];
                [imageView sd_setImageWithURL:[NSURL URLWithString:str]];
            }

            return cell;
        }else{
            YYYCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"YYYCollectionViewCell" forIndexPath:indexPath];
            
            NSString *str = [[base.module[0] pic] componentsSeparatedByString:@".webp"][0];
            
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:str]];
            
            
            return cell;
        }
        
    }else{
        //第二区商品列表区
        ImageAndTextCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"ImageAndTextCollectionViewCell" forIndexPath:indexPath];
        
         SHOPObjects * object = self.shopListArray[indexPath.row];
        [cell setObject:object];
        
        return cell;
    }

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
           YSHCollectionViewCell *yshCell  =(YSHCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
            NSLog(@"===%ld",yshCell.page);

        }
            break;
        case 1:
        {
             SCBAS * base = self.dataArray[indexPath.row];
            NSLog(@"==%@",base.module[0]);
        }
            break;
        case 2:
        {
            SHOPObjects * object = self.shopListArray[indexPath.row];
            NSLog(@"==%@",object);
        }
            break;
            
        default:
            break;
    }
    
    
}

@end
