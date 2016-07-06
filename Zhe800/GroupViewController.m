//
//  GroupViewController.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/24.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "GroupViewController.h"
#import "UIView+YMExtension.h"
#import "UICollectionViewCell+Propety.h"

#import "GropScrollView.h"
@interface GroupViewController ()<UICollectionViewDelegate
,UICollectionViewDataSource>
{
    NSInteger _currentIndex;
}
@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray * array = @[@"正在热抢",@"最新上线",@"即将下架",@"精选预告"];
    self.titleArray = array;
    self.title = @"品牌团";
    
    UIImage * image = [UIImage imageNamed:@"brand_search"];
    UIImage * newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem * barItem = [[UIBarButtonItem alloc]initWithImage:newImage style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick)];
    self.navigationItem.rightBarButtonItem = barItem;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
     ///// collectionView   
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView * collectioView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,64, self.view.width,60) collectionViewLayout:flowLayout ];
    flowLayout.minimumInteritemSpacing = CGFLOAT_MIN;
    flowLayout.minimumLineSpacing = CGFLOAT_MIN;
    collectioView.delegate = self;
    collectioView.dataSource = self;
    collectioView.backgroundColor = [UIColor whiteColor];
    flowLayout.itemSize = CGSizeMake(self.view.width/4,60);
    
    [collectioView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell1"];
    [self.view addSubview:collectioView];
    self.collectionView = collectioView;
    
    GropScrollView * scrollView = [[GropScrollView alloc]initWithFrame:CGRectMake(0,collectioView.height + collectioView.y, self.view.width, self.view.height - (collectioView.height + collectioView.y+ self.tabBarController.tabBar.height)) withArray:self.titleArray ];
    scrollView.contentSize = CGSizeMake(self.view.width * self.titleArray.count, collectioView.height);
    scrollView.tag = 1;
    [self.view addSubview:scrollView];
    scrollView.pagingEnabled = YES;
    scrollView.delegate= self;
    self.gropScro = scrollView;
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag == 1) {
        _currentIndex  = scrollView.contentOffset.x/self.view.width;
        [self.collectionView reloadData];
    }
}
-(void)leftItemClick{
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.titleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell1" forIndexPath:indexPath];
    
    if (cell.label == nil) {
        UILabel * lab = [[UILabel alloc]initWithFrame:cell.bounds];
        
        
        cell.label = lab;
        lab.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:lab];
        
        
        
        
        
        cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.bounds];
        NSLog(@"===%@",cell.selectedBackgroundView);
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0,cell.height-5, cell.width, 5)];
        view.backgroundColor = [UIColor redColor];
        [cell.selectedBackgroundView addSubview:view];
       

    }
    cell.label.textColor = [UIColor blackColor];
    cell.label.text =self.titleArray[indexPath.row];
    if (indexPath.row ==_currentIndex) {
        cell.selected = YES;
        
        [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionLeft];
        cell.label.textColor = [UIColor redColor];
    }
    return cell;
   
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    _currentIndex = indexPath.row;
    
    [collectionView reloadData];
    
    [self.gropScro setContentOffset:CGPointMake(self.view.width*_currentIndex, 0) animated:YES];
    
    
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
