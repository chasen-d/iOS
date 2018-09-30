//
//  CSAlertViewController.m
//  iOSProject
//
//  Created by changcai on 2018/9/29.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSAlertViewController.h"

static NSString *const cellId = @"CSAlertViewCellID";

@interface CSAlertViewController ()

@property (nonatomic, strong) NSArray * dataSoureArray;
@property (nonatomic, strong) NSArray * sectionViewArray;

@end

@implementation CSAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSoureArray = @[ @[@"1.1.常规两个按钮alert",
                               @"1.2.简易调试使用alert，单按钮，标题默认为“确定”",
                               @"1.3.不定数量按钮alert",
                               @"1.4.无按钮toast样式",
                               @"1.5.单文字HUD",
                               @"1.6.带indicatorView的HUD",
                               @"1.7.带进度条的HUD，成功！",
                               @"1.8.带进度条的HUD，失败！",
                               ],
                             @[
                                 @"2.1.常规alertController-Alert",
                                 @"2.2.常规alertController-ActionSheet",
                                 @"2.3.无按钮alert-toast",
                                 @"2.4.无按钮actionSheet-toast",
                                 @"2.5.带输入框的alertController-Alert",
                                 ]
                             ];
    self.sectionViewArray = @[
                              [self labelWithText:@"1.AlertView-推荐日常调试使用"],
                              [self labelWithText:@"2.AlertController-iOS8"]
                              ];

}

