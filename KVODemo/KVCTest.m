//
//  KVCTest.m
//  KVODemo
//
//  Created by xxq on 2018/4/11.
//  Copyright © 2018年 xiaxiangquan. All rights reserved.
//

#import "KVCTest.h"
#import <UIKit/UIKit.h>

@interface KVCTest ()
/* SET */
{
    @private
    NSString *name;
    NSString *_name;
    NSString *_isName;
    NSString *isName;
    
    CGFloat num;
    
    NSInteger _test;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGFloat num;



/*
 GET
 */
@property (nonatomic, readwrite, assign) NSUInteger count;
@property (nonatomic, copy) NSString* arrName;
//@property (nonatomic, assign) NSInteger test;

@end

@implementation KVCTest

// 系统默认返回 YES
/* */
+ (BOOL)accessInstanceVariablesDirectly {
    return NO;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"出现异常，该key不存在%@",key);
}
 

//- (void)setName:(NSString *)name {
//
//}


- (NSString *)name {
    return @"eeee";
}


// 基本数据类型（int、float、double）如果value 设置为nil时，会报异常，可以重写这个方法 来处理nil的异常状况避免crash
-(void)setNilValueForKey:(NSString *)key {
    NSLog(@" setNilValueForKey = %@",key);
}




/*
 GET 搜索模式
  */
#pragma mark - 第一步
// 第一
- (NSInteger)getTest {
    return 1;
}
 // 第二
- (NSInteger)test {
    return 3;
}

 // 第三
- (NSInteger)isTest {
    return 5;
}

// 第四
- (NSInteger)_getTest {
    return 2;
}

// 第五
- (NSInteger)_test {
    return 4;
}

// 上述成员变量函数没写时，会走下面方法
#pragma mark - 第二步
- (NSInteger)countOfTest {
    return 1;
}
- (id)objectInTestAtIndex:(NSInteger)index {
    return @(2*index);
}
- (id)testAtIndexes:(NSInteger)index {
    return @(2*index);
}

#pragma mark - 第三步
/*
- (NSInteger)countOfTest {
    return 1;
}
 */

- (NSInteger)enumeratorOfTest {
    return 1;
}

#pragma mark - 上述方式都没找到 则抛出异常
- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"出现异常，该key不存在%@",key);
    return nil;
}



//// 第一
- (NSInteger)getNum {
    return 1;
}
// // 第二
//- (NSInteger)num {
//    return 3;
//}
// 
// // 第三
//- (NSInteger)isNum {
//    return 5;
//}
// 
//// 第四
//- (NSInteger)_getNum {
//    return 2;
//}
//
//// 第五
//- (NSInteger)_num {
//    return 4;
//}
//




@end
















