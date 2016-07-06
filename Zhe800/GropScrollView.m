//
//  GropScrollView.m
//  Zhe800
//
//  Created by Darius_mac on 16/7/4.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "GropScrollView.h"
#import "UIView+YMExtension.h"
@implementation GropScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array
{
    
    
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delegate = self;
        self.dataArray = array;
        for (int i = 0; i<array.count; i++) {
            
            UITableView * tabView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
            
            tabView.delegate = self;
            tabView.dataSource = self;
            tabView.x = self.width* i;
            [self addSubview:tabView];
            
            
            
        }
    }
    return self;
}
-(NSArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray = [[NSArray alloc]init];
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   UITableViewCell * cell=  [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
    }
    
    cell.textLabel.text = @"我很牛啊啊啊啊啊";
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"===%ld",indexPath.row);
}
@end
