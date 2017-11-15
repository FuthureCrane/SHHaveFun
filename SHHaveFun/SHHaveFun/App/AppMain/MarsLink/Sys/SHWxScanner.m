//
//  SHWxScanner.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHWxScanner.h"

@implementation SHWxScanner

- (SHWeather *)currentWeather {
    if (!_currentWeather) {
        _currentWeather = [[SHWeather alloc] initWithTemperature:6 high:13 low:-69 date:[NSDate date] sunrise:@"05:42" sunset:@"17:58" condition:SHWeatherConditionDustStorm];
    }
    return _currentWeather;
}

@end
