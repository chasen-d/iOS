//
//  CSmessageView.m
//  iOSProject
//
//  Created by changcai on 2018/9/30.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSmessageView.h"

@implementation CSMessageView : NSObject

+ (void)showMessage:(NSString *)message
{
    
    kDISPATCH_MAIN_THREAD(^{
        
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        [self showMessage:message withView:window];
        
    });
    
}

+(void)showMessage:(NSString *)message withView:(UIView *)view
{
    
    UIView *showView = [CSUIFactory createViewWithFrame:CGRectZero];
    showView.backgroundColor =[UIColor whiteColor];
    showView.alpha = 0;
    showView.layer.cornerRadius = 5;
    showView.layer.masksToBounds = YES;
    [view addSubview:showView];
    
    
    //提示框的位置
    showView.frame = CGRectMake(0, -NAVIGATION_BAR_HEIGHT, KSCREEN_WIDTH, NAVIGATION_BAR_HEIGHT);
    UILabel *messageLabel = [CSUIFactory createLabelWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, KSCREEN_WIDTH, 44) FontSize:14 Text:message];
    [showView addSubview:messageLabel];
    messageLabel.textAlignment =NSTextAlignmentCenter;
    
    
    [UIView animateWithDuration:0.5 animations:^{
        showView.cs_originY = 0;
        showView.alpha =1;
        
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            showView.cs_height = -NAVIGATION_BAR_HEIGHT;
            showView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [showView removeFromSuperview];
        }];
    }];
    
}


+ (void)showStatusBarMessage:(NSString *)message{
    
    UIWindow *window =[UIApplication sharedApplication].keyWindow;
    window.windowLevel = UIWindowLevelStatusBar;
    [self showStatusBarMessage:message withView:window];
}

+(void)showStatusBarMessage:(NSString *)message withView:(UIView *)view
{
    
    UIView *showView =[CSUIFactory createViewWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, STATUS_BAR_HEIGHT)];
    showView.backgroundColor =[UIColor blueColor];
    showView.tag =10000;
    [view addSubview:showView];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(delayMethod) userInfo:nil repeats:YES];
    [timer fire];
    
    UILabel *messageLabel = [CSUIFactory createLabelWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, STATUS_BAR_HEIGHT) FontSize:12 Text:message];
    messageLabel.textAlignment =NSTextAlignmentCenter;
    messageLabel.font =[UIFont boldSystemFontOfSize:12];
    [showView addSubview:messageLabel];
    
    
    [UIView animateWithDuration:0.1 delay:2 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        
        showView.alpha =0;
        
    } completion:^(BOOL finished) {
        [timer invalidate];
        
        int count =0;
        for (UIView *view in [[UIApplication sharedApplication].keyWindow subviews]) {
            if (view.tag ==10000) {
                count++;
            }
        }
        if (count ==1) {
            [UIApplication sharedApplication].keyWindow.windowLevel = UIWindowLevelNormal;
        }
        [showView removeFromSuperview];
        
    }];
    
}

+ (void)delayMethod
{
    for (UIView *view in [[UIApplication sharedApplication].keyWindow subviews]) {
        if (view.tag ==10000) {
            view.backgroundColor =[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:0.6];
            
        }
    }
    
}


+ (void)showMessageHub:(NSString *)message{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [self showMessageHub:message withView:window];
}

+(void)showMessageHub:(NSString *)message withView:(UIView *)view
{
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = RGBA(0, 0, 0, 0.8);
    showview.frame = CGRectZero;
    
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [view addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    //CGSize labelSize = [message sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(290, 9000)];
    NSDictionary *attribute = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGSize labelSize = [message boundingRectWithSize:CGSizeMake(290, 9000) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    label.frame = CGRectMake(10, 5, labelSize.width, labelSize.height);
    label.text = message;
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:14];
    [showview addSubview:label];
    //提示框的位置
    showview.frame = CGRectMake(0, 0, labelSize.width+21*2, labelSize.height+21*2);
    showview.center =CGPointMake(KSCREEN_WIDTH/2, KSCREEN_HEIGHT/2);
    label.center = CGPointMake(showview.frame.size.width/2, showview.frame.size.height/2);
    [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        showview.alpha = 0;
        
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
        
    }];
    
}
@end
