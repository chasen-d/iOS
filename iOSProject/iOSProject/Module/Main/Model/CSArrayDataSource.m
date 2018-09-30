//
//  CSArrayDataSource.m
//  iOSProject
//
//  Created by changcai on 2018/9/13.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSArrayDataSource.h"

@interface CSArrayDataSource ()

@property(nonatomic,retain)NSArray *items;
@property(nonatomic,copy)NSString *cellIdentifier;
@property(nonatomic,copy)ConfigureCell configureCellBlock;
@end

@implementation CSArrayDataSource

-(instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)identifier configureCellBlock:(ConfigureCell)configureCellBlock
{
    self = [super init];
    if (self) {
        _items =items;
        _cellIdentifier =identifier;
        _configureCellBlock =configureCellBlock;
    }
    return self;
}

- (void)setDataSourceArray:(NSArray *)arry;
{
    _items = arry;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return [_items objectAtIndex:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier];
    
    //如果是自定义的cell必须在原来的tablView处调用
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:mainCellIdentifier];
    //否则会无法执行自定义cell的方法
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:_cellIdentifier];
    }
    id item = [self itemAtIndexPath:indexPath];
    _configureCellBlock(cell,item);
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}


@end
