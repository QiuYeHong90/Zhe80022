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

//#import "YSHChildViewController.h"
#import "YSHCollectionViewCell.h"
@interface FirstViewController ()<YSHNavSearchViewDelegate,UIScrollViewAccessibilityDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    UISearchController * _searchController;
    BOOL _isPush;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray = @[@"推荐",@"男装",@"数码家电",@"文娱运动",@"鞋品",@"美食",@"居家",@"女装",@"内衣",@"没装配饰",@"儿童",@"箱包",@"家纺家装",@"母婴",@"中老年"];
   
    [self setUpNavigationView];
    
//    YSHTopView * topView = [[YSHTopView alloc]initWithFrame:CGRectMake(0,64, CGRectGetWidth([UIScreen mainScreen].bounds), 36)];
//    topView.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:topView];
    ///http://m.api.zhe800.com/v5/deals?parent_tag=&url_name=wireless1004&order=&min_price=&max_price=&shop_type=&third_tag=&user_type=1&user_role=1&student=0&image_type=si3&image_model=webp&super=2&deal_source=1&baoyou_type=1&show_config=1&page=1&per_page=20
    
    
    
    [self setupTitlesView];
//    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    UICollectionView * collectionView = [[UICollectionView  alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titlesView.frame), CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) collectionViewLayout:flowLayout];
//    collectionView.delegate = self;
//    collectionView.dataSource = self;
//    self.collectionView = collectionView;
//    flowLayout.itemSize =self.view.size;
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
////    [self.collectionView registerNib:[UINib nibWithNibName:@"YSHCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
//    [collectionView registerClass:[YSHCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    [self.view addSubview:collectionView];
//    self.collectionView.pagingEnabled = YES;
//    flowLayout.minimumLineSpacing = 0;
//    flowLayout.minimumInteritemSpacing = 0;

}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return self.titleArray.count;
//}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    YSHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    
//    cell.contentView.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0  blue:(arc4random()%255)/255.0  alpha:1];
//    return cell;
//}
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
    self.selectedButton.enabled = YES;
    if (self.temp==nil) {
        _temp = [[UIView alloc]initWithFrame:self.selectedButton.frame];
        [self.view addSubview:_temp];
    }
    _temp.hidden = NO;
    _temp.center =[self.selectedButton convertPoint:self.selectedButton.center toView:self.view];
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
    //让标签执行动画
    [UIView animateWithDuration:0.25 animations:^{
        _temp.width = self.selectedButton.titleLabel.width;
        
        _temp.center = _temp.center =[self.selectedButton convertPoint:self.selectedButton.center toView:self.view];

    } completion:^(BOOL finished) {
        _temp.hidden = YES;
    }];
    [UIView animateWithDuration:0.25 animations:^{
            }];
    //滚动,切换子控制器
//    CGPoint offset = self.contentView.contentOffset;
//    offset.x = button.tag * self.contentView.width;
//    [self.contentView setContentOffset:offset animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
