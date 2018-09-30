//
//  CSBaseTableViewController.h
//  iOSProject
//
//  Created by changcai on 2018/9/13.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSBaseTableViewController : UITableViewController

/**
 数据源数组
 */
@property(nonatomic,strong)NSArray *dataSoureArray;

/**
 模型数组
 */
@property(nonatomic,retain)NSArray *dataArray;

@end
