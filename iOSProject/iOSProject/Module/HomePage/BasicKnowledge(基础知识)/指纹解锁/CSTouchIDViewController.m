//
//  CSTouchIDViewController.m
//  iOSProject
//
//  Created by changcai on 2018/9/30.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSTouchIDViewController.h"
#import "TDTouchID.h"

@interface CSTouchIDViewController ()

@end

@implementation CSTouchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [CSUIFactory createSystemButtonWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 44) Target:self Action:@selector(touchVerification) Title:@"指纹识别"];
    button.backgroundColor = [UIColor randomColor];
    [self.view addSubview:button];
}

/**
 验证 TouchID
 */
- (void)touchVerification {
    
    [TDTouchID td_showTouchIDWithDescribe:nil BlockState:^(TDTouchIDState state, NSError *error) {
        
        if (state == TDTouchIDStateNotSupport) {    //不支持TouchID
            jxt_showTextHUDTitleMessage(@"当前设备不支持TouchID",@"");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                jxt_dismissHUD();
            });
            
        } else if (state == TDTouchIDStateSuccess) {    //TouchID验证成功
            
            NSLog(@"jump");
            jxt_showTextHUDTitleMessage(@"指纹验证成功", @"支持子标题，手动执行关闭，可改变显示状态");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                jxt_dismissHUD();
            });
        } else if (state == TDTouchIDStateInputPassword) { //用户选择手动输入密码
            jxt_showTextHUDTitleMessage(@"当前设备不支持TouchID", @"支持子标题，手动执行关闭，可改变显示状态");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                jxt_dismissHUD();
            });
        }else {
            //            localizedFailureReason
            //            localizedDescription
            jxt_showTextHUDTitleMessage(error.localizedDescription, @"支持子标题，手动执行关闭，可改变显示状态");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                jxt_dismissHUD();
            });
        }
        
        // ps:以上的状态处理并没有写完全!
        // 在使用中你需要根据回调的状态进行处理,需要处理什么就处理什么
    }];
}


@end
