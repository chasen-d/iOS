//
//  CSTableViewAnimationlistController.m
//  iOSProject
//
//  Created by changcai on 2018/9/13.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSTableViewAnimationlistController.h"
#import "TableViewAnimationKitHeaders.h"
#import "UITableView+CSCellAnimation.h"

@interface CSTableViewAnimationlistController ()

@property (nonatomic, assign) NSInteger cellNum;

@end

@implementation CSTableViewAnimationlistController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.上下滑动UIScrollview隐藏或者显示导航栏
//    self.navigationController.hidesBarsOnSwipe = YES;
    
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0.25];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:[CSUIFactory createSystemButtonWithFrame:CGRectMake(0, 0, 50, 44) Target:self Action:@selector(loadData) Title:@"Again"]];
    
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)loadData {
    
    _cellNum = 15;
    [self.tableView reloadData];
    [self starAnimationWithTableView:self.tableView];
    
}

- (void)starAnimationWithTableView:(UITableView *)tableView {

    [TableViewAnimationKit showWithAnimationType:self.index tableView:tableView];
//    [self.tableView springListAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.cellNum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        CGFloat width = [[UIScreen mainScreen] bounds].size.width - 40;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 10, width, 80)];
        view.backgroundColor = [UIColor orangeColor];
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 9.0;
        [cell.contentView addSubview:view];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}

//2.上下滑动UIScrollview隐藏或者显示导航栏
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //scrollView已经有拖拽手势，直接拿到scrollView的拖拽手势
    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
    //获取到拖拽的速度 >0 向下拖动 <0 向上拖动
    CGFloat velocity = [pan velocityInView:scrollView].y;
    
    if (velocity <- 5) {
        //向上拖动，隐藏导航栏
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else if (velocity > 5) {
        //向下拖动，显示导航栏
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else if(velocity == 0){
        //停止拖拽
    }
}


@end
