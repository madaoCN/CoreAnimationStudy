//
//  LayerContentsRect.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/18.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "ContentsRect.h"

@interface ContentsRect ()

@property (nonatomic, weak) IBOutlet UIView *view1;
@property (nonatomic, weak) IBOutlet UIView *view2;
@property (nonatomic, weak) IBOutlet UIView *view3;
@property (nonatomic, weak) IBOutlet UIView *view4;

@end

@implementation ContentsRect

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImage *image = [UIImage imageNamed:@"Lilya.jpg"];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.view1.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.view2.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.view3.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.view4.layer];
}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer //set i
{
    layer.contents = (__bridge id)image.CGImage;
    //scale contents to fit
    layer.contentsGravity = kCAGravityCenter;
    //set contentsRect
    layer.contentsRect = rect;
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
