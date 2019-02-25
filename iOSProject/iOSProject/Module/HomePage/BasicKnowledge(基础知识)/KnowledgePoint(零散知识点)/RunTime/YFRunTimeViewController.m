//
//  YFRunTimeViewController.m
//  BigShow1949
//
//  Created by 杨帆 on 16/7/6.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFRunTimeViewController.h"

@interface YFRunTimeViewController ()

@end

@implementation YFRunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSoureArray = @[ @{@"title":@"字典转模型",@"className":@"YFDictToModelViewController"},
                             @{@"title":@"分类属性",@"className":@"YFCategoryAttributeViewController"},
                             @{@"title":@"动态添加方法",@"className":@"YFAddMethodViewController"},
                             @{@"title":@"图片加载(方法交换)",@"className":@"YFExchangeMethodVC"},
                             @{@"title":@"消息转发",@"className":@"MsgForwardingViewController"},
                             @{@"title":@"多次点击按钮(方法交换)",@"className":@"YFMultipleClicksViewController"},
                             ];

}



@end
