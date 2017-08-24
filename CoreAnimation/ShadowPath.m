//
//  ShadowPath.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/20.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "ShadowPath.h"

@interface ShadowPath ()

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@end

@implementation ShadowPath

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //enable layer shadows
    self.view1.layer.shadowOpacity = 0.5f;
    self.view2.layer.shadowOpacity = 0.5f;
    self.view1.layer.shadowColor = [UIColor blackColor].CGColor;
    //create a square shadow
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.view1.bounds);
    self.view1.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.view2.bounds);
    self.view2.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
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
