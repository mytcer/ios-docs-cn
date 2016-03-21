//
//  ViewController.m
//  CATransform3DCubeDemo
//
//  Created by xidanjueying on 16/3/9.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic) CALayer *rootLayer;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建主Layer
    CATransform3D transform = CATransform3DIdentity;
    self.rootLayer = [CALayer layer];
    self.rootLayer.contentsScale = [UIScreen mainScreen].scale;
    self.rootLayer.frame = self.view.bounds;
    transform.m34 = -1.0 / 500;
    transform = CATransform3DRotate(transform, -M_PI_4, 1, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_4, 0, 1, 0);
    self.rootLayer.sublayerTransform = transform;
    [self.view.layer addSublayer:self.rootLayer];
    
    // 顶部：沿Z轴向上移动50
    [self addLayerWithTranslationX:0 translationY:0 translationZ:50 rotateAngle:0 rotateX:0 rotateY:0 rotateZ:0 backgroundColor:[UIColor redColor]];
    // 底部：沿Z轴向下移动50，同时翻转180度（不然底部转到最前面时，看到的将是其背面）
    [self addLayerWithTranslationX:0 translationY:0 translationZ:-50 rotateAngle:M_PI rotateX:0 rotateY:1 rotateZ:0 backgroundColor:[UIColor greenColor]];
    // 左面：沿X轴向左移动50，然后沿Y轴逆时针旋转90度（立起来）
    [self addLayerWithTranslationX:-50 translationY:0 translationZ:0 rotateAngle:-M_PI_2 rotateX:0 rotateY:1 rotateZ:0 backgroundColor:[UIColor blueColor]];
    // 右面：沿X轴向右移动50，然后沿Y轴顺时针旋转90度
    [self addLayerWithTranslationX:50 translationY:0 translationZ:0 rotateAngle:M_PI_2 rotateX:0 rotateY:1 rotateZ:0 backgroundColor:[UIColor grayColor]];
    // 后面：沿Y轴向上移动50，然后沿X轴逆时针旋转90度（注意：坐标系的原点在左上角，所以向上移动时，y值会越来越小）
    [self addLayerWithTranslationX:0 translationY:-50 translationZ:0 rotateAngle:-M_PI_2 rotateX:1 rotateY:0 rotateZ:0 backgroundColor:[UIColor blackColor]];
    // 前面：沿Y轴向下移动50，然后沿X轴顺时针旋转90度
    [self addLayerWithTranslationX:0 translationY:50 translationZ:0 rotateAngle:M_PI_2 rotateX:1 rotateY:0 rotateZ:0 backgroundColor:[UIColor yellowColor]];
    
    // 动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"sublayerTransform.rotation.y"];
    animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    animation.duration = 3.0;
    animation.repeatCount = INFINITY;
    [self.rootLayer addAnimation:animation forKey:@"rotation"];
}

- (void)addLayerWithTranslationX:(float)translationX
                    translationY:(float)translationY
                    translationZ:(float)translationZ
                     rotateAngle:(float)rotateAngle
                         rotateX:(float)rotateX
                         rotateY:(float)rotateY
                         rotateZ:(float)rotateZ
                 backgroundColor:(UIColor *)color {
    CALayer *layer = [CALayer layer];
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = self.view.center;
    layer.backgroundColor = color.CGColor;
    
    CATransform3D transform = CATransform3DMakeTranslation(translationX, translationY, translationZ);
    transform = CATransform3DRotate(transform, rotateAngle, rotateX, rotateY, rotateZ);
    layer.transform = transform;
    [self.rootLayer addSublayer:layer];
}

@end
