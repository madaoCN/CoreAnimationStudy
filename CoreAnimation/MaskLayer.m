//
//  MaskLayer.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/20.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "MaskLayer.h"

@interface MaskLayer ()

@property (weak, nonatomic) IBOutlet UIImageView *imageLayer;

@end

@implementation MaskLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.imageLayer.bounds;
    
    UIGraphicsBeginImageContextWithOptions(self.imageLayer.frame.size, NO, self.imageLayer.layer.contentsScale);
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(con, [UIColor redColor].CGColor);
    CGContextSetLineWidth(con, 40);
    CGContextStrokeRect(con, self.imageLayer.bounds);
    UIImage *maskImage = UIGraphicsGetImageFromCurrentImageContext();
    
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    //apply mask to image layer
    self.imageLayer.layer.mask = maskLayer;
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
