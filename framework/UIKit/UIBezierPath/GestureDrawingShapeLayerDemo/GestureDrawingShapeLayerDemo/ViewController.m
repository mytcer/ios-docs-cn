//
//  ViewController.m
//  GestureDrawingShapeLayerDemo
//
//  Created by xidanjueying on 16/4/22.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"


@interface ViewController()

@property (nonatomic) DrawingView *drawingView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 30, 100, 30);
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [btn setTitle:@"擦掉" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.drawingView = [DrawingView new];
    self.drawingView.frame = CGRectMake(0, 60, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 60);
    self.drawingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.drawingView];
}

- (void)onClickButton {
    [self.drawingView clearBoard];
}
@end
