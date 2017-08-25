//
//  ScrollLayer.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/25.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "ScrollLayer.h"

@interface CustomScrollView : UIView

@end

@implementation CustomScrollView

+ (Class)layerClass
{
    return [CAScrollLayer class];
}
- (void)setUp
{
    //enable clipping
    self.layer.masksToBounds = YES;
    //attach pan gesture recognizer
    UIPanGestureRecognizer *recognizer = nil;
    recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)]; [self addGestureRecognizer:recognizer];
        
}
- (id)initWithFrame:(CGRect)frame
{
    //this is called when view is created in code
    if ((self = [super initWithFrame:frame])) {
        [self setUp];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    //get the offset by subtracting the pan gesture
    //translation from the current bounds origin
    CGPoint offset = self.bounds.origin;
    //translationInView 偏移量
    //locationInView    实时坐标
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    //scroll the layer
    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    //reset the pan gesture translation
    [recognizer setTranslation:CGPointZero inView:self];
}

@end

@interface ScrollLayer ()

@end

@implementation ScrollLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    CustomScrollView *scrollView = [[CustomScrollView alloc] initWithFrame:CGRectMake(100, 100, 200, 400)];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 50, 35);
    button.backgroundColor = [UIColor redColor];
    [scrollView addSubview:button];
    [self.view addSubview:scrollView];
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
