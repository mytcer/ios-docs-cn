//
//  ViewController.m
//  FillModeDemo
//
//  Created by xidanjueying on 16/4/14.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic) CALayer *shipLayer;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(20, CGRectGetMidY(self.view.bounds) - 50, 50, 50);
    self.shipLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:self.shipLayer];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 50);
    btn.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) + CGRectGetHeight(self.shipLayer.bounds) + 30);
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.borderWidth = 1;
    [btn setTitle:@"Play" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)play {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @100;
    animation.toValue = @(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.shipLayer.bounds));
    animation.duration = 3.0;
    animation.beginTime = CACurrentMediaTime() + 1; // 注意：必须在CACurrentMediaTime()的基础上增加时间，否则动画不会执行
    animation.removedOnCompletion = NO; // 说明：该属性设置为NO，并恰当地设置fillMode，可以避免动画结束后急速返回的问题
    /**
     * fillMode目前有四个值，其作用如下：
     * -- kCAFillModeRemoved: 默认值，动画开始前和结束后，对layer都没有影响，动画结束后，layer会恢复到之前的状态。
     * -- kCAFillModeForwards: 动画结束后，layer会一直保持着动画结束时的状态
     * -- kCAFillModeBackwards: 在动画开始前，只要将动画添加到layer，layer便立即进入动画初始状态并等待动画开始。
     * -- kCAFillModeBoth: 动画添加到layer后，在动画开始前，layer就立即进入动画初始状态；在动画结束后，layer一直保持动画结束时的状态。
     */
    animation.fillMode = kCAFillModeBoth;
    [self.shipLayer addAnimation:animation forKey:@"moveShip"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
