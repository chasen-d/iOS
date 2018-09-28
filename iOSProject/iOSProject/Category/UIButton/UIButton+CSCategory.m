//
//  UIButton+CSCategory.m
//  iOSProject
//
//  Created by changcai on 2018/9/11.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "UIButton+CSCategory.h"
#import <objc/runtime.h>

@implementation UIButton (CSCategory)

- (void)addCallBackAction:(ButtonActionCallBack)action
        forControlEvents:(UIControlEvents)controlEvents
{
    [self addCallBackAction:action forControlEvents:controlEvents];
}

- (void)addCallBackAction:(ButtonActionCallBack)action
{
    [self addCallBackAction:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)setButtonTitle:(NSString *)title
   withRightImageName:(NSString *)imageName
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    self.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    self.titleLabel.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    self.imageView.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    //设置图片和title之间的间距
    self.imageEdgeInsets =  UIEdgeInsetsMake(0, -10, 0, 0);
}


- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space{
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
        
    } else {
        
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case ButtonEdgeInsetsStyleTop:
        {
            
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0.0, -imageWith, -imageHeight-space/2.0, 0.0);
        }
        break;
        case ButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
        break;
        case ButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
        break;
        case ButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
        break;
        default:
        break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
    
}


@end

static NSString *strKey = @"strKey";

@implementation UIButton (EnlargeTouchArea)

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setSelectedIndex:(NSString *)selectedIndex
{
    objc_setAssociatedObject(self, &strKey, selectedIndex, OBJC_ASSOCIATION_COPY);
}

- (NSString *)selectedIndex
{
    return objc_getAssociatedObject(self, &strKey);
}


- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber *topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
