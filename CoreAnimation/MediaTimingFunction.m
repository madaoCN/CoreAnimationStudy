//
//  MediaTimingFunction.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/26.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "MediaTimingFunction.h"

@interface MediaTimingFunction ()
@property (weak, nonatomic) IBOutlet UIView *cotainerView;

@end

@implementation MediaTimingFunction

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //create timing function
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
//    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithControlPoints:1 :0 :0.75 :1];
    //get control points
   CGPoint controlPoint1, controlPoint2;
   [function getControlPointAtIndex:1 values:(float *)&controlPoint1];
   [function getControlPointAtIndex:2 values:(float *)&controlPoint2];
   //create curve
   UIBezierPath *path = [[UIBezierPath alloc] init];
   [path moveToPoint:CGPointZero];
   [path addCurveToPoint:CGPointMake(1, 1)
           controlPoint1:controlPoint1 controlPoint2:controlPoint2];
   //scale the path up to a reasonable size for display
   [path applyTransform:CGAffineTransformMakeScale(200, 1)];
   //create shape layer
   CAShapeLayer *shapeLayer = [CAShapeLayer layer];
   shapeLayer.strokeColor = [UIColor redColor].CGColor;
   shapeLayer.fillColor = [UIColor clearColor].CGColor;
   shapeLayer.lineWidth = 4.0f;
   shapeLayer.path = path.CGPath;
   [self.cotainerView.layer addSublayer:shapeLayer];
   //flip geometry so that 0,0 is in the bottom-left
   self.cotainerView.layer.geometryFlipped = YES;
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
