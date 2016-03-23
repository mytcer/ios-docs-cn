//
//  ViewController.m
//  CATransformLayerCubeDemo
//
//  Created by xidanjueying on 16/3/22.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500.0;
    self.view.layer.sublayerTransform = pt;
    
    CATransform3D ct1 = CATransform3DIdentity;
    ct1 = CATransform3DTranslate(ct1, -100, 0, 0);
    ct1 = CATransform3DRotate(ct1, M_PI_4, 1, 0, 0);
    ct1 = CATransform3DRotate(ct1, M_PI_4, 0, 1, 0);
    CATransformLayer *cube1 = [self cubeWithTransform:ct1];
    [self.view.layer addSublayer:cube1];
    
    CATransform3D ct2 = CATransform3DIdentity;
    ct2 = CATransform3DTranslate(ct2, 100, 0, 0);
    ct2 = CATransform3DRotate(ct2, -M_PI_4, 1, 0, 0);
    ct2 = CATransform3DRotate(ct2, -M_PI_4, 0, 1, 0);
    CATransformLayer *cube2 = [self cubeWithTransform:ct2];
    [self.view.layer addSublayer:cube2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CATransformLayer *)cubeWithTransform:(CATransform3D)transform {
    CATransformLayer *cube = [CATransformLayer layer];
    
    // add face1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // add face2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // add face3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // add face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // add face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // add face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    cube.position = self.view.center;
    cube.transform = transform;
    
    return cube;
}

- (CALayer *)faceWithTransform:(CATransform3D)transform {
    CALayer *face = [CALayer layer];
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    
    face.frame = CGRectMake(-50, -50, 100, 100);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    face.transform = transform;
    
    return face;
}

@end
