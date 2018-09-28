//
//  Definition.h
//  NewCar
//
//  Created by zhoujian on 15/4/25.
//  Copyright (c) 2015年 YiLee. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#ifndef CC_Definition_h
#define CC_Definition_h

// 1.判断是否为iOS7
#define iOS7   ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8   ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define iOS11  ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 11.0)

// 2.获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)

#define navigationBarColor RGB(33, 192, 174)
#define separaterColor RGB(200, 199, 204)


#define kStatusBarHeight         20
#define kNavigationBarHeight     64
#define kTabBarHeight            49

// 3.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

// 4.屏幕大小尺寸
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//获取屏幕宽度与高度
//#define kScreenWidth \
//([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreenmainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
//#define kScreenHeight \
//([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreenmainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
//#define kScreenSize \
//([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreenmainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreenmainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)


//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//重新设定view的Y值
#define setFrameY(view, newY) view.frame = CGRectMake(view.frame.origin.x, newY, view.frame.size.width, view.frame.size.height)
#define setFrameX(view, newX) view.frame = CGRectMake(newX, view.frame.origin.y, view.frame.size.width, view.frame.size.height)
#define setFrameH(view, newH) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, newH)


//取view的坐标及长宽
#define W(view)    view.frame.size.width
#define H(view)    view.frame.size.height
#define X(view)    view.frame.origin.x
#define Y(view)    view.frame.origin.y

//5.常用对象
#define APPDELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

//6.经纬度
#define LATITUDE_DEFAULT 39.983497
#define LONGITUDE_DEFAULT 116.318042

//7.
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//8
#define Global_BlueColor @"408AFF"
#define Global_GrayColor @"#CCCCCC"
#define Global_LineColor @"F5F5F5"
#define Global_CellLineGrayColor @"#D2D2DA"
#define Global_CellLineColor @"#D2D2DA"
#define Global_BlueColor @"408AFF"
#define Global_LabelColor @"#26272A"
#define Global_NormalLabelColor @"#757A81"
#define Global_BackgroundColor @"#F9FAFB"
//9
#define NavigationBar_Title_FontSize 19
#define NavigationBar_ItemTitle_FontSize 17
#define NetworkErrorViewTag 20161115//网络无法连接tag

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


//详情描述
#define NewsListPageSize 10
#define NETWORK_LOADING @"加载中..."
#define Error_Network_unConnection @"网络连接不可用"
#define Error_Network_Unusual @"网络异常，请稍后重试"
#define CCERROR_NETWORK_BUSYNESS @"网络繁忙，请稍后重试"
#define CCERROR_SERVICER_BUSYNESS @"服务器繁忙，请稍后重试"
#define CCERROR_UNKNOWN @"未知错误"
#define VERSION_UPDATING @"正在检查更新"
#define UPDATING_ALERTINFO @"当前已是最新版本"
#define NETWORK_ERROR_NORMAL @"似乎已经断开了与互联网的连接"
#define NETWORK_REQUEST_NORMAL @"抱歉，该栏目暂时无资讯"
#define CCSYSTEM_UPGRADE_ERROR @"系统升级，请稍后再访问...";
#define DAILY_NEWSLIST_MARK @"时间标签"
#define NETWORK_ERROR_ECCEPTION @"网络异常，请稍后重试"



//版本
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

//字体
#define CSDEFAULT_FONT(f) [UIFont systemFontOfSize:f]//系统字体
//iPhone 字体适配
#define FontSize(FONT) [UIFont systemFontOfSize:((FONT)*screen_width/375)]


#ifdef International
#define CCNormalFontSize(nFontSize)  [UIFont systemFontOfSize:nFontSize]
#define CCBoldFontSize(nFontSize) [UIFont boldSystemFontOfSize:nFontSize]
#define CCDefNoramlFontName @"Helvetica"
#else
#define CCNormalFontSize(nFontSize)  IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")?[UIFont fontWithName:@"STHeitiSC-Light" size:nFontSize]:[UIFont systemFontOfSize:nFontSize]
#define CCBoldFontSize(nFontSize) IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")?[UIFont fontWithName:@"STHeitiSC-Medium" size:nFontSize]:[UIFont boldSystemFontOfSize:nFontSize]
#define CCDefNoramlFontName @"STHeitiSC-Light"
#endif


#define CCLightFontSize(nFontSize)  [CCBaseTools  lightFontSize:nFontSize]
#define CCMediumFontSize(nFontSize) [CCBaseTools mediumFontSize:nFontSize]
#define CCSemiboldFontSize(nFontSize) [CCBaseTools semiboldFontSize:nFontSize]
#define CCRegularFontSize(nFontSize) [CCBaseTools regularFontSize:nFontSize]

