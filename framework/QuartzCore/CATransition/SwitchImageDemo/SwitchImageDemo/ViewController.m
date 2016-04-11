//
//  ViewController.m
//  SwitchImageDemo
//
//  Created by xidanjueying on 16/4/6.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) NSArray *images;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.images = @[[UIImage imageNamed:@"1.jpg"],
                    [UIImage imageNamed:@"2.jpg"],
                    [UIImage imageNamed:@"3.jpg"]];
    
    self.imageView = [UIImageView new];
    self.imageView.frame = CGRectMake(0, 0, 200, 100);
    self.imageView.center = self.view.center;
    self.imageView.clipsToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.image = self.images[0];
    [self.view addSubview:self.imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    if (![self.imageView.layer hitTest:point]) {
        [self switchImage];
    }
}

- (void)switchImage {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [self.imageView.layer addAnimation:transition forKey:nil];
    
    NSInteger index = [self.images indexOfObject:self.imageView.image];
    index = (index + 1) % self.images.count;
    self.imageView.image = self.images[index];
}

@end
