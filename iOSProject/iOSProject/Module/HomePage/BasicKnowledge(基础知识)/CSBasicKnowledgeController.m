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
                             @{@"title":@"Masonry基本使用",@"className":@"YFMasonryDemoViewController_UIStoryboard"},
                             @{@"title":@"生命周期",@"className":@"YFLifeCycleViewController"},
                             @{@"title":@"响应者链条",@"className":@"YFResponderChainViewController"},
                             @{@"title":@"引导页",@"className":@"YFGuideViewController"},
                             @{@"title":@"运行时",@"className":@"YFRunTimeViewController"},
                             @{@"title":@"通知中心",@"className":@"YFNotificationCenterVC"},
                             @{@"title":@"统计代码行数",@"className":@"YFStatisticalCodeViewController"},
                             @{@"title":@"GCD",@"className":@"GCDViewController"},
                             @{@"title":@"KVC",@"className":@"KVCViewController"},
                             @{@"title":@"二维码",@"className":@"QRCodeViewController"},
                             @{@"title":@"多继承",@"className":@"MultipleInheritanceViewController"},
                             @{@"title":@"Quartz2D",@"className":@"YFQuartz2DViewController"},
                             @{@"title":@"JS调用",@"className":@"JSViewController"},
                             @{@"title":@"自定义KVO",@"className":@"CSCustomKVOViewController"},
                             ];
    
    
}




@end
