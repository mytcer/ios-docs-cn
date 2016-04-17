//
//  ViewController.m
//  ManualAnimationDemo
//
//  Created by xidanjueying on 16/4/15.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic) CALayer *shipLayer;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(20, CGRectGetMidY(self.view.bounds), 50, 50);
    self.shipLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.shipLayer.speed = 0;
    [self.view.layer addSublayer:self.shipLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.duration = 1.0;
    animation.toValue = @(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.shipLayer.bounds));
    [self.shipLayer addAnimation:animation forKey:nil];
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
    [self.view addGestureRecognizer:gesture];
}

- (void)panHandler:(UIPanGestureRecognizer *)gesture {
    CGFloat x = [gesture translationInView:self.view].x; // 获取相对坐标原点的水平平移距离
    x /= (CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.shipLayer.bounds));
    CFTimeInterval currentTimeOffset = self.shipLayer.timeOffset;
    // 手势右滑为前进（此时x值为正），左滑为后退（此时x值为负）
    self.shipLayer.timeOffset = MIN(1.0, MAX(0, currentTimeOffset + x));
    [gesture setTranslation:CGPointZero inView:self.view]; // 设置坐标原点
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
