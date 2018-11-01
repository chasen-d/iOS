//
//  UIImage+CSCategory.m
//  iOSProject
//
//  Created by changcai on 2018/10/16.
//  Copyright © 2018 changcai. All rights reserved.
//

#import "UIImage+CSCategory.h"

@implementation UIImage (CSCategory)

//图片圆角
- (UIImage *)circleimage{
    //NO代表透明  YES代表四角边上的是黑色的 具体可以自己试下就知道了
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    //获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    //裁剪
    CGContextClip(ctx);
    
    //将图片画上去
    [self drawInRect:rect];
    //    获取图片
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

@end
