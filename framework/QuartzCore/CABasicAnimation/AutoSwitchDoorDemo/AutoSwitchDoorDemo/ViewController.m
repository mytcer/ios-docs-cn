//
//  ViewController.m
//  AutoSwitchDoorDemo
//
//  Created by xidanjueying on 16/4/11.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *doorLayer = [CALayer layer];
    doorLayer.frame = CGRectMake(0, 0, 127, 170);
    doorLayer.position = self.view.center;
    doorLayer.contents = (__bridge id)[UIImage imageNamed:@"door.jpg"].CGImage;
    [self.view.layer addSublayer:doorLayer];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500;
    self.view.layer.sublayerTransform = transform;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI);
    animation.duration = 2.5;
    animation.repeatCount = INFINITY;
    // 开启自动回放，可以在开门动画结束后自动动画关门（开门动画的逆向操作）
    // 注意：如果没有开启该特性，则开门动画结束后，会出现一次UI闪烁，然后回到动画起点（即关门的状态）
    animation.autoreverses = YES;
    [doorLayer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
