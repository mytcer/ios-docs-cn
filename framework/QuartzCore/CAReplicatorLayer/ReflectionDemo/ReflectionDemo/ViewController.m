//
//  ViewController.m
//  ReflectionDemo
//
//  Created by xidanjueying on 16/3/27.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"
#import "ReflectionView.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = CGSizeMake(100, 100);
    CALayer *containerLayer = [CALayer new];
    containerLayer.frame = CGRectMake(0, 0, size.width, size.height * 2);
    containerLayer.position = CGPointMake(self.view.center.x, self.view.center.y - 20);
    [self.view.layer addSublayer:containerLayer];
    
    // 给图片添加倒影
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image.jpg"]];
    imageView.frame = CGRectMake(0, 0, size.width, size.height);
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = size.width / 2;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, size.height, 0);
    transform = CATransform3DRotate(transform, -M_PI, 1, 0, 0);
    
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.frame = CGRectMake(0, 0, size.width, size.height);
    repLayer.instanceCount = 2;
    repLayer.instanceTransform = transform;
    [repLayer addSublayer:imageView.layer];
    [containerLayer addSublayer:repLayer];
    
    // 给倒影添加渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height * 2);
    gradientLayer.colors = @[(__bridge id)[UIColor whiteColor].CGColor,
                             (__bridge id)[UIColor clearColor].CGColor];
    gradientLayer.locations = @[@0.5, @0.75];
    [containerLayer setMask:gradientLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
