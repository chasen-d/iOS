//
//  YFAllRoundButtonVC.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/16.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFAllRoundButtonVC.h"
#import "APRoundedButton.h"

@interface YFAllRoundButtonVC ()

@end

@implementation YFAllRoundButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    APRoundedButton *button = [[APRoundedButton alloc] init];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(50, 100, 100, 100);
    button.style = 2;
    [self.view addSubview:button];
    
}


@end
