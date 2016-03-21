//
//  ViewController.m
//  CATransform3DDemo
//
//  Created by xidanjueying on 16/1/24.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTransformRotateDemo];
    [self addSubLayerTransformDemo];
    [self addTransformScaleDemo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)addTransformRotateDemo {
    CATransform3D transform = CATransform3DIdentity; // 初始一个什么也不做的矩阵
    transform.m34 = - 1.0 / 500; // 应用透视效果（注意：该值必须是浮点数，否则不会有透视效果）
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0); // 绕Y轴旋转45度
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = CGRectMake(0, 50, 100, 100);
    view.layer.transform = transform;
    view.layer.doubleSided = NO; // 不绘制图层的背面
    [self.view addSubview:view];
}

// sublayerTransform的使用demo
- (void)addSubLayerTransformDemo {
    CGFloat width = CGRectGetWidth(self.view.frame);
    
    CATransform3D sublayerTransform = CATransform3DIdentity;
    sublayerTransform.m34 = - 1.0 / 500;
    UIView *containerView = [UIView new];
    containerView.frame = CGRectMake(0, 200, width, 100);
    containerView.layer.sublayerTransform = sublayerTransform; // 设置containerView所有子图层的变换
    [self.view addSubview:containerView];
    
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0); // 沿Y轴逆时针旋转45度
    UIView *view1 = [UIView new];
    view1.frame = CGRectMake(0, 0, width / 2 - 10, 100);
    view1.backgroundColor = [UIColor lightGrayColor];
    view1.layer.transform = transform1;
    [containerView addSubview:view1];
    
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0); // 沿Y轴顺时针旋转45度
    UIView *view2 = [UIView new];
    view2.frame = CGRectMake(width / 2 + 10, 0, width / 2 - 10, 100);
    view2.backgroundColor = [UIColor lightGrayColor];
    view2.layer.transform = transform2;
    [containerView addSubview:view2];
}

- (void)addTransformScaleDemo {
    CATransform3D transform = CATransform3DIdentity; // 初始一个什么也不做的矩阵
    transform.m34 = - 1.0 / 500; // 应用透视效果（注意：该值必须是浮点数，否则不会有透视效果）
    transform = CATransform3DScale(transform, 0.5, 0.5, 1);
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = CGRectMake(0, 350, 100, 100);
    view.layer.transform = transform;
    [self.view addSubview:view];
}

@end
