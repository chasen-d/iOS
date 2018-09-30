//
//  UIView+CSCategory.m
//  iOSProject
//
//  Created by changcai on 2018/9/11.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "UIView+CSCategory.h"

@implementation UIView (CSCategory)

#pragma mark Frame

- (CGFloat)cs_x
{
    return self.frame.origin.x;
}

- (CGFloat)cs_y
{
    return self.frame.origin.y;
}

- (CGFloat)cs_width
{
    return self.frame.size.width;
}

- (CGFloat)cs_height
{
    return self.frame.size.height;
}

-(void)setCs_x:(CGFloat)cs_x
{
    CGRect frame = self.frame;
    frame.origin.x = cs_x;
    self.frame = frame;
}

- (void)setCs_y:(CGFloat)cs_y
{
    CGRect frame = self.frame;
    frame.origin.y = cs_y;
    self.frame = frame;
}

- (void)setCs_width:(CGFloat)cs_width
{
    CGRect frame = self.frame;
    frame.size.width = cs_width;
    self.frame = frame;
}

- (void)setCs_height:(CGFloat)cs_height
{
    CGRect frame = self.frame;
    frame.size.height = cs_height;
    self.frame = frame;
}

- (CGSize)cs_size
{
    return self.frame.size;
}

- (void)setCs_size:(CGSize)cs_size
{
    CGRect frame = self.frame;
    frame.size = cs_size;
    self.frame = frame;
}

- (CGPoint)cs_origin {
    return self.frame.origin;
}

- (void) setCs_origin:(CGPoint)cs_origin {
    self.frame = CGRectMake(cs_origin.x, cs_origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)cs_originX{
    return CGRectGetMinX(self.frame);
}

- (void)setCs_originX:(CGFloat)cs_originX{
    CGRect rect = self.frame;
    rect.origin.x = cs_originX;
    self.frame = rect;
}

- (CGFloat)cs_originY{
    return CGRectGetMinY(self.frame);
}

- (void)setCs_originY:(CGFloat)cs_originY{
    
    CGRect rect = self.frame;
    rect.origin.y = cs_originY;
    self.frame = rect;
}

- (CGFloat)cs_top {
    return CGRectGetMinY(self.frame);
}

- (void) setCs_top:(CGFloat)cs_top{
    self.frame = CGRectMake(self.left, cs_top, self.width, self.height);
}

- (CGFloat)cs_bottom {
    return self.cs_y + self.height;
}

- (void)setCs_bottom:(CGFloat)cs_bottom {
    self.frame = CGRectMake(self.cs_x, cs_bottom - self.height, self.width, self.height);
}

- (CGFloat)cs_left {
    return CGRectGetMinX(self.frame);
}

- (void) setCs_left:(CGFloat)cs_left{
    self.frame = CGRectMake(cs_left, self.top, self.width, self.height);
}

- (CGFloat)cs_right {
    return self.cs_x + self.width;
}

- (void)setCs_right:(CGFloat)cs_right {
    self.frame = CGRectMake(cs_right - self.width, self.cs_y, self.width, self.height);
}

- (CGFloat)cs_centerX
{
    return self.center.x;
}

- (void)setCs_centerX:(CGFloat)cs_centerX
{
    CGPoint center = self.center;
    center.x = cs_centerX;
    self.center = center;
}

- (CGFloat)cs_centerY
{
    return self.center.y;
}

- (void)setCs_centerY:(CGFloat)cs_centerY
{
    CGPoint center = self.center;
    center.y = cs_centerY;
    self.center = center;
}


@end
