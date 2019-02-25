//
//  CSNavigationController.m
//  iOSProject
//
//  Created by changcai on 2018/8/22.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSNavigationController.h"


@interface CSNavigationController ()

@end

@implementation CSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationBar.hidden = YES;
    // 不让自控制器控制系统导航条
    self.fd_viewControllerBasedNavigationBarAppearanceEnabled = NO;
}

+ (void)initialize {
    //appearance方法返回一个导航栏的外观对象
    //修改了这个外观对象，相当于修改了整个项目中的外观
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    //设置导航栏背景颜色
    [navigationBar setBarTintColor:RGB(55, 207, 240)];
    //设置NavigationBarItem文字的颜色
    [navigationBar setTintColor:[UIColor whiteColor]];
    //设置标题栏颜色
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:18]};
    
    /*
     //设置导航栏文字的主题
     NSShadow *shadow = [[NSShadow alloc]init];
     [shadow setShadowOffset:CGSizeZero];
     [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSShadowAttributeName : shadow}];
     [navigationBar setBackgroundImage:[UIImage imageNamed:@"ic_cell_bg_selected"] forBarMetrics:UIBarMetricsDefault];
     //修改所有UIBarButtonItem的外观
     UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
     
     // 修改item的背景图片
     //[barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
     //[barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
     //修改item上面的文字样式
     NSDictionary *dict =@{NSForegroundColorAttributeName : [UIColor whiteColor],NSShadowAttributeName : shadow};
     [barButtonItem setTitleTextAttributes:dict forState:UIControlStateNormal];
     [barButtonItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
     //修改返回按钮样式
     [barButtonItem setBackButtonBackgroundImage:[UIImage imageNamed:NAVIGATION_BAR_BACK_ICON_NAME] forState:UIControlStateNormal barMetrics:UIBarMetricsCompact];
     //设置状态栏样式
     [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
     */
}

//重写push后返回按钮的文字,文字可以为空字符串.
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //修改返回文字
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    //全部修改返回按钮,但是会失去右滑返回的手势
    if (viewController.navigationItem.leftBarButtonItem == nil && self.viewControllers.count >=1) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -17;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popSelf) image:[UIImage imageNamed:@"navigationButtonReturn"]];
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)popSelf
{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
