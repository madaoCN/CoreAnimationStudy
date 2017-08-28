//
//  KeyframeMediaTimingFunction.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/26.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "KeyframeMediaTimingFunction.h"

@interface KeyframeMediaTimingFunction ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) UIImageView *starView;
@end

@implementation KeyframeMediaTimingFunction

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //add ball image view
    UIImage *starImage = [UIImage imageNamed:@"star"];
    self.starView = [[UIImageView alloc] initWithImage:starImage];
    [self.containerView addSubview:self.starView];
    //animate
    [self animate];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //replay animation on tap
    [self animate];
}


FOUNDATION_EXTERN float interpolate(float from, float to, float time)
{
    return (to - from) * time + from;
}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time {
    if ([fromValue isKindOfClass:[NSValue class]]) {
        //get type
        const char *type = [fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake(interpolate(from.x, to.x, time), interpolate(from.y, to.y, time));
            return [NSValue valueWithCGPoint:result];
                                                                                      
        }
    }
      //provide safe default implementation
      return (time < 0.5)? fromValue: toValue;
}
                                                                                      
- (void)animate
{
    //reset ball to top of screen
    self.starView.center = CGPointMake(150, 32);
    
//    NSValue *fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 32)]; NSValue *toValue = [NSValue valueWithCGPoint:CGPointMake(150, 268)];
//    CFTimeInterval duration = 1.0;
//    //generate keyframes
//    NSInteger numFrames = duration * 60;
//    NSMutableArray *frames = [NSMutableArray array];
//    for (int i = 0; i < numFrames; i++) {
//        float time = 1 / (float)numFrames * i;
//        [frames addObject:[self interpolateFromValue:fromValue toValue:toValue time:time]];
//    }
//    //create keyframe animation
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"position";
//    animation.duration = 1.0;
//    animation.delegate = self;
//    animation.values = frames;
//    //apply animation
//    [self.starView.layer addAnimation:animation forKey:nil];
    
    
    //create keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.delegate = self;
    animation.values = @[
                         [NSValue valueWithCGPoint:CGPointMake(150, 32)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 140)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 220)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 250)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)]
                         ];
    animation.timingFunctions = @[
                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                         ];
    
    animation.keyTimes = @[@0.0, @0.3, @0.5, @0.7, @0.8, @0.9, @0.95, @1.0];
    //apply animation
    self.starView.layer.position = CGPointMake(150, 268);
    [self.starView.layer addAnimation:animation forKey:nil];
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
