//
//  CSFunctionListViewController.m
//  iOSProject
//
//  Created by changcai on 2018/9/13.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSFunctionListViewController.h"
#import "NSObject+JDPropertyCode.h"
#import "CSWeatherModel.h"
@interface CSFunctionListViewController ()

@end

@implementation CSFunctionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSoureArray = @[@{@"title":@"系统新版本功能封装",@"className":@"CSNewFunctionViewController"},
                           
                           ];
    
    NSDictionary *dic = @{@"weatherinfo":@{@"city":@"鍖椾含",@"cityid":@"101010100",@"temp":@"27.9",@"WD":@"鍗楅",@"WS":@"灏忎簬3绾�",@"SD":@"28%",@"AP":@"1002hPa",@"njd":@"鏆傛棤瀹炲喌",@"WSE":@"<3",@"time":@"17:55",@"sm":@"2.1",@"isRadar":@"1",@"Radar":@"JC_RADAR_AZ9010_JB"}};
    
    [NSObject printPropertyWithDict:dic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
