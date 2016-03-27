//
//  ViewController.m
//  CircleLayersDemo
//
//  Created by xidanjueying on 16/3/23.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float size = 50;
    float repeatCount = 10;
    
    UIView *containerView = [UIView new];
    containerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 300);
    containerView.center = CGPointMake(self.view.center.x, self.view.center.y - size * 2);
    [self.view addSubview:containerView];
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, size * 2, 0);
    transform = CATransform3DRotate(transform, M_PI * 2 / repeatCount, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -size * 2, 0);
    
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.frame = containerView.bounds;
    repLayer.instanceCount = repeatCount;
    repLayer.instanceTransform = transform;
    repLayer.instanceBlueOffset = -0.1; // 为每个实例应用颜色转换
    repLayer.instanceGreenOffset = -0.1; // 同上
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, size, size);
    layer.position = repLayer.position;
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [repLayer addSublayer:layer];
    [containerView.layer addSublayer:repLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
