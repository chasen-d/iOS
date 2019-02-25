//
//  NSObject+KVO.h
//  iOSProject
//
//  Created by changcai on 2018/11/26.
//  Copyright © 2018 changcai. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^CSObservingBlock)(id observedObject, NSString *observedKey, id oldValue, id newValue);

@interface NSObject (KVO)

- (void) CS_addObserver:(NSObject *)observer
                 forKey:(NSString *)key
              withBlock:(CSObservingBlock)block;

- (void) CS_removeObserver:(NSObject *)observer forKey:(NSString *)key;

@end
