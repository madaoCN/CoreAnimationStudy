//
//  HitTesting.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/20.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "HitTesting.h"

@interface HitTesting ()
@property (nonatomic, strong) CALayer *blueLayer;
@property (nonatomic, weak) IBOutlet UIView *layerView;
@end

@implementation HitTesting

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //create sublayer
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(0, 0, 50.0f, 50.0f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.layerView.layer addSublayer:self.blueLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //get touch position
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //get touched layer
    CALayer *layer = [self.layerView.layer hitTest:point];
    //get layer using hitTest
    if (layer == self.blueLayer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else if (layer == self.layerView.layer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    //    //get touch position relative to main view
    //    CGPoint point = [[touches anyObject] locationInView:self.view];
    //    //convert point to the white layer's coordinates
    //    point = [self.view.layer convertPoint:point fromLayer:self.view.layer]; //get layer using containsPoint:
    //    if ([self.view.layer containsPoint:point]) {
    //        //convert point to blueLayer’s coordinates
    //        point = [self.blueLayer convertPoint:point fromLayer:self.view.layer]; if ([self.blueLayer containsPoint:point]) {
    //            [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
    //                                        message:nil
    //                                       delegate:nil
    //                              cancelButtonTitle:@"OK"
    //                              otherButtonTitles:nil] show];
    //        } else {
    //            [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
    //                                        message:nil
    //                                       delegate:nil
    //                              cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    //        }
    //    }
}


@end
