//
//  DrawingView.m
//  GestureDrawingDemo
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
        self.path.lineJoinStyle = kCGLineJoinRound;
        self.path.lineCapStyle = kCGLineCapRound;
        self.path.lineWidth = 5;
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
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [[UIColor clearColor] setFill];
    [[UIColor redColor] setStroke];
    [self.path stroke];
}

- (void)clearBoard {
    [self.path removeAllPoints];
    [self setNeedsDisplay];
}

@end
