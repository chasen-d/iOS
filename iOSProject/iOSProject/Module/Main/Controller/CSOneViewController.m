//
//  CSOneViewController.m
//  iOSProject
//
//  Created by changcai on 2018/9/11.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSOneViewController.h"
#import "CSArrayDataSource.h"

@interface CSOneViewController ()
/**
 模型数组
 */
@property(nonatomic,copy)NSArray *dataArray;

@end

@implementation CSOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"目录";
    
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [backImageView setImage:[UIImage imageNamed:@"tableviewbeijing"]];
    self.tableView.backgroundView = backImageView;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    //cell分割线向左移动15像素
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    self.dataSoureArray = @[@{@"title":@"基础知识",@"className":@"CSBasicKnowledgeController"},
                            @{@"title":@"功能集合(直接拿来用)",@"className":@"CSFunctionListViewController"},
                            @{@"title":@"动画效果",@"className":@"CSAnimationListTableViewController"},
                            @{@"title":@"算法",@"className":@"CSSortViewController"},
                           ];
    
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:[CSUIFactory createSystemButtonWithFrame:CGRectMake(0, 0, 50, 44) Target:self Action:@selector(aboutClick) Title:@"关于"]];

    
    self.navigationItem.rightBarButtonItem = rightButton;

    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[@"https://www.jianshu.com/u/e94261948f1d" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    }];
    
    //404
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.github.com/xx"]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
    }];
    NSLog(@"%lu",[self.navigationController viewControllers].count);
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    NSString *url = @"http://music.163.com/m/video?id=04C5185ED4E76A183BDB6B268F393070";
    
    [manger GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.userInfo);
    }];

}

- (void)aboutClick {
    
    CSWebViewController *ac = [CSWebViewController new];
    ac.gotoURL = @"https://github.com/chasen-d/iOS";
    
    [self.navigationController pushViewController:ac animated:YES];
    NSLog(@"%s", __func__);
    
}

- (void)setDataSoureArray:(NSArray *)dataSoureArray
{
    self.dataArray = [CSMainDataModel mj_objectArrayWithKeyValuesArray:dataSoureArray];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSoneCellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CSoneCellIdentifier"];
    }
    CSMainDataModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.className;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CSMainDataModel *model = [_dataArray objectAtIndex:indexPath.row];
    
    UIViewController *vc = [[NSClassFromString(model.className) alloc] init];
    vc.title = model.title;
    if (vc)
    {
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
