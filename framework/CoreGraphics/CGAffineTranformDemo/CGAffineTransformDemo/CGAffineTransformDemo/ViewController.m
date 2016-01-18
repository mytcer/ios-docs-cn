//
//  ViewController.m
//  CGAffineTransformDemo
//
//  Created by xidanjueying on 16/1/18.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRotateTransformDemo];
    [self addScaleTransformDemo];
    [self addTranslateTransformDemo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addRotateTransformDemo {
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4); // 顺时针旋转45度
    UIView *view = [UIView new];
    view.frame = CGRectMake(50, 70, 50, 50);
    view.backgroundColor = [UIColor lightGrayColor];
    view.layer.affineTransform = transform;
    [self.view addSubview:view];
}

- (void)addScaleTransformDemo {
    CGAffineTransform transform = CGAffineTransformMakeScale(0.5, 0.5); // 缩小一倍
    UIView *view = [UIView new];
    view.frame = CGRectMake(150, 70, 100, 100);
    view.backgroundColor = [UIColor lightGrayColor];
    view.layer.affineTransform = transform;
    [self.view addSubview:view];
}

- (void)addTranslateTransformDemo {
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 100); // 向下平移100
    UIView *view = [UIView new];
    view.frame = CGRectMake(50, 70, 50, 50);
    view.backgroundColor = [UIColor lightGrayColor];
    view.layer.affineTransform = transform;
    [self.view addSubview:view];
}


@end
