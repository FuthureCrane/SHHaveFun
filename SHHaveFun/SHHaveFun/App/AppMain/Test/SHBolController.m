//
//  SHBolController.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/16.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHBolController.h"
#import "SHNerveView.h"

@interface SHBolController ()

@property (nonatomic, strong) SHNerveView *nerview;
@end

@implementation SHBolController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.nerview];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.nerview startRun];
}

- (SHNerveView *)nerview {
    if (!_nerview) {
        _nerview = [[SHNerveView alloc] initWithFrame:self.view.bounds];
    }
    return _nerview;
}

@end
