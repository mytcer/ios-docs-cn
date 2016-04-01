//
//  ViewController.m
//  AVPlayerLayerDemo
//
//  Created by xidanjueying on 16/3/30.
//  Copyright © 2016年 xidanjueying. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"av" withExtension:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    layer.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    layer.position = self.view.center;
    layer.masksToBounds = YES;
    [self.view.layer addSublayer:layer];
    
    [player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
