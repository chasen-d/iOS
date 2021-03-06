//
//  YFSphereViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/3/22.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "YFSphereViewController.h"
#import "ZYQSphereView.h"

@interface YFSphereViewController (){
    ZYQSphereView *sphereView;
}

@end

@implementation YFSphereViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    sphereView = [[ZYQSphereView alloc] initWithFrame:CGRectMake(10, 60, 300, 300)];
    sphereView.center=CGPointMake(self.view.center.x, self.view.center.y-30);
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (int i = 0; i < 50; i++) {
        UIButton *subV = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        subV.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100. green:arc4random_uniform(100)/100. blue:arc4random_uniform(100)/100. alpha:1];
        [subV setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        subV.layer.masksToBounds=YES;
        subV.layer.cornerRadius=3;
        [subV addTarget:self action:@selector(subVClick:) forControlEvents:UIControlEventTouchUpInside];
        [views addObject:subV];
        
    }
    
    [sphereView setItems:views];
    
    sphereView.isPanTimerStart=YES;

    
    [self.view addSubview:sphereView];
    [sphereView timerStart];
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((KSCREEN_WIDTH-120)/2, CGRectGetMaxY(sphereView.frame)+20, 120, 30);
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.borderWidth=1;
    btn.layer.borderColor=[[UIColor orangeColor] CGColor];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitle:@"start/stop" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(changePF:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)subVClick:(UIButton*)sender{
    NSLog(@"%@",sender.titleLabel.text);
    
    BOOL isStart=[sphereView isTimerStart];
    
    [sphereView timerStop];
    
    [UIView animateWithDuration:0.3 animations:^{
        sender.transform=CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            sender.transform=CGAffineTransformMakeScale(1, 1);
            if (isStart) {
                [sphereView timerStart];
            }
        }];
    }];
}

-(void)changePF:(UIButton*)sender{
    if ([sphereView isTimerStart]) {
        [sphereView timerStop];
    }
    else{
        [sphereView timerStart];
    }
}
@end
