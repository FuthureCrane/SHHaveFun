//
//  SHUser.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHUser.h"

@implementation SHUser

- (instancetype)initWithId:(NSInteger)id name:(NSString *)name {
    self = [super init];
    if (self) {
        self.id = id;
        self.name = name;
    }
    return self;
}

@end
