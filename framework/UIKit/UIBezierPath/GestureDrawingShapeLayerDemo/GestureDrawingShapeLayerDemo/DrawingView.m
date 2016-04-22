//
//  DrawingView.m
//  GestureDrawingShapeLayerDemo
//
//  Created by xidanjueying on 16/4/22.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "DrawingView.h"


@interface DrawingView()

@property (nonatomic) UIBezierPath *path;

@end


@implementation DrawingView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.path = [UIBezierPath new];
        CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineJoin = kCALineJoinRound;
        shapeLayer.lineCap = kCALineCapRound;
        shapeLayer.lineWidth = 5;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    [self.path addLineToPoint:point];
    ((CAShapeLayer *)self.layer).path = self.path.CGPath;
}

- (void)clearBoard {
    [self.path removeAllPoints];
    ((CAShapeLayer *)self.layer).path = nil;
}

+ (Class)layerClass {
    return [CAShapeLayer class];
}

@end
