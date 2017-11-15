//
//  SHSolFormatter.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHSolFormatter.h"

@implementation SHSolFormatter

- (instancetype)init
{
    return [self initWithLandingDate:[NSDate dateWithTimeIntervalSinceNow:-31725960]];
}

- (instancetype)initWithLandingDate:(NSDate *)landingDate {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSInteger)solsFrom:(NSDate *)date {
    let martianDay = 1477 * 60; // 24h37m
    let seconds = [date timeIntervalSinceDate:self.landingDate];
    return lround(seconds / martianDay);
}


@end
