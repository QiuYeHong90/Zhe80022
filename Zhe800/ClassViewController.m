//
//  ClassViewController.m
//  Zhe800
//
//  Created by Darius_mac on 16/6/24.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "ClassViewController.h"
#import "UIView+YMExtension.h"
#import "UIView+ImageWihtColor.h"
#import "NavBar.h"
#import "YSScrollView.h"

#import "YYYCollectionViewCell.h"
#import "UpImageDownLabCollectionViewCell.h"

#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "Tool.h"

#import "DataModels.h"

#import "SearchViewController.h"
@interface ClassViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate
,UICollectionViewDataSource>
{
    NSInteger selectedRow;
}
@property (nonatomic,strong)NSArray * titleArray;

@end

@implementation ClassViewController


-(NSMutableDictionary *)dataDict{
    if (!_dataDict) {
        _dataDict = [[NSMutableDictionary alloc]init];
    }
    return _dataDict;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addVisualEffectView];
    
    
    
    /////http://m.api.zhe800.com/brand/wall/v1?user_role=1&student=0&image_model=webp&user_type=1
    
    
    ///*********************搜索
    NavBar * bar = [[NavBar alloc]initWithFrame:CGRectMake(0,20, self.view.width, 44)];
    [self.view addSubview:bar];
    
    typeof(self) weakSelf = self;
    bar.barClickPush = ^(NavBar* topBar){
      ///在这里跳转界面
        NSLog(@"在这里跳转界面");
        SearchViewController * search = [[SearchViewController alloc]init];
        [weakSelf.navigationController pushViewController:search animated:YES];
    };
    
//    ******************第二个视图
    UIView * secondView = [[UIView alloc] initWithFrame:CGRectMake(0, bar.height + bar.y, self.view.width, 80)];
    
    [secondView addVisualEffectView];
    
    CGFloat space = 20;
    CGFloat width = (self.view.width - 20*4)/3;
    NSArray *btnTitle = @[@"充值",@"9快9包邮",@"20元封顶"];
    for (int i = 0; i<3; i++) {
        
        
        UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(space+(width+space)*(i%3),80 - 20-5,width,20)];
        lab.text = btnTitle[i];
        lab.textAlignment = NSTextAlignmentCenter;
        [secondView addSubview:lab];
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(space+(width+space)*(i%3), 0,width, 80)];
        [secondView addSubview:button];
        
       
        [button setBackgroundImage: [button backgroundImageFromColor:[UIColor colorWithWhite:0.8 alpha:0.5]] forState:UIControlStateHighlighted];
        
        
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tao_cat_%d",i]] forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(-20, 0,0, 0)];
        
        button.tag = i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    /////表
    [self.view addSubview:secondView];
    self.titleArray = @[@"男装",@"数码家电",@"文娱运动",@"鞋品",@"美食",@"居家",@"女装",@"内衣",@"美妆配饰",@"儿童",@"箱包",@"家纺家装",@"母婴",@"中老年"];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView * tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, secondView.y+secondView.height, 100, self.view.height - (secondView.y+secondView.height+self.tabBarController.tabBar.height))];
//    YSScrollView * scrollView = [[YSScrollView alloc]initWithFrame:CGRectMake(0, secondView.y+secondView.height, 100, self.view.height - (secondView.y+secondView.height+self.tabBarController.tabBar.height)) withArray:self.titleArray];
//    scrollView.backgroundColor = [UIColor redColor];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.rowHeight = 60;
    tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tabView];
    tabView.showsVerticalScrollIndicator = NO;
    
    ///// collectionView   
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView * collectioView = [[UICollectionView alloc]initWithFrame:CGRectMake(tabView.x+ tabView.width, tabView.y, self.view.width - tabView.width, tabView.height) collectionViewLayout:flowLayout ];
    flowLayout.minimumInteritemSpacing = CGFLOAT_MIN;
    flowLayout.minimumLineSpacing = CGFLOAT_MIN;
    collectioView.delegate = self;
    collectioView.dataSource = self;
    collectioView.backgroundColor = [UIColor whiteColor];
    
    [collectioView registerNib:[UINib nibWithNibName:@"UpImageDownLabCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"UpImageDownLabCollectionViewCell"];
    
     [collectioView registerNib:[UINib nibWithNibName:@"YYYCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"YYYCollectionViewCell"];
    [self.view addSubview:collectioView];
    self.collectionView = collectioView;
    
    [[Tool managerTool] getSecondDataWithSuccess:^(NSDictionary* responseObject) {
        self.dataDict =responseObject.copy;
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error==%@",error);
    }];
    
    [[Tool managerTool] getComnDataWithSuccess:^(NSDictionary *responseObject) {
        self.picDict = responseObject.copy;
        
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error===%@",error);
    }];
    
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;

    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.picDict) {
        return 2;
    }else{
        return 1;
    }
   
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.picDict) {
        if (section == 0) {
            NSArray * array = self.picDict[self.titleArray[selectedRow]];
            return array.count;
        }else{
             NSArray * array = self.dataDict[self.titleArray[selectedRow]];
            NSLog(@"===%ld",array.count);
            return array.count;
            
        }
    }else{
        NSArray * array = self.dataDict[self.titleArray[selectedRow]];
        NSLog(@"===%ld",array.count);
        return array.count;
    }
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.picDict) {
        if (indexPath.section==0) {
            return CGSizeMake(self.collectionView.width/3.0, self.collectionView.width*340.f/1080.f);
        }else{
            return CGSizeMake((self.collectionView.width)/3.0, self.collectionView.width*0.2);
        }
    }else{
       return CGSizeMake((self.collectionView.width)/3.0, self.collectionView.width*0.2);
    }
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UpImageDownLabCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UpImageDownLabCollectionViewCell" forIndexPath:indexPath];
        IMGCategory * imgCate = self.picDict[self.titleArray[selectedRow]][indexPath.row];
        NSString *url = [imgCate.pic componentsSeparatedByString:@".webp"][0];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
        cell.title.text = imgCate.categoryName;
    
        return cell;
    }else{
        YYYCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YYYCollectionViewCell" forIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor blackColor];
         CLASSObjects * obj =self.dataDict[self.titleArray[selectedRow]][indexPath.row];
        cell.layer.borderWidth = 0.3;
        cell.layer.borderColor = [UIColor grayColor].CGColor;
        NSString *url = [obj.logoImage componentsSeparatedByString:@".webp"][0];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
        
        return cell;
    }
    
   
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        IMGCategory * imgCate = self.picDict[self.titleArray[selectedRow]][indexPath.row];
        NSLog(@"===%@",imgCate.categoryName);
    }else{
         CLASSObjects * obj =self.dataDict[self.titleArray[selectedRow]][indexPath.row];
        NSLog(@"===%@",obj.name);
    }
    
    
    
}

#pragma  mark ---- 表代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        UIView * indtiferView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 60)];
        indtiferView.backgroundColor = [UIColor redColor];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        indtiferView.tag = 100;
    
        [cell.selectedBackgroundView addSubview:indtiferView];
    }
    
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    if (indexPath.row == selectedRow) {
        [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        cell.textLabel.textColor = [UIColor redColor];
        
        
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    selectedRow = indexPath.row;
    
    [tableView reloadData];
    [self.collectionView reloadData];
    
    NSLog(@"dfddfdffdfd");
}












-(void)btnClick:(UIButton*)button{
    NSLog(@"===%ld",button.tag);
    switch (button.tag) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        default:
            break;
    }
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
