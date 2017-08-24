//
//  MirrorSight.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/22.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "MirrorSight.h"

@interface MirrorSight ()

@property (weak, nonatomic) IBOutlet UIImageView *layerView;
@property (weak, nonatomic) IBOutlet UILabel *notifyLabel;
@property (weak, nonatomic) IBOutlet UISwitch *bothSideToggle;

@end

@implementation MirrorSight

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //apply perspective transform to container
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
    self.view.layer.sublayerTransform = perspective;
    //rotate layerView1 by 45 degrees along the Y axis
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI, 0, 1, 0); self.layerView.layer.transform = transform1;
    
    [self.bothSideToggle setOn:YES];
    [self.bothSideToggle addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged:(UISwitch *)sender
{
    self.layerView.layer.doubleSided = sender.isOn;
    self.notifyLabel.text = [NSString stringWithFormat:@"doubleSided: %@", sender.on ? @"YES":@"NO"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
