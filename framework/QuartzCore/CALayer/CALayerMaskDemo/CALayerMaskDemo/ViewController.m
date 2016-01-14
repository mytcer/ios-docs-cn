//
//  ViewController.m
//  CALayerMaskDemo
//
//  Created by xidanjueying on 16/1/14.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 示例参考了这篇文章：http://www.monk-studio.com/calayerhua-mask/
    UIImage *originImage = [UIImage imageNamed:@"1"];
    UIImageView *originImageView = [[UIImageView alloc] initWithImage:originImage];
    originImageView.frame = CGRectMake(0, 0, originImage.size.width, originImage.size.height);
    originImageView.center = self.view.center;
    [self.view addSubview:originImageView];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    CGMutablePathRef maskPath = CGPathCreateMutable();
    CGPathAddEllipseInRect(maskPath, nil, CGRectInset(originImageView.bounds, 20, 20));
    CGPathAddEllipseInRect(maskPath, nil, CGRectInset(originImageView.bounds, 40, 40));
    CGPathAddEllipseInRect(maskPath, nil, CGRectInset(originImageView.bounds, 60, 60));
    CGPathAddEllipseInRect(maskPath, nil, CGRectInset(originImageView.bounds, 80, 80));
    maskLayer.path = maskPath;
    maskLayer.fillRule = kCAFillRuleEvenOdd; // 取路径叠加的差集
    maskLayer.shadowOpacity = 1;
    maskLayer.shadowRadius = 10;
    maskLayer.shadowOffset = CGSizeMake(0, 0);
    
    originImageView.layer.mask = maskLayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
