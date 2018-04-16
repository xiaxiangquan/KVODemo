//
//  KVCTest.m
//  KVODemo
//
//  Created by xxq on 2018/4/11.
//  Copyright © 2018年 xiaxiangquan. All rights reserved.
//

#import "KVCTest.h"

@interface KVCTest ()
/*
{
    @private
    NSString *name;
    NSString *_name;
    NSString *_isName;
    NSString *isName;
}
@property (nonatomic, copy) NSString *name;
 */


/*
 GET
 */
@property (nonatomic, readwrite, assign) NSUInteger count;
@property (nonatomic, copy) NSString* arrName;


@end

@implementation KVCTest

// 系统默认返回 YES
/*
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}


- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"出现异常，该key不存在%@",key);
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"出现异常，该key不存在%@",key);
}
 

- (void)setName:(NSString *)name {

}*/




- (NSString *)name {
    return @"eeee";
}




/*
 GET
 */
- (void)incrementCount {
    self.count++;
}

- (NSInteger)countOfNumber {
    return self.count;
}

- (id)objectInNumberAtIndex:(NSInteger)index {
    return @(index*2);
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
















