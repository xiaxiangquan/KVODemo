//
//  KeyValueObserver.h
//  KVODemo
//
//  Created by xiaxiangquan on 15/2/28.
//  Copyright (c) 2015年 xiaxiangquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyValueObserver : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic) SEL selector;


+ (NSObject *)observeObject:(id)object keyPath:(NSString *)keyPath target:(id)target selector:(SEL)selector __attribute__((warn_unused_result));

+ (NSObject *)observeObject:(id)object keyPath:(NSString *)keyPath target:(id)target selector:(SEL)selector obtions:(NSKeyValueObservingOptions)options __attribute__((warn_unused_result));


@end
