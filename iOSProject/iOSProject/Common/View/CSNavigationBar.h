//
//  CSNavigationBar.h
//  iOSProject
//
//  Created by changcai on 2018/9/29.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CSNavigationBar;

// 主要处理导航条
@protocol  CSNavigationBarDataSource<NSObject>

@optional

/**头部标题*/
- (NSMutableAttributedString*)csNavigationBarTitle:(CSNavigationBar *)navigationBar;

/** 背景图片 */
- (UIImage *)csNavigationBarBackgroundImage:(CSNavigationBar *)navigationBar;
/** 背景色 */
- (UIColor *)csNavigationBackgroundColor:(CSNavigationBar *)navigationBar;
/** 是否显示底部黑线 */
- (BOOL)csNavigationIsHideBottomLine:(CSNavigationBar *)navigationBar;
/** 导航条的高度 */
- (CGFloat)csNavigationHeight:(CSNavigationBar *)navigationBar;


/** 导航条的左边的 view */
- (UIView *)csNavigationBarLeftView:(CSNavigationBar *)navigationBar;
/** 导航条右边的 view */
- (UIView *)csNavigationBarRightView:(CSNavigationBar *)navigationBar;
/** 导航条中间的 View */
- (UIView *)csNavigationBarTitleView:(CSNavigationBar *)navigationBar;
/** 导航条左边的按钮 */
- (UIImage *)csNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(CSNavigationBar *)navigationBar;
/** 导航条右边的按钮 */
- (UIImage *)csNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(CSNavigationBar *)navigationBar;

@end


@protocol CSNavigationBarDelegate <NSObject>

@optional
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(CSNavigationBar *)navigationBar;
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(CSNavigationBar *)navigationBar;
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(CSNavigationBar *)navigationBar;

@end

@interface CSNavigationBar : UIView

/** 底部的黑线 */
@property (weak, nonatomic) UIView *bottomBlackLineView;

/**  */
@property (weak, nonatomic) UIView *titleView;

/**  */
@property (weak, nonatomic) UIView *leftView;

/**  */
@property (weak, nonatomic) UIView *rightView;

/**  */
@property (nonatomic, copy) NSMutableAttributedString *title;

/**  */
@property (weak, nonatomic) id<CSNavigationBarDataSource> dataSource;

/**  */
@property (weak, nonatomic) id<CSNavigationBarDelegate> csDelegate;

/**  */
@property (weak, nonatomic) UIImage *backgroundImage;

@end

NS_ASSUME_NONNULL_END
