//
//  CSChangeIconViewController.m
//  iOSProject
//
//  Created by changcai on 2018/9/13.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSChangeIconViewController.h"

@interface CSChangeIconViewController ()

@end

@implementation CSChangeIconViewController
/*
 注意,需要在 plist 中添加
 NSDictionary *infoPlist;
 infoPlist = @{
 @"CFBundleIcons" : @{
 @"CFBundlePrimaryIcon" : xxx,
 @"CFBundleAlternateIcons" : xxx,
 @"UINewsstandIcon" : xxx
 }
 };
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    //判断是否支持更换图标
    if (@available(iOS 10.3, *)) {
        if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
            UILabel *label =[CSUIFactory createLabelWithFrame:CGRectMake(100, 100, 200, 30) FontSize:15 Text:@"当前系统不支持更换图标"];
            [self.view addSubview:label];
        }else{
            UIButton *button =[CSUIFactory createSystemButtonWithFrame:CGRectMake(100, 140, 150, 30) Target:self Action:@selector(buttonClick1) Title:@"更换晴天图标"];
            
            [self.view addSubview:button];
            
            UIButton *button2 =[CSUIFactory createSystemButtonWithFrame:CGRectMake(100, 240, 150, 30) Target:self Action:@selector(buttonClick2) Title:@"更换天气图标"];
            [self.view addSubview:button2];
            
            UIButton *button3 =[CSUIFactory createSystemButtonWithFrame:CGRectMake(100, 340, 150, 30) Target:self Action:@selector(buttonClick3) Title:@"还原图标"];
            [self.view addSubview:button3];
        }
    } else {
        UILabel *label = [CSUIFactory createLabelWithFrame:CGRectMake(100, 100, 200, 30) FontSize:15 Text:@"当前系统不支持更换图标"];
        [self.view addSubview:label];
    }
}


- (void)buttonClick1 {
    
    if (@available(iOS 10.3, *)) {
        [[UIApplication sharedApplication] setAlternateIconName:@"晴" completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"更换 icon 失败");
            }
        }];
    } else {
        UILabel *label = [CSUIFactory createLabelWithFrame:CGRectMake(100, 100, 200, 30) FontSize:15 Text:@"当前系统不支持更换图标"];
        [self.view addSubview:label];
    }
    
}

- (void)buttonClick2 {
    if (@available(iOS 10.3, *)) {
        [[UIApplication sharedApplication] setAlternateIconName:@"天气" completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"更换 icon 失败");
            }
        }];
    } else {
        UILabel *label = [CSUIFactory createLabelWithFrame:CGRectMake(100, 100, 200, 30) FontSize:15 Text:@"当前系统不支持更换图标"];
        [self.view addSubview:label];
    }
}

- (void)buttonClick3 {
    //还原图标
    if (@available(iOS 10.3, *)) {
        [[UIApplication sharedApplication] setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"更换 icon 失败");
            }
        }];
    } else {
        UILabel *label = [CSUIFactory createLabelWithFrame:CGRectMake(100, 100, 200, 30) FontSize:15 Text:@"当前系统不支持更换图标"];
        [self.view addSubview:label];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
