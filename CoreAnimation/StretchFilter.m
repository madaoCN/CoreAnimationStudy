//
//  StretchFilter.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/21.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "StretchFilter.h"

@interface StretchFilter ()
{
    NSArray *_views;
}
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation StretchFilter

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _views = @[_view1, _view2, _view3];
    UIImage *image = [UIImage imageNamed:@"digits"];
    
    for (UIView *view in _views) {
        //set contents
        view.layer.contents = (__bridge id)image.CGImage;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 0.1);
        view.layer.contentsGravity = kCAGravityResizeAspect;
        
        //make it clear
        view.layer.magnificationFilter = kCAFilterNearest;
    }
    
    //start timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
                  //set initial clock time
    [self tick];
}

- (void)setDigit:(NSInteger)digit forView:(UIView *)view
{
    //adjust contentsRect to select correct digit
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.1, 1.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tick
{
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    //set hours
    [self setDigit:components.minute % 10 forView:_views[0]];
    [self setDigit:components.second / 10 forView:_views[1]];
    //set minutes
    [self setDigit:components.second % 10 forView:_views[2]];
}

- (void)dealloc
{
    self.timer ? [self.timer invalidate] : nil;
}

@end