#pragma mark - UI
- (UILabel *)labelWithText:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    label.text = text;
    label.font = [UIFont boldSystemFontOfSize:20];
    label.backgroundColor = [[UIColor randomColor] colorWithAlphaComponent:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSoureArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionArray = self.dataSoureArray[section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.backgroundColor = [UIColor randomColor];
    cell.textLabel.text = self.dataSoureArray[indexPath.section][indexPath.row];
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.sectionViewArray[section];
}

#pragma mark alert使用示例
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            //1.
//                        [JXTAlertView showAlertViewWithTitle:@"title" message:@"message" cancelButtonTitle:@"cancel" otherButtonTitle:@"other" cancelButtonBlock:^(NSInteger buttonIndex) {
//                            NSLog(@"cancel");
//                        } otherButtonBlock:^(NSInteger buttonIndex) {
//                            NSLog(@"other");
//                        }];
            //2.
            jxt_showAlertTwoButton(@"常规两个按钮alert", @"支持按钮点击回调，支持C函数快速调用", @"cancel", ^(NSInteger buttonIndex) {
                NSLog(@"cancel");
            }, @"other", ^(NSInteger buttonIndex) {
                NSLog(@"other");
            });
        }
        else if (indexPath.row == 1)
        {
            jxt_showAlertTitle(@"简易调试使用alert，单按钮，标题默认为“确定”");
        }
        else if (indexPath.row == 2)
        {
            [JXTAlertView showAlertViewWithTitle:@"不定数量按钮alert" message:@"支持按钮点击回调，根据按钮index区分响应，有cancel按钮时，cancel的index默认0，无cancel时，按钮index根据添加顺序计算" cancelButtonTitle:@"cancel" buttonIndexBlock:^(NSInteger buttonIndex) {
                if (buttonIndex == 0) {
                    NSLog(@"cancel");
                }
                else if (buttonIndex == 1) {
                    NSLog(@"按钮1");
                }
                else if (buttonIndex == 2) {
                    NSLog(@"按钮2");
                }
                else if (buttonIndex == 3) {
                    NSLog(@"按钮3");
                }
                else if (buttonIndex == 4) {
                    NSLog(@"按钮4");
                }
                else if (buttonIndex == 5) {
                    NSLog(@"按钮5");
                }
            } otherButtonTitles:@"按钮1", @"按钮2", @"按钮3", @"按钮4", @"按钮5", nil];
        }
        else if (indexPath.row == 3)
        {
            //1.
            [JXTAlertView showToastViewWithTitle:@"无按钮toast样式" message:@"可自定义展示延时时间，支持关闭回调" duration:2 dismissCompletion:^(NSInteger buttonIndex) {
                NSLog(@"关闭");
            }];
            //2.
            //            jxt_showToastTitleDismiss(@"无按钮toast样式", 2, ^(NSInteger buttonIndex) {
            //                NSLog(@"关闭");
            //            });
            //3.
            //            jxt_showToastMessage(@"无按钮toast样式", 0);
        }
        else if (indexPath.row == 4)
        {
            //1.
            //            jxt_showTextHUDTitle(@"单文字HUD");
            //2.
            jxt_showTextHUDTitleMessage(@"单文字HUD", @"支持子标题，手动执行关闭，可改变显示状态");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                jxt_dismissHUD();
            });
        }
        else if (indexPath.row == 5)
        {
            jxt_showLoadingHUDTitleMessage(@"带indicatorView的HUD", @"支持子标题，手动执行关闭，可改变显示状态");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                jxt_dismissHUD();
            });
        }
        else if (indexPath.row == 6)
        {
            jxt_showProgressHUDTitleMessage(@"带进度条的HUD", @"支持子标题，手动执行关闭，可改变显示状态");
            __block float count = 0;
#pragma mark - timer block ios10 only
            if (@available(iOS 10.0, *)) {
                [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                    count += 0.05;
                    jxt_setHUDProgress(count);
                    if (count > 1) {
                        [timer invalidate];
                        jxt_setHUDSuccessTitle(@"加载成功！");
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            jxt_dismissHUD();
                        });
                    }
                }];
            } else {
                // Fallback on earlier versions
            }
        }
        else if (indexPath.row == 7)
        {
            jxt_showProgressHUDTitleMessage(@"带进度条的HUD", @"支持子标题，手动执行关闭，可改变显示状态");
            __block float count = 0;
#pragma mark - timer block ios10 only
            if (@available(iOS 10.0, *)) {
                [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                    count += 0.05;
                    jxt_setHUDProgress(count);
                    if (count > 1) {
                        [timer invalidate];
                        jxt_setHUDFailMessage(@"加载失败！");
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            jxt_dismissHUD();
                        });
                    }
                }];
            } else {
                // Fallback on earlier versions
            }
        }
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            [self jxt_showAlertWithTitle:@"常规alertController-Alert" message:@"基于系统UIAlertController封装，按钮以链式语法模式快捷添加，可根据按钮index区分响应，可根据action区分响应，支持配置弹出、关闭回调，可关闭弹出动画" appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                alertMaker.
                addActionCancelTitle(@"cancel").
                addActionDestructiveTitle(@"按钮1");
            } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                if (buttonIndex == 0) {
                    NSLog(@"cancel");
                }
                else if (buttonIndex == 1) {
                    NSLog(@"按钮1");
                }
                NSLog(@"%@--%@", action.title, action);
            }];
        }
        else if (indexPath.row == 1)
        {
            [self jxt_showActionSheetWithTitle:@"常规alertController-ActionSheet" message:@"基于系统UIAlertController封装，按钮以链式语法模式快捷添加，可根据按钮index区分响应，可根据action区分响应，支持配置弹出、关闭回调，可关闭弹出动画" appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                alertMaker.
                addActionCancelTitle(@"cancel").
                addActionDestructiveTitle(@"按钮1").
                addActionDefaultTitle(@"按钮2").
                addActionDefaultTitle(@"按钮3").
                addActionDestructiveTitle(@"按钮4");
            } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                
                if ([action.title isEqualToString:@"cancel"]) {
                    NSLog(@"cancel");
                }
                else if ([action.title isEqualToString:@"按钮1"]) {
                    NSLog(@"按钮1");
                }
                else if ([action.title isEqualToString:@"按钮2"]) {
                    NSLog(@"按钮2");
                }
                else if ([action.title isEqualToString:@"按钮3"]) {
                    NSLog(@"按钮3");
                }
                else if ([action.title isEqualToString:@"按钮4"]) {
                    NSLog(@"按钮4");
                }
            }];
        }
        else if (indexPath.row == 2)
        {
            [self jxt_showAlertWithTitle:@"无按钮alert-toast" message:@"toast样式，可自定义展示延时时间，支持配置弹出、关闭回调，可关闭弹出动画" appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                alertMaker.toastStyleDuration = 2;
                [alertMaker setAlertDidShown:^{
                    [self logMsg:@"alertDidShown"];//不用担心循环引用
                }];
                alertMaker.alertDidDismiss = ^{
                    [self logMsg:@"alertDidDismiss"];
                };
            } actionsBlock:NULL];
        }
        else if (indexPath.row == 3)
        {
            [self jxt_showActionSheetWithTitle:@"无按钮actionSheet-toast" message:@"toast样式，可自定义展示延时时间，支持配置弹出、关闭回调，可关闭弹出动画" appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                alertMaker.toastStyleDuration = 3;
                //关闭动画效果
                [alertMaker alertAnimateDisabled];
                
                [alertMaker setAlertDidShown:^{
                    NSLog(@"alertDidShown");
                }];
                alertMaker.alertDidDismiss = ^{
                    NSLog(@"alertDidDismiss");
                };
            } actionsBlock:NULL];
        }
        else if (indexPath.row == 4)
        {
            [self jxt_showAlertWithTitle:@"带输入框的alertController-Alert" message:@"点击按钮，控制台打印对应输入框的内容" appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                alertMaker.
                addActionDestructiveTitle(@"获取输入框1").
                addActionDestructiveTitle(@"获取输入框2");
                
                [alertMaker addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = @"输入框1-请输入";
                }];
                [alertMaker addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = @"输入框2-请输入";
                }];
            } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                if (buttonIndex == 0) {
                    UITextField *textField = alertSelf.textFields.firstObject;
                    [self logMsg:textField.text];//不用担心循环引用
                }
                else if (buttonIndex == 1) {
                    UITextField *textField = alertSelf.textFields.lastObject;
                    [self logMsg:textField.text];
                }
            }];
        }
    }
}

#pragma mark - Methods
- (void)logMsg:(NSString *)msg
{
    NSLog(@"%@", msg);
}
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


@end
