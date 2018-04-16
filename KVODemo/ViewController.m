//
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
     
    KVCTest *kvc = [[KVCTest alloc] init];
    [kvc setValue:@"www" forKey:@"name"];
//    NSLog(@"%@",[kvc valueForKey:@"name"]);
    */
     /*
      GET
    */
    
    KVCTest* arr = [KVCTest new];
    id num = [arr valueForKey:@"num"];
    NSLog(@"%@",num);
    UILabel *ar = [arr valueForKey:@"number"];
    NSLog(@"%@",NSStringFromClass([ar class]));
    NSLog(@"0:%@ ",ar );

//    NSLog(@"0:%@     1:%@     2:%@     3:%@",ar[0],ar[1],ar[2],ar[3]);
//    [arr incrementCount];                                                                            //count加1
//    NSLog(@"%lu",(unsigned long)[ar count]);                                                         //打印出1
//    [arr incrementCount];                                                                            //count再加1
//    NSLog(@"%lu",(unsigned long)[ar count]);                                                         //打印出2
//    
//    [arr setValue:@"newName" forKey:@"arrName"];
//    NSString* name = [arr valueForKey:@"arrName"];
//    NSLog(@"%@",name);
   
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
