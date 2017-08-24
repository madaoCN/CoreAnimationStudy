//
//  LayerContentsCenter.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/20.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "ContentsCenter.h"

@interface ContentsCenter ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation ContentsCenter

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [super viewDidLoad]; //load button image
    UIImage *image = [UIImage imageNamed:@"button.jpg"];
    //set button 1
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.75, 0.75) toLayer:self.button1.layer];
     //set button 2
     [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button2.layer];
}

- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    //set image
    layer.contents = (__bridge id)image.CGImage;
    //set contentsCenter
    layer.contentsCenter = rect;
}

@end
