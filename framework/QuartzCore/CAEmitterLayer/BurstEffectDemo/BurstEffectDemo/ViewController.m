//
//  ViewController.m
//  BurstEffectDemo
//
//  Created by xidanjueying on 16/3/29.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAEmitterLayer *emiLayer = [CAEmitterLayer layer];
    emiLayer.frame = CGRectMake(0, 0, 200, 200);
    emiLayer.emitterPosition = self.view.center;
    emiLayer.emitterShape = kCAEmitterLayerCircle;
    emiLayer.renderMode = kCAEmitterLayerAdditive;
    [self.view.layer addSublayer:emiLayer];
    
    CAEmitterCell *cell = [CAEmitterCell new];
    cell.contents = (__bridge id)[UIImage imageNamed:@"heart"].CGImage;
    cell.birthRate = 50; // 每秒钟创建的发射对象的数量
    cell.lifetime = 10.0; // 每个发射对象的生命周期，值越大，发射对象的运动距离就越远
    cell.alphaSpeed = -0.2; // 发射对象在其生命周期中的颜色分量的变化速度
    cell.velocity = 50; // 发射对象初始的平均速度
    cell.emissionRange = M_PI * 2; // 对象发射范围，2 * M_PI表示可以从360度任意位置反射出来。
    
    emiLayer.emitterCells = @[cell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
