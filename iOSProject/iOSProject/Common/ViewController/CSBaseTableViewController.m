//
//  CSBaseTableViewController.m
//  iOSProject
//
//  Created by changcai on 2018/9/13.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSBaseTableViewController.h"
#import "CSArrayDataSource.h"


static NSString *mainCellIdentifier = @"mainCellIdentifier";
const int cellHeight = 60;

@interface CSBaseTableViewController ()

@property (nonatomic, retain) CSArrayDataSource *arrayDataSource;

@end

@implementation CSBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    //cell分割线向左移动15像素
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }

    if(@available(iOS 11.0,*)){
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    

}

- (void)setDataSoureArray:(NSArray *)dataSoureArray
{
    _dataArray = [CSMainDataModel mj_objectArrayWithKeyValuesArray:dataSoureArray];
    void (^ConfigureCell)(UITableViewCell *, CSMainDataModel *) = ^(UITableViewCell *cell, CSMainDataModel *model) {
        
        cell.textLabel.text = model.title;
        cell.detailTextLabel.text = model.className;
        cell.contentView.backgroundColor = [UIColor randomColor];
        
    };
    _arrayDataSource = [[CSArrayDataSource alloc] initWithItems:_dataArray cellIdentifier:mainCellIdentifier configureCellBlock:ConfigureCell];
    self.tableView.dataSource = _arrayDataSource;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CSMainDataModel *model = [_dataArray objectAtIndex:indexPath.row];
    NSString *className = model.className;
    
    // 注意: 如果是sb来搭建, 必须以 _UIStoryboard 结尾
    NSUInteger classNameLength = className.length;
    NSUInteger storyBoardLength = @"_UIStoryboard".length;
    NSUInteger xibLength = @"_xib".length;
    
    NSString *suffixClassName;
    if (classNameLength > storyBoardLength) {
        suffixClassName = [className substringFromIndex:classNameLength - storyBoardLength];
    }
    
    if ([suffixClassName isEqualToString:@"_UIStoryboard"]) {
        
        className = [className substringToIndex:classNameLength - storyBoardLength];
        
        if ([className isEqualToString:@""]) {
            
        }else {
            // 注意: 这个storyboard的名字必须是控制器的名字
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:className bundle:nil];
            UIViewController *cardVC = [storyBoard instantiateInitialViewController];
            if (!cardVC) {
                cardVC = [storyBoard instantiateViewControllerWithIdentifier:className];
            }
            cardVC.title = model.title;
            [self.navigationController pushViewController:cardVC animated:YES ];
        }
        
    }else if ([[className substringFromIndex:classNameLength - xibLength] isEqualToString:@"_xib"]) {
        
        className = [className substringToIndex:classNameLength - xibLength];
        
        UIViewController *vc = [[NSClassFromString(className) alloc]initWithNibName:className bundle:nil];
        vc.title = model.title;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else {
        NSLog(@"className = %@", className);
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        vc.title = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
*/
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
