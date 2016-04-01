//
//  ViewController.m
//  CAKeyframeAnimationDemo
//
//  Created by xidanjueying on 16/4/1.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic) CALayer *colorLayer;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 200, 200);
    self.colorLayer.position = self.view.center;
    self.colorLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.colorLayer.borderWidth = 1;
    self.colorLayer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)changeColor {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[(__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor yellowColor].CGColor
                         ];
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    if (![self.colorLayer.presentationLayer hitTest:point]) {
        [self changeColor];
    }
}

@end
