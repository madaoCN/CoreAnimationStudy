//
//  ViewController.m
//  CoreAnimation
//
//  Created by 梁宪松 on 2017/8/12.
//  Copyright © 2017年 梁宪松. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_dataSource;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CoreAnimation";
    
    _dataSource = @[
                    @[@"LayerTest"],
                    
                    @[@"Contents",
                      @"ContentsRect",
                      @"ContentsCenter",
                      ],
                    
                    @[@"CustomDrawing",
                      ],
                    
                    @[@"HitTesting"
                        ],
                    
                    @[@"ShadowPath",
                      @"MaskLayer",
                      @"StretchFilter",
                      @"GroupOpacity"
                      ],
                    
                    @[@"CombineAffineTransform",
                      @"ThreeDAffineTranform",
                      @"MirrorSight",
                      @"YAxisRecoverRoate",
                      @"SoildCube"
                      ],
                    
                    @[@"ShapeLayer",
                      @"RoundCornerLayer",
                      @"TextLayer",
                      @"LayerTextLabel",
                      @"RichTextLayer",
                      @"TransformLayer",
                      @"GradientLayer",
                      @"ReplicatorLayer",
                      @"Reflection",
                      @"ScrollLayer",
                      @"TiledLayer",
                      @"EmitterLayer",
                      @"EAGLLayer",
                      @"PlayerLayer"
                      ],
                    
                    @[@"Transaction",
                      @"AnimationDelegate",
                      @"KeyframeAnimation",
                      @"KeyframeAnimationWithPath",
                      ],
                    
                    @[@"AnimationGroup",
                      ],
                    
                    @[@"LayerRelationTime",
                      ],
                    
                    @[@"MediaTimingFunction",
                      @"KeyframeMediaTimingFunction"
                        ],
                    
                    ];
    [self.view addSubview:self.tableView];
}

#pragma mark - DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [_dataSource objectAtIndex:section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    NSArray *arr = [_dataSource objectAtIndex:indexPath.section];
    cell.textLabel.text = [arr objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *arr = [_dataSource objectAtIndex:indexPath.section];
    NSString *contollerString = [arr objectAtIndex:indexPath.row];
    UIViewController *controller = [[NSClassFromString(contollerString) alloc] init];
    controller.title = contollerString;
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Chapter%ld", section+1];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

#pragma mark - Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
