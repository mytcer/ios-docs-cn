//
//  ViewController.m
//  ElasticBallDemo
//
//  Created by xidanjueying on 16/4/18.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic) CALayer *ballLayer;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ballLayer = [CALayer layer];
    self.ballLayer.frame = CGRectMake(0, 0, 50, 50);
    self.ballLayer.position = CGPointMake(self.view.center.x, 100);
    self.ballLayer.cornerRadius = 25;
    self.ballLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:self.ballLayer];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 40, 60, 20);
    [btn setTitle:@"play" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(animate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (float)interpolate:(float)from to:(float)to time:(float)time {
    return (to - from) * time + from;
}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time {
    if ([fromValue isKindOfClass:[NSValue class]]) {
        const char *type = [fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake([self interpolate:from.x to:to.x time:time], [self interpolate:from.y to:to.y time:time]);
            return [NSValue valueWithCGPoint:result];
        }
    }
    return (time < 0.5)? fromValue: toValue;
}

- (float)bounceEaseOut:(float)t { // 这个算法copy自web，不明白具体意思
    if (t < 4/11.0) {
        return (121 * t * t)/16.0;
    } else if (t < 8/11.0) {
        return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
    } else if (t < 9/10.0) {
        return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
    }
    return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0;
}

- (void)animate {
    NSValue *fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, 100)];
    NSValue *toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, CGRectGetHeight(self.view.bounds) - 50)];
    CFTimeInterval duration = 1.0;
    NSInteger numFrames = duration * 60;
    NSMutableArray *frames = [NSMutableArray new];
    
    for (int i = 0; i < numFrames; i++) {
        float time = [self bounceEaseOut:1 / (float)numFrames * i];
        [frames addObject:[self interpolateFromValue:fromValue toValue:toValue time:time]];
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.delegate = self;
    animation.values = frames;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.ballLayer addAnimation:animation forKey:nil];
}

@end
