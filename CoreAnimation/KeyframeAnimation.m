//
//  KeyframeAnimation.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/26.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "KeyframeAnimation.h"

@interface KeyframeAnimation ()
@property (weak, nonatomic) IBOutlet UIView *colorView;

@end

@implementation KeyframeAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)changeColor
{
    //create a keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor ];
    //apply animation to layer
    [self.colorView.layer addAnimation:animation forKey:nil];
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
