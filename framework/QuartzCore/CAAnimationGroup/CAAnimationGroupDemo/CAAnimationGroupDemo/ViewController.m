//
//  ViewController.m
//  CAAnimationGroupDemo
//
//  Created by xidanjueying on 16/4/6.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBezierPath *bezierPath = [UIBezierPath new];
    [bezierPath moveToPoint:CGPointMake(20, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    // 画轨道
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.view.frame;
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3;
    [self.view.layer addSublayer:pathLayer];
    
    // 画滑块
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(20, 0, 20, 20);
    shipLayer.position = CGPointMake(20, 150);
    shipLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:shipLayer];
    
    // 给滑块添加动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto; // 让滑块根据曲线的切线自动旋转
    
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor blueColor].CGColor;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animation, animation2];
    animationGroup.duration = 4;
    animationGroup.repeatCount = HUGE_VALF;
    
    [shipLayer addAnimation:animationGroup forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
