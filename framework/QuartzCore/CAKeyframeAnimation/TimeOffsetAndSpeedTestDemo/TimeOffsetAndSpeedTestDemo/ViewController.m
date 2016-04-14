//
//  ViewController.m
//  TimeOffsetAndSpeedTestDemo
//
//  Created by xidanjueying on 16/4/11.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *timeOffsetSlider;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UILabel *timeOffsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (nonatomic) UIBezierPath *bezierPath;
@property (nonatomic) CALayer *shipLayer;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bezierPath = [UIBezierPath new];
    [self.bezierPath moveToPoint:CGPointMake(20, 150)];
    [self.bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    // 画轨道
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.view.frame;
    pathLayer.path = self.bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3;
    [self.view.layer addSublayer:pathLayer];
    
    // 画滑块
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(20, 0, 20, 20);
    self.shipLayer.position = CGPointMake(20, 150);
    self.shipLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:self.shipLayer];
}

- (IBAction)play:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = self.bezierPath.CGPath;
    animation.duration = 2.0;
    animation.timeOffset = self.timeOffsetSlider.value;
    animation.speed = self.speedSlider.value;
    animation.removedOnCompletion = NO;
    animation.rotationMode = kCAAnimationRotateAuto;
    [self.shipLayer addAnimation:animation forKey:@"ship"];
}

- (IBAction)updateSlider:(id)sender {
    self.timeOffsetLabel.text = [NSString stringWithFormat:@"%.2f", self.timeOffsetSlider.value];
    self.speedLabel.text = [NSString stringWithFormat:@"%.2f", self.speedSlider.value];
}

@end
