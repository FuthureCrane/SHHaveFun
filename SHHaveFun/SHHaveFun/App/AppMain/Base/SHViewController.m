//
//  VIKViewController.m
//  VIKBuild
//
//  Created by Futhure on 2017/10/30.
//  Copyright © 2017年 Futhure. All rights reserved.
//

#import "SHViewController.h"

@interface SHViewController () <UIGestureRecognizerDelegate>

@end

@implementation SHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //是否需要打开侧滑手势代理
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count == 1 && self.navigationController.viewControllers.firstObject == self) {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
            self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        } else {
            if (nil == self.parentViewController || [self.parentViewController isKindOfClass:[UINavigationController class]]) {
                self.navigationController.interactivePopGestureRecognizer.enabled = YES;
                self.navigationController.interactivePopGestureRecognizer.delegate = self;
            }
        }
    }
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    if (parent == nil) {
        //拿到网络请求对象，调用cancel，不同的三方网络请求框架可能调用方法不一，具体怎么实施，自行思索
    }
}


@end
