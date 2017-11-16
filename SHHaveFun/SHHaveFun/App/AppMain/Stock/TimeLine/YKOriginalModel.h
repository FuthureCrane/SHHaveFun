//
//  YKOriginalModel.h
//  timeLineDemo
//
//  Created by nethanhan on 2017/5/19.
//  Copyright © 2017年 nethanhan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YKTimeChartModel;

@interface YKOriginalModel : NSObject


/**
 昨日收盘价
 */
@property (nonatomic, assign) double yClosePrice;

/**
 数据数组
 */
@property (nonatomic, strong) NSArray <NSArray *> *timeChartData;

/**
 获取分时线模型
 
 @param yc 获取昨日收盘价
 @return 返回分时线模型
 */
+ (NSArray <YKTimeChartModel *>*)getTimeChartModelArrAtYc:(double *)yc;

@end
