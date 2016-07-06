//
//  FirstViewController.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/24.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "FirstViewController.h"
#import "SearchReaultViewController.h"

#import "YSHSearchBar.h"
#import "YSHHeader.h"
#import "YSHNavSearchView.h"

#import "YSHChildViewController.h"
#import "YSHCollectionViewCell.h"

#import "PresentCollectionViewCell.h"
#import "SelectionCollectionViewCell.h"

#import "Tool.h"
#import "DataModels.h"

#import "BGView.h"
#import "ClassViewController.h"
#import "YSTopTitleScrollView.h"

#import "WebViewController.h"
#import "DetailShopViewController.h"
@interface FirstViewController ()<selecttionCollectionViewCellDelegate,YSHNavSearchViewDelegate,UIScrollViewAccessibilityDelegate,UICollectionViewDataSource,UICollectionViewDelegate,BGViewDelegate,YSToopTitleScrollViewDelegate>
{
    UISearchController * _searchController;
    BOOL _isPush;
    BOOL _isTap;
    NSInteger currentIndex;
    
    CGPoint _markPoint;
    
}
@property (nonatomic,strong) UIButton * rightButton;
@property (nonatomic,strong) BGView *bgView ;
@property (nonatomic,strong) NSMutableDictionary * PICDict;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.btnArray = [[NSMutableArray alloc]init];
    self.titleArray = @[@"推荐",@"男装",@"数码家电",@"文娱运动",@"鞋品",@"美食",@"居家",@"女装",@"内衣",@"美妆配饰",@"儿童",@"箱包",@"家纺家装",@"母婴",@"中老年"];
    self.tagDictionary = @{@"男装":@"wireless1004",
                           @"数码家电":@"wireless3296",
                           @"文娱运动":@"wireless1015",
                           @"鞋品":@"wireless1009",
                           @"美食":@"wireless1008",
                           @"居家":@"wireless1006",
                           @"女装":@"wireless1002",
                           @"内衣":@"wireless1003",
                           @"美妆配饰":@"wireless1007",
                           @"儿童":@"wireless1011",
                           @"箱包":@"wireless1010",
                           @"家纺家装":@"wireless1005",
                           @"母婴":@"wireless1012",
                           @"中老年":@"wireless3469"};
    self.PICDict = [[NSMutableDictionary alloc]init];
    [self setUpNavigationView];
    
    //http://m.api.zhe800.com/tags/v2?user_type=1&user_role=1&student=0&image_model=webp
    ///http://m.api.zhe800.com/v5/deals?parent_tag=&url_name=wireless1004&order=&min_price=&max_price=&shop_type=&third_tag=&user_type=1&user_role=1&student=0&image_type=si3&image_model=webp&super=2&deal_source=1&baoyou_type=1&show_config=1&page=1&per_page=20
    
    [[Tool managerTool]GETDataWithUrl:@"http://m.api.zhe800.com/tags/v2?user_type=1&user_role=1&student=0&image_model=webp" parameters:nil Success:^(id responseObject) {
        NSArray * array = responseObject;
        NSMutableArray * tempMutArr  = [NSMutableArray array];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            IMGCategory * imgCate = [IMGCategory modelObjectWithDictionary:obj];
            [tempMutArr addObject:imgCate];
            
        }];
        
        for (int i = 1; i< self.titleArray.count; i++) {
            NSString * str = self.tagDictionary[self.titleArray[i]];
            
            NSPredicate * predicate = [NSPredicate predicateWithFormat:@"parentUrlName=%@",str];
            ///parentUrlName
           NSArray * objArray  = [tempMutArr filteredArrayUsingPredicate:predicate];
            
            [self.PICDict setObject:objArray forKey:self.titleArray[i]];
            
        }
        
        
    } failure:^(NSError *error) {
        NSLog(@"error===%@",error);
    }];
    
    
    [self setupTitlesView];
    [self createCollectionView];
}
#pragma mark --------------collectionView----------------------
- (void)createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = CGFLOAT_MIN;
    layout.minimumInteritemSpacing = CGFLOAT_MIN;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(self.view.width, self.view.height -45-CGRectGetMaxY(self.titlesView.frame));
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(self.titlesView.frame), self.view.width, self.view.height -45-CGRectGetMaxY(self.titlesView.frame) ) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[PresentCollectionViewCell class] forCellWithReuseIdentifier:@"PresentCollectionViewCell"];
    [self.collectionView registerClass:[SelectionCollectionViewCell class] forCellWithReuseIdentifier:@"SelectionCollectionViewCell"];
    [self.view addSubview:self.collectionView];
    self.collectionView.bounces = NO;
    
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
//        self.temp.hidden = YES;
        if (scrollView.contentOffset.x == 0) {
            self.indicatorView.hidden = NO;
            self.indicatorViewScroll.hidden = YES;
        }else{
            //            int idx = index -1;
            self.indicatorViewScroll.hidden = NO;
            self.indicatorView.hidden = YES;
            
        }
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        int index = scrollView.contentOffset.x/self.view.width;
        if (scrollView.contentOffset.x !=index * self.view.width) {
            
            if (scrollView.contentOffset.x >=index * self.view.width) {
                
                
                UIButton *  oldBtn = self.btnArray [index];
                UIButton * disitanceBtn = self.btnArray[index+1];
                
                CGFloat offSet = 0;
                
                if (self.scrollView.contentSize.width-oldBtn.x >= self.scrollView.width) {
                    float scrollX  = ((scrollView.contentOffset.x-index * self.view.width)/self.view.width)*(fabs((oldBtn.x-disitanceBtn.x)));
                    
                    ////如果滑动的时候 滑到最边缘了,那么就划不动了 ,就让偏移量等于self.scrollView.contentSize.width - self.scrollView.width
                    offSet = oldBtn.x+scrollX;
                    
                    if (offSet+self.scrollView.width>=self.scrollView.contentSize.width) {
                        
                        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.width,0) animated:NO];
                    }else{
                        
                        [self.scrollView setContentOffset:CGPointMake(oldBtn.x+scrollX,0) animated:NO];
                    }
                   
                    
                    
                    
                }else{
                    
                    self.scrollView.contentOffset = CGPointMake(self.scrollView.contentSize.width  - self.scrollView.width, 0);
                }
                
                
                ///红色指示符的移动 坐标
                self.indicatorView.hidden = index == 0?  NO:YES;
                self.indicatorViewScroll.hidden = index == 0? YES:NO;
                CGFloat oldCenterX = oldBtn.centerX;
                
                CGPoint disitanceCeter =disitanceBtn.center;
                float tempX = ((scrollView.contentOffset.x-index * self.view.width)/self.view.width)*((-oldCenterX+disitanceCeter.x));
                float tempW = ((scrollView.contentOffset.x-index * self.view.width)/self.view.width)*((-oldBtn.width+disitanceBtn.width));
                
                if (index == 0) {
                    self.indicatorView.width = oldBtn.titleLabel.width + tempW;
                    CGFloat oldPoint = [oldBtn.superview convertPoint:oldBtn.center toView:self.titlesView].x;
                    CGFloat distancePoint  = [disitanceBtn.superview convertPoint:disitanceBtn.center toView:self.titlesView].x;
                    float pointX = ((scrollView.contentOffset.x-index * self.view.width)/self.view.width)*((-oldPoint+distancePoint));
                    self.indicatorView.centerX = oldPoint + pointX;
                    
                    
                }else{
                    self.indicatorViewScroll.width = oldBtn.titleLabel.width + tempW;
                    self.indicatorViewScroll.centerX = oldCenterX+ tempX;
                    
                }
            }
            
            
            
            
        }
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    int index = scrollView.contentOffset.x/self.view.width;
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        
        self.indicatorView.hidden = index==0? NO:YES;
        self.indicatorViewScroll.hidden = index==0? YES:NO;
        
        [self.titlesView markClickWithIndex:index];
        }else{
        self.indicatorViewScroll.hidden = NO;
        self.indicatorView.hidden = YES;
    }
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == 0) {
        SelectionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SelectionCollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor yellowColor];
        cell.selectionDelegate = self;
        return cell;
        
    }else {
        PresentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PresentCollectionViewCell" forIndexPath:indexPath];
        cell.paramUrl = self.tagDictionary[self.titleArray[indexPath.row]];
        cell.picArray = self.PICDict[self.titleArray[indexPath.row]];
        cell.backgroundColor = [UIColor redColor];
        return cell;
        
    }
}
#pragma mark -- collectionViewDelegate
-(void)toPDetailVCDelegate:(SHOPObjects*)obj withImageUrl:(NSString *)imageUrl withTitle:(NSString *)title{
    NSLog(@"==%@",obj);
    DetailShopViewController * wVC = [DetailShopViewController new
                               ];
    wVC.title = title;
    wVC.urlStr = obj.wapUrl;
    [self.navigationController pushViewController:wVC animated:YES];
}
///scrollView
-(void)toScrollDataVCDelegate:(YSBase  *)obj withImageUrl:(NSString *)imageUrl withTitle:(NSString *)title;
{
    NSLog(@"++%@+++%@+++%@",obj,imageUrl,title);
    WebViewController * wVC = [WebViewController new
                               ];
    wVC.title = title;
    wVC.urlStr = obj.wapUrl;
    [self.navigationController pushViewController:wVC animated:YES];
}

