//
//  Transaction.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/26.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "Transaction.h"

@interface Transaction ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation Transaction

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    __weak typeof(self) weakSelf = self;
    [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf animate];
    }];
    
}

- (void)animate
{

    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.containerView.layer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.containerView.layer.affineTransform = transform;
    }];
    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.containerView.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    //commit the transaction
    [CATransaction commit];
    
    
    // actionForKey disabled by UIView OutSide
    // delegate -> actions -> style
    NSLog(@"Outside: %@", [self.containerView actionForLayer:self.containerView.layer forKey:@"backgroundColor"]);
    [UIView beginAnimations:nil context:nil];
    NSLog(@"Inside: %@", [self.containerView actionForLayer:self.containerView.layer forKey:@"backgroundColor"]);
    [UIView commitAnimations];
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
