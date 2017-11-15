//
//  T4LineViewController.m
//  VIKBuild
//
//  Created by Futhure on 2017/11/13.
//  Copyright © 2017年 Futhure. All rights reserved.
//

#import "T4LineViewController.h"
#import "HomeView.h"
@interface T4LineViewController ()

@property (nonatomic, strong) HomeView *hView;

@end

@implementation T4LineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.hView];
}

// 耗时的操作应在viewDidAppear中且应在子线程
- (void)viewDidAppear:(BOOL)animated {
    [self.hView fetchData];
}

- (HomeView *)hView {
    if (!_hView) {
        _hView = [[HomeView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _hView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
