//
//  UIButton+CSCategory.h
//  iOSProject
//
//  Created by changcai on 2018/9/11.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ButtonEdgeInsetsStyle) {
    ButtonEdgeInsetsStyleTop,    // image在上，label在下
    ButtonEdgeInsetsStyleLeft,   // image在左，label在右
    ButtonEdgeInsetsStyleBottom, // image在下，label在上
    ButtonEdgeInsetsStyleRight   // image在右，label在左
};

typedef void(^ButtonActionCallBack)(UIButton *button);

@interface UIButton (CSCategory)

- (void)addCallBackAction:(ButtonActionCallBack)action
        forControlEvents:(UIControlEvents)controlEvents;

- (void)addCallBackAction:(ButtonActionCallBack)action;

/**
 *  button样式：左侧文字，右侧图片
 *
 *  @param title     button的title
 *  @param imageName button右侧的image
 */
- (void)setButtonTitle:(NSString *)title
   withRightImageName:(NSString *)imageName;

/**
 *  <#Description#>
 *
 *  @param style button样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;


@end

@interface UIButton (EnlargeTouchArea)

@property (nonatomic, strong) NSString *selectedIndex;

/**
 *  扩大 UIButton 的點擊範圍
 *  控制上下左右的延長範圍
 *
 *  @param top    <#top description#>
 *  @param right  <#right description#>
 *  @param bottom <#bottom description#>
 *  @param left   <#left description#>
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
