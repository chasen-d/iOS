//
//  CSBasicKnowledgeController.m
//  iOSProject
//
//  Created by changcai on 2018/9/28.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSBasicKnowledgeController.h"

@interface CSBasicKnowledgeController ()

@end

@implementation CSBasicKnowledgeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dataSoureArray = @[ @{@"title":@"自定义各种弹框",@"className":@"CSAlertViewController"},
                             @{@"title":@"指纹解锁",@"className":@"CSTouchIDViewController"},
                             @{@"title":@"自定义弹出视图",@"className":@"CSCustomAlertViewController"},
                             @{@"title":@"button按钮",@"className":@"CSButtonTableViewController"},
                             @{@"title":@"Label标签",@"className":@"YFLabelViewController"},
                             ];
    
}




@end
