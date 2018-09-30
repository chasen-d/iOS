//
//  UIView+CSCategory.h
//  iOSProject
//
//  Created by changcai on 2018/9/11.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CSCategory)

@property (nonatomic, assign) CGFloat cs_x;
@property (nonatomic, assign) CGFloat cs_y;
@property (nonatomic, assign) CGFloat cs_width;
@property (nonatomic, assign) CGFloat cs_height;
@property (nonatomic, assign) CGSize  cs_size;

@property (nonatomic, assign) CGPoint cs_origin;
@property (nonatomic, assign) CGFloat cs_originX;
@property (nonatomic, assign) CGFloat cs_originY;

@property (nonatomic, assign) CGFloat cs_top;
@property (nonatomic, assign) CGFloat cs_bottom;
@property (nonatomic, assign) CGFloat cs_left;
@property (nonatomic, assign) CGFloat cs_right;
@property (nonatomic, assign) CGFloat cs_centerX;
@property (nonatomic, assign) CGFloat cs_centerY;



@end
