//
//  ViewController.m
//  RepeatLayerDemo
//
//  Created by xidanjueying on 15/12/24.
//  Copyright © 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self barAnimation];
    [self indicatorAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)barAnimation {
    CAReplicatorLayer *repLayer = [[CAReplicatorLayer alloc] init];
    repLayer.frame = CGRectMake(0, 20, CGRectGetWidth(self.view.frame), 100);
    [self.view.layer addSublayer:repLayer];
    
    // 单条柱形 (原始层)
    CALayer * barLayer = [CALayer layer];
    barLayer.bounds = CGRectMake(0, 0, 8, 40);
    barLayer.position = CGPointMake(10, 70);
    barLayer.backgroundColor = [UIColor redColor].CGColor;
    [repLayer addSublayer:barLayer];
    
    CABasicAnimation * moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation.toValue = @(barLayer.position.y - 35);
    moveAnimation.duration = 0.5;
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount = INFINITY;
    [barLayer addAnimation:moveAnimation forKey:@"moveAnimation"];
    
    repLayer.instanceCount = 10; // 设置拷贝多少份，拷贝默认会出现在相同的位置
    repLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0); // 设置每个拷贝位移（相对于前一个拷贝）
    repLayer.instanceDelay = 0.3; // 设置延迟
    repLayer.instanceRedOffset = -0.1;
    repLayer.instanceBlueOffset = -0.1;
    repLayer.instanceGreenOffset = -0.1;
    repLayer.instanceAlphaOffset = -0.05;
}

- (void)indicatorAnimation {
    int dotsNum = 15;
    CFTimeInterval duration = 1.5;
    CAReplicatorLayer * repLayer = [CAReplicatorLayer layer];
    repLayer.frame = CGRectMake(20, 150, 200, 200);
    repLayer.instanceCount = dotsNum; // 设置拷贝份数
    repLayer.instanceTransform = CATransform3DMakeRotation(2 * M_PI / dotsNum, 0, 0, 1); // 绕Z轴旋转
    repLayer.instanceDelay = duration / dotsNum;
    [self.view.layer addSublayer:repLayer];
    
    //  单个小方块（原始层）
    CALayer * dotLayer = [CALayer layer];
    dotLayer.bounds = CGRectMake(0, 0, 14, 14);
    dotLayer.position = CGPointMake(repLayer.frame.size.width / 2, 40);
    dotLayer.cornerRadius = 7;
    dotLayer.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
    dotLayer.borderColor = [UIColor colorWithWhite:1.0 alpha:1].CGColor;
    [repLayer addSublayer:dotLayer];
    
    // 给复制层添加动画
    CABasicAnimation * shrinkAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrinkAnimation.fromValue = @(1.0);
    shrinkAnimation.toValue = @(0.1);
    shrinkAnimation.duration = duration;
    shrinkAnimation.repeatCount = INFINITY;
    [dotLayer addAnimation:shrinkAnimation forKey:@"shrinkAnimation"];
}

@end
