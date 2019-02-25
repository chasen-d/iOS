//
//  CSBottomAligmentLabelViewController.m
//  iOSProject
//
//  Created by changcai on 2018/11/6.
//  Copyright © 2018 changcai. All rights reserved.
//

#import "CSBottomAligmentLabelViewController.h"
#import "CSBottomAligmentLabel.h"

@interface CSBottomAligmentLabelViewController ()

@end

@implementation CSBottomAligmentLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CSBottomAligmentLabel *view = [[CSBottomAligmentLabel alloc]initWithFrame:CGRectMake(20, 100, KSCREEN_WIDTH-40, 40)];
    
    [self.view addSubview:view];
    [view addText:@"这是" Font:[UIFont systemFontOfSize:12] TextColor:[UIColor blueColor] IsChinese:YES];
    [view addText:@"一段" Font:[UIFont systemFontOfSize:18] TextColor:[UIColor blackColor] IsChinese:YES];
    [view addText:@"大小" Font:[UIFont systemFontOfSize:14] TextColor:[UIColor greenColor] IsChinese:YES];
    [view addText:@"不同" Font:[UIFont systemFontOfSize:32] TextColor:[UIColor blackColor] IsChinese:YES];
    [view addText:@"的" Font:[UIFont systemFontOfSize:10] TextColor:[UIColor greenColor] IsChinese:YES];
    [view addText:@"文字" Font: [UIFont systemFontOfSize:18] TextColor:[UIColor redColor] IsChinese:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
