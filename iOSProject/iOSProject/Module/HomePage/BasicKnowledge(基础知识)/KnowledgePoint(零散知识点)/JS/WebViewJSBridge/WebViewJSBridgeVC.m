//
//  WebViewJavascriptBridgeVC.m
//  BigShow1949
//
//  Created by apple on 17/7/28.
//  Copyright © 2017年 BigShowCompany. All rights reserved.
//

#import "WebViewJSBridgeVC.h"
#import "WebViewJavascriptBridge.h"
#import "EXTScope.h"
#import "SDWebImageManager.h"

static NSString  * const onLoadedMethodJSName = @"onLoaded";
static NSString  * const browImageMethodJSName = @"browImage";
static NSString  * const imageDownLoadCompletedJSName = @"imageDownLoadCompleted";


@interface WebViewJSBridgeVC ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WebViewJavascriptBridge *bridge;
@property (nonatomic, strong) NSMutableArray *imageFilePaths;
@end

/* ============  调用第三方 WebViewJavascriptBridge    ==========*/
@implementation WebViewJSBridgeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"JSBridgeVC";
    
    NSString *htmlFilePath = [[NSBundle mainBundle]pathForResource:@"content1" ofType:@"html"];
    NSString *htmlContentString = [NSString stringWithContentsOfFile:htmlFilePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlContentString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    [self.view addSubview:self.webView];
    [self registerNativeHandler];
}

-(void)dealloc{
    NSLog(@"jsbridge");
}

- (UIWebView *)webView{
    
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT - 64)];
        _webView.layer.borderColor = [UIColor redColor].CGColor;
        _webView.layer.borderWidth = 1;
    }
    return _webView;
}

- (WebViewJavascriptBridge *)bridge{
    if (!_bridge) {
        // 开启日志
        [WebViewJavascriptBridge enableLogging];
        // 加上下面这行代码, 编译就报错
        _bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
        [_bridge setWebViewDelegate:self];
        
    }
    return _bridge;
}


/**
 注册Native方法，响应JS调用
 */

- (void)registerNativeHandler{
    
    //页面加载
    @kWeakify(self);
    
    [self.bridge registerHandler:onLoadedMethodJSName handler:^(NSArray *imageInfos, WVJBResponseCallback responseCallback) {
        //js传过来的数据
        NSLog(@"imageInfos =  %@", imageInfos);
        @kStrongify(self);
        [self downloadImagesWithInfos:imageInfos];
    }];
    
    //点击图片
    [self.bridge registerHandler:browImageMethodJSName handler:^(NSArray *dataArray, WVJBResponseCallback responseCallback) {
//        @strongify(self);
        NSLog(@"dataArray =  %@", dataArray);
//        NSInteger index = [dataArray[0] integerValue];
//        XLPhotoBrowser *imageBrowser = [XLPhotoBrowser showPhotoBrowserWithCurrentImageIndex:index imageCount:[self.imageFilePaths count] datasource:self];
//        imageBrowser.browserStyle = XLPhotoBrowserStyleSimple;
    }];
}


/**
 在本地下载多张图片，图片下载成功通知js处理
 */

- (void)downloadImagesWithInfos:(NSArray *)imageInfos{
    
    [imageInfos enumerateObjectsUsingBlock:^(NSArray *info, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *imageCachePath = [[SDImageCache sharedImageCache] defaultCachePathForKey:info[1]];
        [self.imageFilePaths addObject:imageCachePath];
    }];
    
    for (int i = 0; i < [imageInfos count]; i++) {
        
        NSArray *imageInfo = [imageInfos objectAtIndex:i];
        NSUInteger imageIndex = [imageInfo[0] integerValue];
        [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:imageInfo[1]] options:SDWebImageRetryFailed progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            if (!image) {
                return;
            }
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                NSString *imageCachePath = [[SDImageCache sharedImageCache] defaultCachePathForKey:[imageURL absoluteString]];
                //通知js的imagesDownloadComplete方法处理
                [self.bridge callHandler:imageDownLoadCompletedJSName data:@[[NSNumber numberWithInteger:imageIndex],imageCachePath] responseCallback:nil];
            });
        }];
    }
}


@end
