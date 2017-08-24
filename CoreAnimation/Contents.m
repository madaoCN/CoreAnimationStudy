//
//  LayerContentsController.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/18.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "Contents.h"

@interface Contents ()

@end

@implementation Contents

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"Lilya.jpg"];
    self.view.layer.contents = (__bridge id)image.CGImage;
    self.view.layer.contentsGravity = kCAGravityCenter;
    self.view.layer.contentsScale = image.scale;
    
    // Set content rect
    
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
