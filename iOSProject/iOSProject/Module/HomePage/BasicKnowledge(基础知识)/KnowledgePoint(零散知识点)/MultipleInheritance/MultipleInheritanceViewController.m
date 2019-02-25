//
//  MultipleInheritanceViewController.m
//  BigShow1949
//
//  Created by apple on 16/11/30.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "MultipleInheritanceViewController.h"

@interface MultipleInheritanceViewController ()

@end

@implementation MultipleInheritanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSoureArray = @[ @{@"title":@"分类",@"className":@"MultipleCategory"},
                             @{@"title":@"组合模式",@"className":@"MultipleCombination"},
                             @{@"title":@"代理",@"className":@"MultipleDelegate"},
                             @{@"title":@"消息转发",@"className":@"MultipleMsgForawrd"},
                             @{@"title":@"协议",@"className":@"MultipleProtocol"},
                             ];
  
    
}


@end
