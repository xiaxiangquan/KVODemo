//
//  KVOTest.m
//  KVODemo
//
//  Created by xxq on 2018/4/10.
//  Copyright © 2018年 xiaxiangquan. All rights reserved.
//

#import "KVOTest.h"

@implementation KVOTest


/*
 多个属性间改变 相互影响依赖
 观察当前监听的属性 是否有影响依赖key，当依赖key的属性 发生变化时，观察的属性 也会发生改变，即使没有对它进行操作；
 */
+ (NSSet <NSString *>*)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    // 调用 父类的方法  避免干扰父类的实现
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"test"]) {
        NSArray *affectKey = @[@"test1",@"test2"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectKey];
    }
    return keyPaths;
}


/*
 手动控制监听某些属性
 */
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
//    if ([key isEqualToString:@"test1"]) {
//        return [super automaticallyNotifiesObserversForKey:key];
//    }
//    return NO;
//}


@end
