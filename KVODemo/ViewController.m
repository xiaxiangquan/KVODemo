///
//  ViewController.m
//  KVODemo
//
//  Created by xiaxiangquan on 15/2/28.
//  Copyright (c) 2015年 xiaxiangquan. All rights reserved.
//

#import "ViewController.h"
#import "LabColor.h"
#import "KeyValueObserver.h"
#import <objc/runtime.h>
#import "KVOTest.h"
#import "KVCTest.h"
#import "KVCCollectionOperatorsTest.h"

@interface ViewController ()
{
    KVOTest *_test;
}

@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *aSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@property (nonatomic, strong) LabColor *labColor;
@property (nonatomic, strong) id colorObserveToken;

@property (nonatomic, strong) KVOTest *test;
@property (nonatomic, strong) KVCTest *kvcTest;

@end



@implementation ViewController

// 编译器不会自动生成 getter setter方法
@dynamic test;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    Class class = object_getClass(self.labColor);
    NSLog(@"%@", [class superclass]);
    NSLog(@"%@",  class);
    NSLog(@"%@, %@", self.class,  [class superclass]);
    
    self.labColor = [[LabColor alloc] init];
    
    
    self.test = [[KVOTest alloc] init];
    
    [self.test addObserver:self forKeyPath:@"test" options:NSKeyValueObservingOptionInitial context:nil];
    [self.test addObserver:self forKeyPath:@"test1" options:NSKeyValueObservingOptionInitial context:nil];
    [self.test addObserver:self forKeyPath:@"test2" options:NSKeyValueObservingOptionInitial context:nil];
    
    
    /*
     KVC
     SET
     */
    KVCTest *kvc = [[KVCTest alloc] init];
    [kvc setValue:nil forKey:@"name"];
    [kvc setValue:nil forKey:@"num"];

//    NSLog(@"%@",[kvc valueForKey:@"name"]);
    
     /*
      GET
    */
    
    self.kvcTest = [KVCTest new];
    id num = [self.kvcTest valueForKey:@"num"];
    NSLog(@"num = %@",num);
    id ar = [self.kvcTest valueForKey:@"test"];
    NSLog(@"%@",NSStringFromClass([ar class]));
