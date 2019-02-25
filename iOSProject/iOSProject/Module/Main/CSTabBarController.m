//
//  CSTabBarController.m
//  iOSProject
//
//  Created by changcai on 2018/8/22.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSTabBarController.h"
#import "CSNavigationController.h"

#import "CSOneViewController.h"

@interface CSTabBarController ()<UITabBarControllerDelegate>

@end

@implementation CSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self addChildViewControllers];
    [self addTabarItems];
}

- (void)customIsInGod:(NSNotification *)noti {
    if (![noti.object boolValue]) {
        return;
    }
}

- (void)addChildViewControllers{
    
    CSNavigationController *one = [[CSNavigationController alloc]initWithRootViewController:[[CSOneViewController alloc]init]];
    
    
    self.viewControllers = @[one];
    
}

- (void)addTabarItems
{
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"基础",
                                                 @"TabBarItemImage" : @"tabBar_essence_icon",
                                                 @"TabBarItemSelectedImage" : @"tabBar_essence_click_icon",
                                                 };
    


    NSArray<NSDictionary *>  *tabBarItemsAttributes = @[ firstTabBarItemsAttributes];
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.tabBarItem.title = tabBarItemsAttributes[idx][@"TabBarItemTitle"];
        obj.tabBarItem.image = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemImage"]];
        obj.tabBarItem.selectedImage = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemSelectedImage"]];
        obj.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
        [obj.tabBarItem setTitleTextAttributes:@{
                                                NSFontAttributeName :            [UIFont systemFontOfSize:12],
                                                NSForegroundColorAttributeName : [UIColor orangeColor]
                                                }
                                     forState:UIControlStateSelected];
        [obj.tabBarItem setTitleTextAttributes:@{
                                                 NSFontAttributeName :            [UIFont systemFontOfSize:10],
                                                 NSForegroundColorAttributeName : [UIColor redColor]
                                                 }
                                      forState:UIControlStateNormal];
    }];
    
//    self.tabBar.tintColor = [UIColor redColor];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
