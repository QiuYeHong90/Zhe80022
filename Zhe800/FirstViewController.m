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
@interface FirstViewController ()<YSHNavSearchViewDelegate,UIScrollViewAccessibilityDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    UISearchController * _searchController;
    BOOL _isPush;
    BOOL _isTap;
    int currentIndex;
    
}

@property (nonatomic,strong) NSMutableDictionary * PICDict;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnArray = [[NSMutableArray alloc]init];
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
        self.temp.hidden = YES;
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
    
    
//    int index = scrollView.contentOffset.x/self.view.width;
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        int index = scrollView.contentOffset.x/self.view.width;
        if (_isTap==YES) {
            
        }else{
            
        }
        if (scrollView.contentOffset.x !=index * self.view.width) {
            
            if (scrollView.contentOffset.x >=index * self.view.width) {
                if (index == 0) {
                    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
                }else{
                   
                    
                    UIButton *  oldBtn = self.btnArray [index];
                     UIButton * disitanceBtn = self.btnArray[index+1];
                    if (self.scrollView.contentSize.width- oldBtn.x > self.scrollView.width) {
                        float scrollX  = ((scrollView.contentOffset.x-index * self.view.width)/self.view.width)*(fabs((oldBtn.x-disitanceBtn.x)));
                        
                        
                       
                        
                        [self.scrollView setContentOffset:CGPointMake(oldBtn.x+scrollX,0) animated:NO];
                        if (_temp== nil) {
                            
                            _temp = [[UIView alloc]init];
                            [self.titlesView addSubview:_temp];
                            _temp.backgroundColor = [UIColor redColor];
                            _temp.hidden = NO;
                            _temp.width = self.selectedButton.titleLabel.width;
                            _temp.height = 2;
                            _temp.y = self.titlesView.height - 2;
                            CGPoint center  = [self.selectedButton.superview convertPoint:self.selectedButton.center toView:self.titlesView];
                            _temp.centerX = center.x;
                        }
                        self.temp.hidden = NO;
                        self.indicatorView.hidden = YES;
                        self.indicatorViewScroll.hidden = YES;
                        CGFloat oldCenterX = [oldBtn.superview convertPoint:oldBtn.center toView:self.titlesView].x;
                        _temp.centerX = oldCenterX;
                        CGPoint disitanceCeter =[disitanceBtn.superview convertPoint:disitanceBtn.center toView:self.titlesView];
                        
                            float tempX = ((scrollView.contentOffset.x-index * self.view.width)/self.view.width)*(fabs((oldCenterX-disitanceCeter.x)));
                        float tempW = ((scrollView.contentOffset.x-index * self.view.width)/self.view.width)*(fabs((oldBtn.width-disitanceBtn.width)));
                        self.temp.hidden = NO;
                       
                        _temp.width = oldBtn.titleLabel.width + tempW;
                        
                       
                        _temp.centerX = oldCenterX+ tempX;
//                        _temp.y = 0;
                        _temp.height =1000;
                        NSLog(@"==%f=====%f",_temp.centerX,_temp.centerY);
                        
                        
                    }else{
                        
                    }
                  
                }
                
            }
            
            
        }
    }else{
        
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    int index = scrollView.contentOffset.x/self.view.width;
    currentIndex = index;
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
         UIButton * btn = (UIButton*)self.btnArray[index];
        
        if (scrollView.contentOffset.x == 0) {
            
            self.indicatorView.hidden = NO;
            self.indicatorViewScroll.hidden = YES;
        }else{
//            int idx = index -1;
            self.indicatorViewScroll.hidden = NO;
            self.indicatorView.hidden = YES;
           
        }
//        self.selectedButton = btn;
        
            
            [self titleClick:btn];
            
//            btn.selected = !btn.selected;
//            self.selectedButton = btn;
        
        
        if (index> 0 ) {
            self.indicatorViewScroll.hidden = NO;
            self.indicatorView.hidden = YES;
            
        }else{
            self.indicatorViewScroll.hidden = YES;
            self.indicatorView.hidden =NO;
        }
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
        
        return cell;
        
    }else {
        PresentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PresentCollectionViewCell" forIndexPath:indexPath];
        cell.paramUrl = self.tagDictionary[self.titleArray[indexPath.row]];
        cell.picArray = self.PICDict[self.titleArray[indexPath.row]];
        cell.backgroundColor = [UIColor redColor];
        return cell;
        
    }
}

