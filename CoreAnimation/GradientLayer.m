//
//  GradientLayer.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/23.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "GradientLayer.h"

@interface GradientLayer ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation GradientLayer

- (id)randomColor
{
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    return (__bridge id)[UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //create gradient layer and add it to our container view
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:gradientLayer];
    //set gradient colors
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0 ; i < 4; i++) {
        [arr addObject:[self randomColor]];
    }
    gradientLayer.colors = arr;
    gradientLayer.locations = @[@0.2, @0.4, @0.6, @0.8];
    //set gradient start and end points
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
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
