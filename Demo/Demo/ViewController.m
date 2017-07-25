//
//  ViewController.m
//  Demo
//
//  Created by zhangming on 17/7/25.
//  Copyright © 2017年 youjiesi. All rights reserved.
//

#import "ViewController.h"
#import "SMPagerTabView.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController ()<SMPagerTabViewDelegate>

@property (nonatomic, strong) NSMutableArray *allVC;
@property (nonatomic, strong) SMPagerTabView *segmentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _allVC = [NSMutableArray array];
    ViewController1 *one = [[ViewController1 alloc]initWithNibName:nil bundle:nil];
    one.title = @"我的";
    [_allVC addObject:one];
    
    ViewController2 *two = [[ViewController2 alloc]initWithNibName:nil bundle:nil];
    two.title = @"已阅";
    [_allVC addObject:two];
    
    ViewController3 *three = [[ViewController3 alloc]initWithNibName:nil bundle:nil];
    three.title = @"文章";
    [_allVC addObject:three];
    
    self.segmentView.delegate = self;
    //可自定义背景色和tab button的文字颜色等
    //开始构建UI
    [_segmentView buildUI];
    //起始选择一个tab
    [_segmentView selectTabWithIndex:1 animate:NO];
    //显示红点，点击消失
    [_segmentView showRedDotWithIndex:0];
}

#pragma mark - DBPagerTabView Delegate
- (NSUInteger)numberOfPagers:(SMPagerTabView *)view {
    return [_allVC count];
}
- (UIViewController *)pagerViewOfPagers:(SMPagerTabView *)view indexOfPagers:(NSUInteger)number {
    return _allVC[number];
}

- (void)whenSelectOnPager:(NSUInteger)number {
    NSLog(@"页面 %lu",(unsigned long)number);
}

#pragma mark - setter/getter
- (SMPagerTabView *)segmentView {
    if (!_segmentView) {
        self.segmentView = [[SMPagerTabView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64)];
        [self.view addSubview:_segmentView];
    }
    return _segmentView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
