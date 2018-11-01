//
//  CSWebViewController.h
//  iOSProject
//
//  Created by changcai on 2018/9/29.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "CSBaseViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CSWebViewController;

@protocol CSWebViewControllerDataSource <NSObject>

@optional
// 默认需要, 是否需要进度条
- (BOOL)webViewController:(CSWebViewController *)webViewController webViewIsNeedProgressIndicator:(WKWebView *)webView;

// 默认需要自动改变标题
- (BOOL)webViewController:(CSWebViewController *)webViewController webViewIsNeedAutoTitle:(WKWebView *)webView;

@end

@protocol CSWebViewControllerDelegate <NSObject>

@optional
// 左上边的返回按钮点击
- (void)backBtnClick:(UIButton *)backBtn webView:(WKWebView *)webView ;

//左上边的关闭按钮的点击
- (void)closeBtnClick:(UIButton *)closeBtn webView:(WKWebView *)webView;

// 监听 self.webView.scrollView 的 contentSize 属性改变，从而对底部添加的自定义 View 进行位置调整
- (void)webView:(WKWebView *)webView scrollView:(UIScrollView *)scrollView contentSize:(CGSize)contentSize;

@end


@interface CSWebViewController : CSBaseViewController

@property (nonatomic, strong) WKWebView *webView;
/**  **/
@property (nonatomic, copy) NSString *gotoURL;
/**  **/
@property (nonatomic, copy) NSString *contentHTML;


@end

NS_ASSUME_NONNULL_END
