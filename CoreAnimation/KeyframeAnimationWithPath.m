//
//  KeyframeAnimationWithPath.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/26.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "KeyframeAnimationWithPath.h"

@interface KeyframeAnimationWithPath ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation KeyframeAnimationWithPath

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //create a path
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(120, 50)];
    //draw the path using a CAShapeLayer
     CAShapeLayer *pathLayer = [CAShapeLayer layer];
     pathLayer.path = bezierPath.CGPath;
     pathLayer.fillColor = [UIColor clearColor].CGColor;
     pathLayer.strokeColor = [UIColor redColor].CGColor;
     pathLayer.lineWidth = 3.0f;
     [self.containerView.layer addSublayer:pathLayer];
     //add the ship
     CALayer *shipLayer = [CALayer layer];
     shipLayer.frame = CGRectMake(0, 0, 64, 64);
     shipLayer.position = CGPointMake(0, 150);
     shipLayer.contents = (__bridge id)[UIImage imageNamed: @"star"].CGImage;
     [self.containerView.layer addSublayer:shipLayer];
     //create the keyframe animation
     CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
     animation.keyPath = @"position";
     animation.duration = 4.0;
     animation.path = bezierPath.CGPath;
     animation.rotationMode = kCAAnimationRotateAuto;
     [shipLayer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