/// SCModule
-(void)toSCModuleDataVCDelegate:(SCModule  *)obj withImageUrl:(NSString *)imageUrl withTitle:(NSString *)title{
    WebViewController * wVC = [WebViewController new
                               ];
    wVC.title = title;
    wVC.urlStr = obj.value;
    [self.navigationController pushViewController:wVC animated:YES];
}
#pragma mark -- 顶部滚动视图的布局
///布局顶部视图
-(void)setupTitlesView {
    //标签栏
    YSTopTitleScrollView    *titlesView = [[YSTopTitleScrollView alloc] initWithFrame:CGRectMake(0,64, CGRectGetWidth([UIScreen mainScreen].bounds), 36) andArray:self.titleArray];
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1];
    [self.view addSubview:titlesView];
    titlesView.delegate = self;
    self.titlesView = titlesView;

    self.indicatorView = titlesView.indicatorView;
    ///在scrollview 上的红色指示条
     self.indicatorViewScroll = titlesView.indicatorViewScroll;

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView = titlesView.scrollView;
    self.btnArray = titlesView.btnArray;
    self.rightButton = titlesView.rightBtn;

}

#pragma mark ---顶部标签代理
-(void)topView:(YSTopTitleScrollView *)topView clickBtn:(UIButton *)btn{
    NSLog(@"标签点击是事件");
    CGPoint offset = self.collectionView.contentOffset;
    offset.x = btn.tag* self.collectionView.width;
    [self.collectionView setContentOffset:offset animated:NO];
}
-(void)topView:(YSTopTitleScrollView *)topView clickRightBtn:(UIButton *)rithtBtn{
    NSLog(@"右侧点击事件");
    [self btnClick:rithtBtn];
}
///TODO:顶部视图的右侧button点击事件
-(void)btnClick:(UIButton*)btn
{
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        
        _bgView = [[BGView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.titlesView.frame), self.view.width,self.view.height -self.titlesView.height+self.titlesView.y ) andArray:self.titleArray];
        [self.view addSubview:_bgView];
        _bgView.delegate = self;
        _bgView.index = self.titlesView.selectedButton.tag;
        [UIView animateWithDuration:0.25 animations:^{
             _bgView.titleView.y = 0;
        }];
    }else{
        
        [UIView animateWithDuration:0.25 animations:^{
            _bgView.titleView.y = -_bgView.titleView.height;
            _bgView.alpha = 0;
        } completion:^(BOOL finished) {
             [_bgView removeFromSuperview];
        }];
       
    }
    
    self.scrollView.hidden = !self.scrollView.hidden;
    if (self.scrollView.hidden == YES) {
        UIButton * button =  self.btnArray[0];
        button.hidden = YES;
        self.indicatorView.hidden = YES;
        
        if (self.titlesView.choiceLab==nil) {
            self.titlesView.choiceLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.titlesView.width/2, self.titlesView.height)];
            self.titlesView.choiceLab.text =@"  选择分类";
            [self.titlesView addSubview:self.titlesView.choiceLab];
        }
        self.titlesView.choiceLab.hidden = NO;
    }else{
        UIButton * button =  self.btnArray[0];
        button.hidden = NO;
        if (self.titlesView.selectedButton.tag == 0) {
            self.indicatorView.hidden = NO;

        }
        
        self.titlesView.choiceLab.hidden = YES;
    }

}

