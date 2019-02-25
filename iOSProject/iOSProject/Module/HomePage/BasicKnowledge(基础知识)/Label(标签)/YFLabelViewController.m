//
//  YFLabelViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFLabelViewController.h"

@interface YFLabelViewController ()

@end

@implementation YFLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSoureArray = @[ @{@"title":@"自动布局标签",@"className":@"YFAutolayoutTagViewController_UIStoryboard"},
                             @{@"title":@"球形滚动标签",@"className":@"YFSphereTagCloud"},
                             @{@"title":@"球形滚动标签2",@"className":@"YFSphereViewController"},
                             @{@"title":@"视觉效果标签云",@"className":@"YFTagsCloudViewController_UIStoryboard"},
                             @{@"title":@"闪烁文字渐现",@"className":@"YFShineLabelViewController"},
                             @{@"title":@"闪烁文字渐现2",@"className":@"YFLazyInViewController_UIStoryboard"},
                             @{@"title":@"快播动态标签",@"className":@"YFDynamicLabelViewController"},
                             @{@"title":@"跑马灯",@"className":@"YFMarqueeViewController"},
                             @{@"title":@"打印机特效",@"className":@"YFPrinterEffectViewController"},
                             @{@"title":@"评分条",@"className":@"YFRatingBarViewController"},
                             @{@"title":@"底部对齐Label",@"className":@"CSBottomAligmentLabelViewController"},
                             ];

    
}




@end