///布局顶部视图
-(void)setupTitlesView {
    //标签栏
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1];
    titlesView.frame = CGRectMake(0,64, CGRectGetWidth([UIScreen mainScreen].bounds), 36);
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    //底部红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = titlesView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    ///在scrollview 上的红色指示条
    self.indicatorViewScroll = [[UIView alloc] init];
    self.indicatorViewScroll.backgroundColor = [UIColor redColor];
    self.indicatorViewScroll.height = 2;
    self.indicatorViewScroll.tag = -2;
    self.indicatorViewScroll.y = titlesView.height - self.indicatorViewScroll.height;
    
    //创建scrollview
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(55, 0, CGRectGetWidth([UIScreen mainScreen].bounds)-50-55,36)];
//    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.titlesView addSubview:_scrollView];
   
    //内部子标签
    NSInteger count = self.titleArray.count;
    CGFloat width = 23;
    CGFloat OldMaxX= 0;
    CGFloat height = titlesView.height;
    for (int i = 0; i < count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.height = height;
        button.width = width ;
       button.tag = i;

        [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i==0) {
            button.width = 55 ;
            button.x = OldMaxX;
             [titlesView addSubview:button];
        }else{
            button.width = width + CGRectGetWidth([button.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil]);
            [self.scrollView addSubview:button];
            button.x = OldMaxX;
            OldMaxX = button.x + button.width;
        }
        
//        button.backgroundColor = [UIColor blackColor ];
        

        
        //默认点击了第一个按钮
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
            //让按钮内部的Label根据文字来计算内容
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            //            self.indicatorView.width = [titles[i] sizeWithAttributes:@{NSFontAttributeName : button.titleLabel.font}].width;
            self.indicatorView.centerX = button.centerX;
        }
        [self.btnArray addObject:button];
    }
    self.scrollView.contentSize = CGSizeMake(OldMaxX, 36);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [titlesView addSubview:indicatorView];
    self.indicatorViewScroll.hidden = YES;
    [self.scrollView addSubview:self.indicatorViewScroll];
    
    ///左侧的button
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.scrollView.frame), 0,40, 36)];
    [btn setImage:[UIImage imageNamed:@"muying_title_selected"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"muying_title_unselected"] forState:UIControlStateSelected];
    [btn addTarget:self  action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.titlesView addSubview:btn];
}
///TODO:顶部视图的左侧button点击事件
-(void)btnClick:(UIButton*)btn
{
    btn.selected = !btn.selected;
}
-(void)titleClick:(UIButton*)button
{
    //修改按钮状态
    _isTap = YES;
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    if (button.tag > 0 ) {
        
        self.indicatorViewScroll.hidden = NO;
        self.indicatorView.hidden = YES;
        self.indicatorViewScroll.width = self.selectedButton.titleLabel.width;
        self.indicatorViewScroll.centerX = self.selectedButton.centerX;
        
    }else{
        self.indicatorViewScroll.hidden = YES;
        self.indicatorView.hidden = NO;
        self.indicatorView.width = self.selectedButton.titleLabel.width;
        self.indicatorView.centerX = self.selectedButton.centerX;
    }
  
    //滚动,切换子控制器
    CGPoint offset = self.collectionView.contentOffset;
    offset.x = button.tag* self.collectionView.width;
    [self.collectionView setContentOffset:offset animated:YES];
    //让标签执行动
        
    
    
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
