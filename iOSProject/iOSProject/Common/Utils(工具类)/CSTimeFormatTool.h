//
//  CSTimeFormatTool.h
//  iOSProject
//
//  Created by changcai on 2018/12/10.
//  Copyright © 2018 changcai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSTimeFormatTool : NSObject

/**
 时间格式转换@"yyyyMMddHHmmss"
 时区 zzz --> +08:00
 时区 zz --> +08
 */

+ (NSDate *)coverToDateWith:(NSString *)timeString format:(NSString *)formatString;


+ (NSString *)coverToDateWithDate:(NSDate *)timeDate format:(NSString *)formatString;

/**
 把一种格式的字符串转换为另一种格式
 
 @param formatSting 需要转化结果的格式字符串
 @param timeSting 需要格式化的字符串
 @param oldFormatSting 需要格式化的字符串格式
 @return 格式化的字符串
 */
+ (NSString *)coverToTimeFormatStringWithFormatingSting:(NSString *)formatSting WithTimeSting:(NSString *)timeSting andCurrerntFormat:(NSString *)oldFormatSting;

@end

NS_ASSUME_NONNULL_END
