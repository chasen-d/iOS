//
//  CSCircleImageViewController.m
//  iOSProject
//
//  Created by changcai on 2018/10/16.
//  Copyright © 2018 changcai. All rights reserved.
//

#import "CSCircleImageViewController.h"

@interface CSCircleImageViewController ()

@end

@implementation CSCircleImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //方式一：对圆角直接进行裁剪（对性能消耗最大）
    [self  imageView1];
    
    //方式二：使用CAShapeLayer和UIBezierPath设置圆角
    [self  imageView2];
    
    //方式三：使用贝塞尔曲线UIBezierPath和Core Graphics框架画圆
    [self  imageView3];
    
    //方式四：对圆角进行封装
    [self  imageView4];
    
    //在《iOS-离屏渲染详解》里说第三种方法会使用到mask属性，会离屏渲染,不仅这样,还曾加了一个 CAShapLayer对象.着实不可以取。
    
    //最好的方法
    /*
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = [UIImage imageNamed:@"美国1.jpeg"];
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView1.image = [UIImage imageNamed:@"圆形白边中空图"];
    [self.view addSubview:imageView];
    [self.view addSubview:imageView1];
    */
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:[CSUIFactory createSystemButtonWithFrame:CGRectMake(0, 0, 80, 44) Target:self Action:@selector(rightButtonClick) Title:@"离屏渲染"]];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
}

#pragma mark - OBJMethods
//1.对圆角直接进行裁剪（对性能消耗最大）
-(void)imageView1{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 10, 100, 100)];
    imageView.image = [UIImage imageNamed:@"headImage"];
    //只需要设置layer层的两个属性
    //设置圆角
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    //将多余的部分切掉
    imageView.layer.masksToBounds = YES;
    [self.view addSubview:imageView];
}

//2. 使用CAShapeLayer和UIBezierPath设置圆角
-(void)imageView2{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 120, 100, 100)];
    imageView.image = [UIImage imageNamed:@"headImage"];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:imageView.bounds.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = imageView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
    [self.view addSubview:imageView];
}
//3. 使用贝塞尔曲线UIBezierPath和Core Graphics框架画圆
-(void)imageView3{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 230, 100, 100)];
    imageView.image = [UIImage imageNamed:@"headImage"];
    
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
    [imageView drawRect:imageView.bounds];
    
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    UIGraphicsEndImageContext();
    [self.view addSubview:imageView];
}
//4. 对圆角进行封装
-(void)imageView4{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 340, 100, 100)];
    [imageView setHeader:@"headImage"];
    [self.view addSubview:imageView];
    
}


- (void)rightButtonClick{
    
    CSWebViewController *wb = [CSWebViewController new];
    wb.gotoURL = @"https://www.jianshu.com/p/57e2ec17585b";
    
    [self.navigationController pushViewController:wb animated:YES];
}

@end