//    NSLog(@" --- %@ ",ar );
//
//    NSLog(@"0:%@     1:%@     2:%@     3:%@",ar[0],ar[1]);
//    [arr incrementCount];                                                                            //count加1
//    NSLog(@"%lu",(unsigned long)[ar count]);                                                         //打印出1
//    [arr incrementCount];                                                                            //count再加1
//    NSLog(@"%lu",(unsigned long)[ar count]);                                                         //打印出2
//
//    [arr setValue:@"newName" forKey:@"arrName"];
//    NSString* name = [arr valueForKey:@"arrName"];
//    NSLog(@"%@",name);
   
    
    // kvc 集合操作（基本数据类型）
    KVCCollectionOperatorsTest *collectionTest = [[KVCCollectionOperatorsTest alloc] init];
    collectionTest.name = @"aaa";
    collectionTest.count = 10;
    
    KVCCollectionOperatorsTest *collectionTest2 = [[KVCCollectionOperatorsTest alloc] init];
    collectionTest2.name = @"bbb";
    collectionTest2.count = 20;
    
    KVCCollectionOperatorsTest *collectionTest3 = [[KVCCollectionOperatorsTest alloc] init];
    collectionTest3.name = @"aaa";
    collectionTest3.count = 30;

    NSArray *collectionArr = @[collectionTest, collectionTest2, collectionTest3];
    NSNumber *countNum = [collectionArr valueForKeyPath:@"@count"];
    NSNumber *avgNum = [collectionArr valueForKeyPath:@"@avg.count"];
    NSNumber *maxNum = [collectionArr valueForKeyPath:@"@max.count"];
    NSNumber *minNum = [collectionArr valueForKeyPath:@"@min.count"];
    NSNumber *sunNum = [collectionArr valueForKeyPath:@"@sum.count"];

    // 若操作对象(数组/集合)内的元素本身就是 NSNumber 对象,那么可以这样写.
    NSArray *collectionArr2 = @[@(collectionTest.count), @(collectionTest2.count), @(collectionTest3.count)];
    NSNumber *countNum2 = [collectionArr2 valueForKeyPath:@"@count"];
    NSNumber *avgNum2 = [collectionArr2 valueForKeyPath:@"@avg.self"];
    NSNumber *maxNum2 = [collectionArr2 valueForKeyPath:@"@max.self"];
    NSNumber *minNum2 = [collectionArr2 valueForKeyPath:@"@min.self"];
    NSNumber *sunNum2 = [collectionArr2 valueForKeyPath:@"@sum.self"];

    NSLog(@" -- %@",countNum);
    NSLog(@" -- %@",avgNum);
    NSLog(@" -- %@",maxNum);
    NSLog(@" -- %@",minNum);
    NSLog(@" -- %@",sunNum);
    
    NSLog(@" ++ %@",countNum2);
    NSLog(@" ++ %@",avgNum2);
    NSLog(@" ++ %@",maxNum2);
    NSLog(@" ++ %@",minNum2);
    NSLog(@" ++ %@",sunNum2);
    
    
    /*
     对象集合操作
     * @unionOfObjects:
     * @distinctUnionOfObjects:
     */
    NSArray *unionOfObjects = [collectionArr valueForKeyPath:@"@unionOfObjects.name"];
    NSArray *distinctUnionOfObjects = [collectionArr valueForKeyPath:@"@distinctUnionOfObjects.name"];
    NSLog(@"unionOfObjects = %@",unionOfObjects);
    NSLog(@"distinctUnionOfObjects = %@",distinctUnionOfObjects);

    
    /*
     数组和集合操作符
     * @distinctUnionOfArrays:
     * @unionOfArrays:
     * @distinctUnionOfSets:
     */
    KVCCollectionOperatorsTest *arrAndSetTest = [[KVCCollectionOperatorsTest alloc] init];
    arrAndSetTest.name = @"aaa";
    arrAndSetTest.count = 10;
    
    KVCCollectionOperatorsTest *arrAndSetTest2 = [[KVCCollectionOperatorsTest alloc] init];
    arrAndSetTest2.name = @"bbb";
    arrAndSetTest2.count = 20;
    
    KVCCollectionOperatorsTest *arrAndSetTest3 = [[KVCCollectionOperatorsTest alloc] init];
    arrAndSetTest3.name = @"aaa";
    arrAndSetTest3.count = 30;
    
    
    KVCCollectionOperatorsTest *arrAndSetTest4 = [[KVCCollectionOperatorsTest alloc] init];
    arrAndSetTest4.name = @"arrAndSetTest";
    arrAndSetTest4.count = 10;
    
    KVCCollectionOperatorsTest *arrAndSetTest5 = [[KVCCollectionOperatorsTest alloc] init];
    arrAndSetTest5.name = @"arrAndSetTest2";
    arrAndSetTest5.count = 20;
    
    KVCCollectionOperatorsTest *arrAndSetTest6 = [[KVCCollectionOperatorsTest alloc] init];
    arrAndSetTest6.name = @"arrAndSetTest3";
    arrAndSetTest6.count = 30;
    
    NSArray *arrayAndSetCollectionArr = @[arrAndSetTest, arrAndSetTest2, arrAndSetTest3];
    NSArray *arrayAndSetCollectionArr2 = @[arrAndSetTest4, arrAndSetTest5, arrAndSetTest6];

    NSMutableArray *totalCount = [NSMutableArray array];
    [totalCount addObject:arrayAndSetCollectionArr];
    [totalCount addObject:arrayAndSetCollectionArr2];
    
    NSLog(@"--- %@",[totalCount valueForKeyPath:@"@unionOfArrays.name"]);
    NSLog(@"+++ %@",[totalCount valueForKeyPath:@"@distinctUnionOfArrays.name"]);

    
    
    
    /* KVC 应用 改变 获取系统类 成员变量*/
    unsigned int count = 0;
    // 拷贝出所胡的成员变量列表
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i<count; i++) {
        // 取出成员变量
        Ivar ivar = *(ivars + i);
        // 打印成员变量名字
        NSLog(@"%s", ivar_getName(ivar));
        // 打印成员变量的数据类型
//        NSLog(@"%s", ivar_getTypeEncoding(ivar));
    }
    // 释放
    free(ivars);

    // 修改点位文字颜色
    UILabel *placeholderLabel = [self valueForKeyPath:@"_placeholderLabel"];
    placeholderLabel.textColor = [UIColor redColor];
    // 或者这样
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];

}


- (void)setTest:(KVOTest *)test {
    [self willChangeValueForKey:@"test"];
    _test = test;
    [self didChangeValueForKey:@"test"];
}

- (KVOTest *)test {
    return _test;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    KVOTest *test = object;
    NSLog(@"test = %f",test.test);
    NSLog(@"test1 = %f",test.test1);
    NSLog(@"test2 = %f",test.test2);

    NSLog(@" ----- %@  +++++ keypath = %@",change, keyPath);
}


- (void)setLabColor:(LabColor *)labColor{
    _labColor = labColor;
    self.colorObserveToken = [KeyValueObserver observeObject:labColor keyPath:@"color" target:self selector:@selector(colorDidChange:) obtions:NSKeyValueObservingOptionInitial];
    self.lSlider.value = self.labColor.lComponent;
    self.aSlider.value = self.labColor.aComponent;
    self.bSlider.value = self.labColor.bComponent;
}

- (IBAction)updateLComponent:(UISlider *)sender {
    self.labColor.lComponent = sender.value;
    self.test.test = sender.value;
}

- (IBAction)updateAComponent:(UISlider *)sender {
    self.labColor.aComponent = sender.value;
    self.test.test1 = sender.value;
}

- (IBAction)updateBComponent:(UISlider *)sender {
    self.labColor.bComponent = sender.value;
    self.test.test2 = sender.value;
}

- (void)colorDidChange:(NSDictionary *)change{
    self.colorView.backgroundColor = self.labColor.color;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
