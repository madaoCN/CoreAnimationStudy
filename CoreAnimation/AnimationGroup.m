//
//  AnimationGroup.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/26.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "AnimationGroup.h"

@interface AnimationGroup ()

@property (weak, nonatomic) IBOutlet UIView *cotainerView;

@end

@implementation AnimationGroup

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
     [self.cotainerView.layer addSublayer:pathLayer];
     //add a colored layer
     CALayer *colorLayer = [CALayer layer];
     colorLayer.frame = CGRectMake(0, 0, 64, 64);
     colorLayer.position = CGPointMake(0, 150);
     colorLayer.backgroundColor = [UIColor greenColor].CGColor;
     [self.cotainerView.layer addSublayer:colorLayer];
     //create the position animation
     CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
     animation1.keyPath = @"position";
     animation1.path = bezierPath.CGPath;
     animation1.rotationMode = kCAAnimationRotateAuto;
     //create the color animation
     CABasicAnimation *animation2 = [CABasicAnimation animation];
     animation2.keyPath = @"backgroundColor";
     animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
     //create group animation
     CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
     groupAnimation.animations = @[animation1, animation2];
     groupAnimation.duration = 4.0;
     //add the animation to the color layer
     [colorLayer addAnimation:groupAnimation forKey:nil];
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
