//
//  GCDViewController.m
//  BigShow1949
//
//  Created by apple on 16/11/18.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSoureArray = @[@{@"title":@"GCD基础知识",@"className":@"GCDBaseViewController"},
                            @{@"title":@"同步若干异步",@"className":@"GCDDispatchGroupViewController"}];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
