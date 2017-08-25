//
//  PlayerLayer.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/25.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "PlayerLayer.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerLayer ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation PlayerLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //get video URL
    NSString *url = [[NSBundle mainBundle] pathForResource:@"MotoDemo" ofType:@"mp4"];
    NSURL *URL = [NSURL URLWithString:@"http://ugclx.video.gtimg.com/flv/206/167/c01487zqu0p.mp4?sdtfrom=v1010&guid=76a07760aeaf4e1df4e32917bb8ecd16&vkey=74ECE3DC5E4C8953729653DDC69403E8853133094B4CF5EB1ACAC7BD0A79E9298018D67B149C88050BB776BEB098740C622E26304244ECF3B287CDC533D21BB3FE5592095374CB66DE25CC4DAC66129AEB5051D9A82CE0E40F16F239115F1DE2B91E45D016B7EF6C5C742940437C5A99E731B356E94DD5EC&platform=2"];
    
    //create player and player layer
    AVPlayer *player = [AVPlayer playerWithURL:URL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    //set player layer frame and attach it to our view
    playerLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:playerLayer];
    //play the video
    [player play];
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
