//
//  JSViewController.m
//  BigShow1949
//
//  Created by apple on 17/7/28.
//  Copyright © 2017年 BigShowCompany. All rights reserved.
//

#import "JSViewController.h"

@implementation JSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     JS交互的几种方式:
     1.在JS 中做一次URL跳转，然后在OC中拦截跳转。（这里分为UIWebView 和 WKWebView两种，去年因为还要兼容iOS 6，所以没办法只能采用UIWebView来做。）
     2.利用WKWebView 的MessageHandler。
     3.利用系统库JavaScriptCore，来做相互调用。（iOS 7推出的）
     4.利用第三方库WebViewJavascriptBridge。
     5.利用第三方cordova库，以前叫PhoneGap。（这是一个库平台的库）
     6.当下盛行的React Native。
     */
    
    self.dataSoureArray = @[ @{@"title":@"UIWebView拦截URL",@"className":@"JS_UIWebView_URLViewController"},
                             @{@"title":@"WKWebView拦截URL",@"className":@"JS_WKWebView_URLViewController"},
                             @{@"title":@"MessageHandler",@"className":@"JS_MessageHandlerViewController"},
                             @{@"title":@"JavaScriptCore",@"className":@"JS_JavaScriptCoreViewController"},
                             @{@"title":@"JSCore",@"className":@"JSCoreViewController"},
                             @{@"title":@"JSBridge使用",@"className":@"WebViewJSBridgeVC"},//有问题
                             ];
    
    
}




@end
