//
//  CSArrayDataSource.h
//  iOSProject
//
//  Created by changcai on 2018/9/13.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ConfigureCell)(id cell , id item);

@interface CSArrayDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)identifier configureCellBlock:(ConfigureCell)configureCellBlock;
- (void)setDataSourceArray:(NSArray *)array;

@end
