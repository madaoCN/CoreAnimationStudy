//
//  GroupOpacity.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/21.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "GroupOpacity.h"

@interface GroupOpacity ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

@implementation GroupOpacity

- (UIButton *)customButton
{
    //create button
    CGRect frame = CGRectMake(0, 0, 150, 50);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 10;
    //add label
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = @"Hello World";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    [button addSubview:label];
    return button;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.


    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(100, 150);
//    button1.alpha = 0.5;
    [self.view addSubview:button1];
    //create translucent button
    UIButton *button2 = [self customButton];
    button2.center = CGPointMake(300, 150);
    button2.alpha = 0.5;
    [self.view addSubview:button2];
    //enable rasterization for the translucent button
    // 已经默认组透明
//    button2.layer.shouldRasterize = YES;
//    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
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
