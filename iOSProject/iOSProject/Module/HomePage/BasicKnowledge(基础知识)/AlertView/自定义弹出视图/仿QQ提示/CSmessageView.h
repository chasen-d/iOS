//
//  CSmessageView.h
//  iOSProject
//
//  Created by changcai on 2018/9/30.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSMessageView : NSObject

+ (void)showMessage:(NSString *)message;

+ (void)showStatusBarMessage:(NSString *)message;

+ (void)showMessageHub:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
