//
//  SHWeather.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSNumber+IGListDiffable.h"
//case cloudy = "Cloudy"
//case sunny = "Sunny"
//case partlyCloudy = "Partly Cloudy"
//case dustStorm = "Dust Storm"
//var emoji: String {
//    switch self
//    case .cloudy: return "☁️"
//    case .sunny: return "☀️"
//    case .partlyCloudy: return "⛅️"
//    case .dustStorm: return "🌪"
//}
typedef NS_ENUM(NSInteger, SHWeatherCondition) {
    SHWeatherConditionCloudy = 0,
    SHWeatherConditionSunny,
    SHWeatherConditionPartlyCloudy,
    SHWeatherConditionDustStorm
};

@interface SHWeather : NSObject

@property (nonatomic, assign) NSInteger temperature;
@property (nonatomic, assign) NSInteger high;
@property (nonatomic, assign) NSInteger low;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) NSString *sunrise;
@property (nonatomic, copy) NSString *sunset;
@property (nonatomic, assign) SHWeatherCondition condition;

@property (nonatomic, copy) NSString *emoji;
@property (nonatomic, copy) NSString *weatherString;

- (instancetype)initWithTemperature:(NSInteger)temperature high:(NSInteger)high low:(NSInteger)low date:(NSDate *)date sunrise:(NSString *)sunrise sunset:(NSString *)sunset condition:(SHWeatherCondition)condition;
@end
