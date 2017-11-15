//
//  SHDetailViewModel.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/15.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHDetailViewModel.h"

@implementation SHDetailViewModel

- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail {
    self = [super init];
    if (self) {
        self.title = title;
        self.detail = detail;
    }
    return self;
}

@end
