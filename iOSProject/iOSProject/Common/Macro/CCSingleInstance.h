//
//  CCSingleInstance.h
//  Changcai_iOS
//
//  Created by changcai on 17/7/18.
//  Copyright © 2017年 com.changcai.cn. All rights reserved.
//

#ifndef CCSingleInstance_h
#define CCSingleInstance_h

#define CCSINGLEINSTANCE_H(name) +(instancetype)shared##name;
//条件满足 ARC
#if __has_feature(objc_arc)
#define CCSINGLEINSTANCE_M(name) static id _singleManager = nil;\
+ (instancetype)shared##name{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_singleManager = [[self alloc] init];\
});\
return _singleManager;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_singleManager = [super allocWithZone:zone];\
});\
return _singleManager;\
}\
\
- (id)mutableCopy{\
return _singleManager;\
}\
\
- (id)copy{\
return _singleManager;\
}
#else
//条件满足 MRC
#define CCSINGLEINSTANCE_M(name) static id _singleManager = nil;\
+ (instancetype)share##name{\
return [[self alloc]init];\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_singleManager = [super allocWithZone:zone];\
});\
return _singleManager;\
}\
\
- (id)mutableCopy{\
return _singleManager;\
}\
\
- (id)copy{\
return _singleManager;\
}\
- (oneway void)release{\
}\
\
- (instancetype)retain{\
return _singleManager;\
}\
\
- (NSUInteger)retainCount{\
  return MAXFLOAT;\
}\
#endif
#endif
#endif /* CCSingleInstance_h */