#define IsEqualToString(str1,str2) [[NSString stringWithFormat:@"%@",str1] isEqualToString:[NSString stringWithFormat:@"%@",str2]]

#define IsEqualToEmptyString(str)  (str == nil)?@"":str

#define IsEqualToEmptyImage(image)  (image == nil)?[NSNull null]:image

#define safeString(obj) (([obj isEqual:[NSNull null]] || (obj == nil) || [@"null" isEqual:obj] || [@"<null>" isEqual:obj] || [@"(null)" isEqual:obj]) ? @"" : ([NSString stringWithFormat:@"%@",obj]))

#define isEmptyString(obj) (([obj isEqual:[NSNull null]] || obj==nil || [@"null" isEqual:obj] || [@"<null>" isEqual:obj] || [@"" isEqual:obj]) ? 1 : 0)

//是否是空对象
#define CSIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//适配
#define CalculateLayoutHorizontalMargin(margin) [CalculateLayout neu_layoutForAlliPhoneWidth:margin]
#define CalculateLayoutVerticalMargin(margin) [CalculateLayout neu_layoutForAlliPhoneHeight:margin]

/**
 *  上传/下载进度
 */
typedef void (^AFLoadingProgressBlock)(NSProgress * _Nonnull loadingProgress);

/**
 *  请求成功回调
 *
 *  @param responseObject 回调block
 */
typedef void (^AFRequestSuccessBlock)(BOOL isSuccess ,id  _Nonnull  responseObject);
/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^AFRequestFailureBlock)(BOOL isSuccess, NSString *  _Nonnull msg, NSError *  _Nonnull error);




//-----------------------循环引用-------------

#define WeakSelf(type)  __weak typeof(type) weak##type = type; // weak
#define StrongSelf(type)  __strong typeof(type) type = weak##type; // strong

//-----------------------NSUserDefaults实例化的宏定义-------------
#define UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

#define UserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]

#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

//-----------------------沙盒路径的宏定义-------------------

//Caches
#define NSCachesDirectoryPath(customPath) [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]  stringByAppendingPathComponent:customPath]
//Document
#define NSDocumentDirectoryPath(customPath) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]  stringByAppendingPathComponent:customPath]
//Temp
#define NSTemporaryDirectoryPath  NSString *tmpDir = NSTemporaryDirectory();


//---------------------- ABOUT IMAGE图片 的宏定义----------------------------
//LOAD LOCAL IMAGE FILE读取本地图片

#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
//DEFINE IMAGE定义UIImage对象//    imgView.image = IMAGE(@"Default.png");

#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//DEFINE IMAGE定义UIImage对象

#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]

//BETTER USER THE FIRST TWO WAY, IT PERFORM WELL.优先使用前两种宏定义,性能高于后面

//------------------------快速查询一段代码的执行时间的宏定义------------------------
#define TICK NSDate *startTime = [NSDate date];
#define TOCK NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);


//------------GCD-----------
//GCD代码只执行一次
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//在主线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlock);

#define dispatch_main_async_safe(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }

//------ FORMAT ------
#define FORMAT(f, ...) [NSString stringWithFormat:f, ## __VA_ARGS__];

//--------通知-----
#define NOTIF_ADD(n, f)     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(f) name:n object:nil]
#define NOTIF_POST(n, o)    [[NSNotificationCenter defaultCenter] postNotificationName:n object:o]
#define NOTIF_REMV()        [[NSNotificationCenter defaultCenter] removeObserver:self]


typedef NS_ENUM(NSInteger,RequestFailedStatus)
{
    RequestFailedStatus_NetworkError = 0,//网络异常
    RequestFailedStatus_ServerError = 1,//服务器异常
};


typedef NS_ENUM(NSInteger,DataLoadingStatus)
{
    DataLoadingStatusDefault = 0,
    DataLoadingStatusEmpty,//当前无数据
    DataLoadingStatusFailed,//刷新失败
    DataLoadingStatusNoMoreData//没有更多数据
};

typedef NS_ENUM(NSInteger,DataLoadingType)
{
    DataLoadingTypeVacant = 0,//空闲
    DataLoadingTypePullDown,//下拉
    DataLoadingTypePullUp//上拉
};


#ifndef iPhone4
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size): NO)
#endif

//是否为iPhone5系列机型
#ifndef iPhone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

//是否为iPhone6，6s,7
#ifndef iPhone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

//是否为iPhone6P，7P
#ifndef iPhone6P
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)


#pragma mark - UIColor宏定义
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)


#define dispatch_sync_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_async_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}


#define NTES_USE_CLEAR_BAR - (BOOL)useClearBar{return YES;}

#define NTES_FORBID_INTERACTIVE_POP - (BOOL)forbidInteractivePop{return YES;}



#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#define UISreenWidthScale   screen_width / 320

#endif
