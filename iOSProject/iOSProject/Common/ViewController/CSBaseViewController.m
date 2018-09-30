//
//  CSBaseViewController.m
//  iOSProject
//
//  Created by changcai on 2018/8/23.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSBaseViewController.h"

@interface CSBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CSBaseViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#9FA4AB"], NSForegroundColorAttributeName,[UIFont systemFontOfSize:10.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];

    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#408AFF"], NSForegroundColorAttributeName,[UIFont systemFontOfSize:10.0f],NSFontAttributeName,nil] forState:UIControlStateSelected];

//    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    WeakSelf(self);
    [self.navigationItem addObserverBlockForKeyPath:CSKeyPath(self.navigationItem, title) block:^(id  _Nonnull obj, id  _Nonnull oldVal, NSString  *_Nonnull newVal) {
        if (newVal.length > 0 && ![newVal isEqualToString:oldVal]) {
            weakself.title = newVal;
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    self.navigationController.navigationBar.translucent = NO;
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //导航栏背景色
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"#FFFFFF"];
    
    //设置字体的颜色，大小
    UIColor * color = [UIColor colorWithHexString:@"#26272A"];
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName,CSDEFAULT_FONT(17.0f),NSFontAttributeName,nil];
    self.navigationController.navigationBar.titleTextAttributes = dict;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.navgationBar.width = self.view.width;
    [self.view bringSubviewToFront:self.navgationBar];
}

- (void)dealloc {
    [self.navigationItem removeObserverBlocksForKeyPath:CSKeyPath(self.navigationItem, title)];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - DataSource
- (BOOL)baseViewControllerIsNeedNavBar:(CSBaseViewController *)baseViewController {
    return NO;
}

/**头部标题*/
- (NSMutableAttributedString*)csNavigationBarTitle:(CSNavigationBar *)navigationBar {
    return [self changeTitle:self.title ?: self.navigationItem.title];
}

/** 背景图片 */
- (UIImage *)csNavigationBarBackgroundImage:(CSNavigationBar *)navigationBar
{
    return nil;
}

/** 背景色 */
- (UIColor *)csNavigationBackgroundColor:(CSNavigationBar *)navigationBar {
    return [UIColor colorWithHexString:@"#FFFFFF"];
}

/** 是否显示底部黑线 */
- (BOOL)csNavigationIsHideBottomLine:(CSNavigationBar *)navigationBar
{
    return NO;
}

/** 导航条的高度 */
- (CGFloat)csNavigationHeight:(CSNavigationBar *)navigationBar {
    return [UIApplication sharedApplication].statusBarFrame.size.height + 44.0;
}


/** 导航条的左边的 view */
//- (UIView *)csNavigationBarLeftView:(CSNavigationBar *)navigationBar
//{
//
//}
/** 导航条右边的 view */
//- (UIView *)csNavigationBarRightView:(CSNavigationBar *)navigationBar
//{
//
//}
/** 导航条中间的 View */
//- (UIView *)csNavigationBarTitleView:(CSNavigationBar *)navigationBar
//{
//
//}
/** 导航条左边的按钮 */
//- (UIImage *)csNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(CSNavigationBar *)navigationBar
//{
//
//}
/** 导航条右边的按钮 */
//- (UIImage *)csNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(CSNavigationBar *)navigationBar
//{
//
//}


#pragma mark - Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(CSNavigationBar *)navigationBar {
    NSLog(@"%s", __func__);
}

/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(CSNavigationBar *)navigationBar {
    NSLog(@"%s", __func__);
}

/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(CSNavigationBar *)navigationBar {
    NSLog(@"%s", __func__);
}


#pragma mark 自定义代码
- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange(0, title.length)];
    
    return title;
}

- (CSNavigationBar *)navgationBar {
    // 父类控制器必须是导航控制器
    if(!_navgationBar && [self.parentViewController isKindOfClass:[UINavigationController class]])
    {
        CSNavigationBar *navigationBar = [[CSNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        [self.view addSubview:navigationBar];
        _navgationBar = navigationBar;
        
        navigationBar.dataSource = self;
        navigationBar.csDelegate = self;
        navigationBar.hidden = ![self baseViewControllerIsNeedNavBar:self];
    }
    return _navgationBar;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.navgationBar.title = [self changeTitle:title];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
