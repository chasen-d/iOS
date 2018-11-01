//
//  CSButtonTableViewController.m
//  iOSProject
//
//  Created by changcai on 2018/11/1.
//  Copyright © 2018 changcai. All rights reserved.
//

#import "CSButtonTableViewController.h"

@interface CSButtonTableViewController ()

@end

@implementation CSButtonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSoureArray = @[@{@"title":@"多次点击按钮",@"className":@"YFMultipleClicksViewController"},
                            @{@"title":@"微信注册按钮",@"className":@"YFAnimationCircleButtonVC"},
                            @{@"title":@"ape展开按钮",@"className":@"YFBubbleMenuButtonViewController"},
                            @{@"title":@"各种圆角按钮",@"className":@"YFAllRoundButtonVC"},
                            ];
}


@end
