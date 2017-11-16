//
//  ViewController.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/13.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "ViewController.h"
#import "SHAutoScrollController.h"
#import "CalendarViewController.h"
#import "VIKTransformViewController.h"
#import "T4LineViewController.h"

//NSString *const api1 = @"https://interface.meiriyiwen.com/article/today?dev=1";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    let manager = [AFHTTPSessionManager manager];
//
//    [manager GET:api1 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
//    SHAutoScrollController *sv = [[SHAutoScrollController alloc] init];
//    CalendarViewController *sv = [[CalendarViewController alloc] init];
//    let sv = [[VIKTransformViewController alloc] init];
    let sv = [[T4LineViewController alloc] init];
    [sv setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:sv animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