#pragma  mark -- 分类弹框代理事件
-(void)bgView:(BGView *)bgView CategoryBtnClick:(UIButton *)btn{
     NSLog(@"btn.tag==%ld -- %@",btn.tag,self.titleArray[btn.tag]);
//     [self scrollToDistancePosionWithTag:btn.tag];
//    [self titleClick:self.btnArray[btn.tag]];
    [self.titlesView markClickWithIndex:btn.tag];
    
    [self btnClick:self.rightButton];
    
}
-(void)bgView:(BGView *)bgView moreCategoryBtnClick:(UIButton *)btn{
    NSLog(@"更多");
    
    self.tabBarController.selectedIndex = 1;
     [self btnClick:self.rightButton];
}
-(void)cancelClickWithBgView:(BGView *)bgView{
    [self btnClick:self.rightButton];
}




///设置导航的视图
-(void)setUpNavigationView
{
    self.navigationItem.titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds),33)];
//    self.navigationItem.titleView.backgroundColor = [UIColor blackColor];
    UIImage * image = [UIImage imageNamed:@"tao800home_logo"];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 23*image.size.width/image.size.height,23)];
    imageView.center = CGPointMake(imageView.center.x, self.navigationItem.titleView.center.y);
    imageView.image = image;
    [self.navigationItem.titleView addSubview:imageView];
    UIImage * itemImage = [UIImage imageNamed:@"tao800home_message"];
    UIImage * newImage = [itemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithImage:newImage style:UIBarButtonItemStylePlain target:self action:@selector(itemClick)];
    self.navigationItem.rightBarButtonItem = item;
    
    YSHNavSearchView * searchView = [[YSHNavSearchView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+10, 0,CGRectGetWidth([UIScreen mainScreen].bounds)*0.643, 33) block:^(id obj) {
        //条换界面
        
    }];
    searchView.delegate = self;
    searchView.imageView.image = [UIImage imageNamed:@"tao800search_left01"];
    [self.navigationItem.titleView addSubview:searchView];
    
    

}
-(void)btnClickSearchView:(YSHNavSearchView *)searchView
{
   
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: searchVC animated:NO];
    _isPush = YES;
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
  
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_isPush == YES) {
        self.tabBarController.tabBar.hidden = NO;
        self.hidesBottomBarWhenPushed = YES;
        _isPush = NO;
    }else{
        self.hidesBottomBarWhenPushed = NO;
    }
    
}
///KVC替换掉系统的搜索框
-(void)setUpSearchBar
{
  
    [_searchController setValue:[[YSHSearchBar alloc]init] forKey:@"searchBar"];
}

-(void)itemClick
{
    self.hidesBottomBarWhenPushed = YES;
    self.tabBarController.tabBar.hidden = YES;
    LogViewController * log = [LogViewController new];
    [self.navigationController pushViewController:log animated:YES];
    _isPush = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
