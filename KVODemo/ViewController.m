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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *aSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@property (nonatomic, strong) LabColor *labColor;
@property (nonatomic, strong) id colorObserveToken;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.labColor = [[LabColor alloc] init];
    
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
}

- (IBAction)updateAComponent:(UISlider *)sender {
    self.labColor.aComponent = sender.value;
}


- (IBAction)updateBComponent:(UISlider *)sender {
    self.labColor.bComponent = sender.value;
}

- (void)colorDidChange:(NSDictionary *)change{
    self.colorView.backgroundColor = self.labColor.color;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
