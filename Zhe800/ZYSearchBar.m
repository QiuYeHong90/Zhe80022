
//
//  ZYSearchBar.m
//  Zhe800
//
//  Created by Darius_mac on 16/7/2.
//  Copyright © 2016年 ZhiYou. All rights reserved.
//

#import "ZYSearchBar.h"
#import "UIView+YMExtension.h"
@implementation ZYSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, self.height)];
//        /Users/mac/Desktop/Zhe800/Zhe800/Resource/common_webbar_back_gray_btn@2x.png
        [btn setImage:[UIImage imageNamed:@"common_webbar_back_gray_btn"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(goBacktoView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(50,0, self.width- 50-60, 36)];
        textField.centerY = self.height/2;
        textField.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor grayColor];
        [self addSubview: textField];
        [textField becomeFirstResponder];
        
//        textField.keyboardType = UIKeyboardTypeWebSearch;
        textField.returnKeyType = UIReturnKeySearch;
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 0, 36,36)];
        imageView.centerY = self.height/2;
        imageView.backgroundColor = [UIColor whiteColor];
        
        
        imageView.image = [UIImage imageNamed:@"tag_search"];
        
        textField.leftView = imageView;
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.clearButtonMode = UITextFieldViewModeAlways;
        textField.placeholder = @"文具";
        
        UIButton * rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(textField.x+textField.width, 0, self.width -(textField.x+textField.width) , self.height)];
        
        [rightBtn setTitle:@"取消" forState:UIControlStateNormal];
        [rightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview: rightBtn];
        
        [textField addTarget:self action: @selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
        [textField addTarget:self action:@selector(textFieldIputReturn) forControlEvents:UIControlEventEditingDidEndOnExit];
        
    }
    return self;
}
-(void)goBacktoView{
    self.back();
}

-(void)textFieldIputReturn{
    NSLog(@"return 键 去搜索");
}

-(void)textFieldChange:(UITextField*)textFd{
    
    NSString *strUrl = [textFd.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([strUrl isEqualToString:@""]) {
        
    }else{
        NSLog(@"---%@",strUrl);
    }
}

@end
