//
//  ViewController.m
//  kLineDemo
//
//  Created by nethanhan on 2017/5/23.
//  Copyright © 2017年 nethanhan. All rights reserved.
//

#import "KLineViewController.h"
#import "XKKLineView.h"
#import "XKOriginalModel.h"

@interface KLineViewController ()

@property (nonatomic, strong) XKKLineView *kLineView;

@end

@implementation KLineViewController

static float kLineGlobalOffset = 0.f;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _kLineView = [[XKKLineView alloc] initWithFrame:CGRectMake(14,
                                                             22,
                                                             CGRectGetWidth(self.view.frame)-28,
                                                             CGRectGetHeight(self.view.frame) - 22 - 14)];
    _kLineView.backgroundColor = [UIColor colorWithRed:235.f/255.f green:235.f/255.f blue:235.f/255.f alpha:0.3];
    
    [self.view addSubview:_kLineView];
    
    _kLineView.kLineModelArr = [XKOriginalModel getKLineModelArr];
    [self kLineViewAddGesture];
 
    [_kLineView drawWithMainType:KLineMainCandle];
}

- (void)kLineViewAddGesture
{
    //添加左右拖动手势
    UIPanGestureRecognizer *panG = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    [_kLineView addGestureRecognizer:panG];
    
    //添加长按手势
    UILongPressGestureRecognizer *longG = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(kLineLongGestureAction:)];
    longG.minimumPressDuration = 0.5f;
    longG.numberOfTouchesRequired = 1;
    [_kLineView addGestureRecognizer:longG];
}

/**
 K线响应长按手势
 
 @param longGesture 手势对象
 */
- (void)kLineLongGestureAction:(UILongPressGestureRecognizer *)longGesture
{
    if (longGesture.state == UIGestureRecognizerStateBegan || longGesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint point = [longGesture locationInView:_kLineView];
        
        float x = 0.f;
        if (point.x < 0.f)
        {
            x = 0.f;
        }else if (point.x > CGRectGetWidth(_kLineView.frame))
        {
            x = CGRectGetWidth(_kLineView.frame)-1;
        }else
        {
            x = point.x;
        }

        [_kLineView drawCrossViewWithX:x];
    }else
    {
        [_kLineView clearCrossViewLayer];
    }
}

/**
 响应拖动手势
 
 @param panGesture 手势对象
 */
- (void)panGestureAction:(UIPanGestureRecognizer *)panGesture
{
    CGPoint point = [panGesture translationInView:_kLineView];
    float offset =  point.x - kLineGlobalOffset;
    if (panGesture.state == UIGestureRecognizerStateChanged && ABS(offset) > 3)
    {
        if (offset > 0)
        {
            if (ABS(offset) > 20)
            {
                [_kLineView dragRightOffsetcount:5];
                
            } else if(ABS(offset) > 6)
            {
                [_kLineView dragRightOffsetcount:2];
                
            } else
            {
                [_kLineView dragRightOffsetcount:1];
            }
        }else
        {
            if (ABS(offset) > 20)
            {
                [_kLineView dragLeftOffsetcount:5];
                
            } else if(ABS(offset) > 6)
            {
                [_kLineView dragLeftOffsetcount:2];
                
            } else
            {
                [_kLineView dragLeftOffsetcount:1];
            }
        }
        kLineGlobalOffset = point.x;
    }
    
    if (panGesture.state == UIGestureRecognizerStateEnded ||
        panGesture.state == UIGestureRecognizerStateCancelled ||
        panGesture.state == UIGestureRecognizerStateFailed)
    {
        kLineGlobalOffset= 0.f;
    }
}

@end
