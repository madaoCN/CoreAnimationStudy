//
//  TiledLayer.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/25.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "TiledLayer.h"

@interface TiledLayer ()<CALayerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation TiledLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //add the tiled layer
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tileLayer.delegate = self;
    [self.scrollView.layer addSublayer:tileLayer];
    //configure the scroll view
    self.scrollView.contentSize = tileLayer.frame.size;
    //draw layer
    [tileLayer setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx {
    //determine tile coordinate
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    //load tiny image
    NSString *imageName = @"Lilya";
    UIImage *tileImage = [UIImage imageNamed:imageName];
    //draw tile
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
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
