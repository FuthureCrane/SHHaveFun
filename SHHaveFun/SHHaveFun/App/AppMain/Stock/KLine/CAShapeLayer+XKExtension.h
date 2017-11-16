//
//  CAShapeLayer+XKExtension.h
//  CashapLayerStockKit
//
//  Created by Futhure on 2017/6/15.
//  Copyright © 2017年 Macx. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@class XKCandlePointModel;
@interface CAShapeLayer (XKExtension)

+ (CAShapeLayer *)getCandleLayerWithPointModel:(XKCandlePointModel *)model;


/**
 生成OHLC
 
 @param model 蜡烛坐标模型
 @return 返回图层
 */
+ (CAShapeLayer *)getOHLCLayerWithPointModel:(XKCandlePointModel *)model;
/**
 生成OHLC
 
 @param model 蜡烛坐标模型
 @return 返回图层
 */
+ (CAShapeLayer *)getOHLCLayerWithPointModel:(XKCandlePointModel *)model candleW:(double)candleW;

+ (CAShapeLayer *)getCandleLayerWithPointModel:(XKCandlePointModel *)model candleW:(double)candleW;

/**
 生成单条线
 
 @param pointArr 坐标点数组
 @param lineColor 线颜色
 @return 返回线段图层
 */
+ (CAShapeLayer *)getSingleLineLayerWithPointArray:(NSArray *)pointArr
                                         lineColor:(UIColor *)lineColor;

/**
 生成包含多条线的线段
 
 @param pointArr 坐标点数组
 @param lineColor 线颜色
 @return 返回线段图层
 */
+ (CAShapeLayer *)getMultipleLineLayerWithPointArray:(NSArray *)pointArr
                                           lineColor:(UIColor *)lineColor;

/**
 生成圆
 
 @param point 圆心坐标
 @param color 圆颜色
 @return 返回图层
 */
+ (CAShapeLayer *)getCircleLayerWithPoint:(CGPoint )point color:(UIColor *)color;

+ (CAShapeLayer *)getRectLayerWithRect:(CGRect)frameRect
                              dataRect:(CGRect)dataRect
                               dataStr:(NSString *)dataStr
                              fontSize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                             backColor:(UIColor *)backColor;

@end
