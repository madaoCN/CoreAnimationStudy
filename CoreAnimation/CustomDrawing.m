//
//  LayerCustomDrawing.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/20.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "CustomDrawing.h"

@interface CustomDrawing ()<CALayerDelegate>
{
    CALayer *blueLayer;
}

@end

@implementation CustomDrawing

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //create sublayer
    blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(100.0f, 100.0f, 100.0f, 100.0f);
    
    blueLayer.backgroundColor = [UIColor grayColor].CGColor;
    //set controller as layer delegate
    blueLayer.delegate = self;
    //ensure that layer backing image uses correct scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
    [self.view.layer addSublayer:blueLayer];
    //force layer to redraw
    [blueLayer display];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)dealloc
{
    blueLayer.delegate = nil;
}
@end
