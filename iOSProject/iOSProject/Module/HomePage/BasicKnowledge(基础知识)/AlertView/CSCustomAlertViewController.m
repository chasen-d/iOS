//
//  CSCustomAlertViewController.m
//  iOSProject
//
//  Created by changcai on 2018/9/30.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSCustomAlertViewController.h"
#import "CSMessageView.h"

@interface CSCustomAlertViewController ()

@end

@implementation CSCustomAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UITableViewController默认的会在viewWillAppear的时候，清空所有选中cell
     self.clearsSelectionOnViewWillAppear = NO;
    
    self.dataSoureArray =@[
                           @{@"title":@"仿QQ导航栏弹出提示框",@"className":@""},
                           @{@"title":@"状态栏提示框",@"className":@""},
                           @{@"title":@"简单屏幕提示",@"className":@""},
                           ];
    
}

#pragma mark - Table view

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0:
        {
            [CSMessageView showMessage:@"这是一个提示哦"];
        }
            break;
        case 1:
        {
            [CSMessageView showStatusBarMessage:@"这是一个提示哦"];
        }
            break;
        case 2:
        {
            [CSMessageView showMessageHub:@"这是提示消息"];
        }
            break;

        default:
            break;
    }

}



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
