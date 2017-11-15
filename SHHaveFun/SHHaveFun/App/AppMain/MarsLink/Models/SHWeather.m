//
//  SHWeather.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHWeather.h"

@implementation SHWeather

- (instancetype)initWithTemperature:(NSInteger)temperature high:(NSInteger)high low:(NSInteger)low date:(NSDate *)date sunrise:(NSString *)sunrise sunset:(NSString *)sunset condition:(SHWeatherCondition)condition {
    self = [super init];
    if (self) {
        self.temperature = temperature;
        self.high = high;
        self.low = low;
        self.date = date;
        self.sunrise = sunrise;
        self.sunset = sunset;
        self.condition = condition;
    }
    return self;
}

- (void)setCondition:(SHWeatherCondition)condition {
    _condition = condition;
    switch (condition) {
        case SHWeatherConditionCloudy:
        {
            self.weatherString = @"Cloudy";
            self.emoji = @"☁️";
        }
            break;
            
        case SHWeatherConditionSunny:
        {
            self.weatherString = @"Sunny";
            self.emoji = @"☀️";
        }
            break;
            
        case SHWeatherConditionPartlyCloudy:
        {
            self.weatherString = @"Partly Cloudy";
            self.emoji = @"⛅️";
        }
            break;
            
        case SHWeatherConditionDustStorm:
        {
            self.weatherString = @"Dust Storm";
            self.emoji = @"☀️";
        }
            break;
            
        default:
        {
            self.weatherString = @"";
            self.emoji = @"";
        }
            break;
    }
}

@end
