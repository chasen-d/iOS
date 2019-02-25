//
//  NSObject+JDPropertyCode.m
//  WJDStudyLibrary
//
//  Created by wangjundong on 2017/5/27.
//  Copyright © 2017年 wangjundong. All rights reserved.
//

#import "NSObject+JDPropertyCode.h"

@implementation NSObject (JDPropertyCode)

// 自动生成属性声明的代码
+ (void)printPropertyWithDict:(NSDictionary *)dict {
    NSMutableString *allPropertyCode = [[NSMutableString alloc]init];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *str = [[NSString alloc]init];
        if ([NSStringFromClass([obj class]) containsString:@"String"]) {
            str = [NSString stringWithFormat:@"/**  */\n@property (nonatomic, copy) NSString *%@;",key];
        }
        if ([NSStringFromClass([obj class]) containsString:@"Number"]) {
            str = [NSString stringWithFormat:@"@/**  */\nproperty (nonatomic, assign) int %@;",key];
        }
        if ([NSStringFromClass([obj class]) containsString:@"Array"]) {
            str = [NSString stringWithFormat:@"/**  */\n@property (nonatomic, copy) NSArray *%@;",key];
        }
        if ([NSStringFromClass([obj class]) containsString:@"Dictionary"]) {
            __block NSString * string = @"";
            NSMutableString *nStr = [[NSMutableString alloc]init];
            NSDictionary * dict = (NSDictionary *)obj;
            [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                if ([NSStringFromClass([obj class]) containsString:@"String"]) {
                    string = [NSString stringWithFormat:@"/**  */\n@property (nonatomic, copy) NSString *%@;",key];
                }
                [nStr appendFormat:@"\n%@\n",string];
            }];
            NSLog(@"%@",nStr);
        }
        if ([NSStringFromClass([obj class]) containsString:@"Boolean"]) {
            str = [NSString stringWithFormat:@"/**  */\n@property (nonatomic, assign) BOOL %@;",key];
        }
        [allPropertyCode appendFormat:@"\n%@\n",str];
    }];
    NSLog(@"%@",allPropertyCode);
}


@end
