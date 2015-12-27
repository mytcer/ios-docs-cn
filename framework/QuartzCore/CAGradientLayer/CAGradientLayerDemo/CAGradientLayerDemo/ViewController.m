//
//  ViewController.m
//  CAGradientLayerDemo
//
//  Created by xidanjueying on 15/12/27.
//  Copyright © 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100);
    // 设置渐变色，每个颜色成员必须是CGColorRef类型，但NSArray的成员又必须是NSObject类型，
    // 所以这里通过bridge转换以确保编译正常
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor orangeColor].CGColor,
                             (__bridge id)[UIColor yellowColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor,
                             (__bridge id)[UIColor blueColor].CGColor,
                             (__bridge id)[UIColor purpleColor].CGColor];
    // 设置每个颜色的位置，0.0表示渐变开始，1.0表示结束
    gradientLayer.locations = @[@0.0, @0.15, @0.3, @0.45, @0.6, @0.75];
    // 通过设置渐变的起点和终点来决定渐变的方向
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    [self.view.layer addSublayer:gradientLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
