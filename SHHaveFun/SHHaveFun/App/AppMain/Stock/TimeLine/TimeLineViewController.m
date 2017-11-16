//
//  ViewController.m
//  timeLineDemo
//
//  Created by nethanhan on 2017/5/18.
//  Copyright © 2017年 nethanhan. All rights reserved.
//

#import "TimeLineViewController.h"
#import "YKTimeChartView.h"
#import "YKOriginalModel.h"

@interface TimeLineViewController ()

@property (nonatomic, strong) YKTimeChartView *timeChartView;

@end

@implementation TimeLineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    double yc = 0.f;
    NSArray *arr = [YKOriginalModel getTimeChartModelArrAtYc:&yc];
    
    CGRect rect = CGRectMake(14, 22 + 64, CGRectGetWidth(self.view.frame)-28, 200);
    _timeChartView = [[YKTimeChartView alloc] initWithFrame:rect];
    _timeChartView.yc = yc;
    _timeChartView.timeCharModelArr = arr;
    
    [self.view addSubview:_timeChartView];
    
    
    [_timeChartView draw];
    
    //添加长按手势
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(timeChartLongGestureAction:)];
    longGesture.minimumPressDuration = 0.f;
    longGesture.numberOfTouchesRequired = 1;
    [_timeChartView addGestureRecognizer:longGesture];
    
}

- (void)timeChartLongGestureAction:(UILongPressGestureRecognizer *)longGesture
{
    if (longGesture.state == UIGestureRecognizerStateBegan || longGesture.state == UIGestureRecognizerStateChanged)
    {//第一次长按获取 或者 长按然后变化坐标点
        
        //获取坐标
        CGPoint point = [longGesture locationInView:_timeChartView];
        
        float x = 0.f;
        float y = 0.f;
        //判断临界情况
        if (point.x < 0)
        {
            x = 0.f;
        }else if (point.x > CGRectGetWidth(_timeChartView.frame))
        {
            x = CGRectGetWidth(_timeChartView.frame);
        }else
        {
            x = point.x;
        }
        if (point.y < 0)
        {
            y = 0.f;
        }else if (point.y > (CGRectGetHeight(_timeChartView.frame) - 20.f))
        {
            y = CGRectGetHeight(_timeChartView.frame) - 20.f;
        }else
        {
            y = point.y;
        }
        
        //开始绘制十字叉
        [_timeChartView drawTicksWithPoint:CGPointMake(x, y)];
        
    } else
    {//事件取消
        
        //当抬起头后，清理十字叉
        [_timeChartView clearTicks];
    }
}

@end
