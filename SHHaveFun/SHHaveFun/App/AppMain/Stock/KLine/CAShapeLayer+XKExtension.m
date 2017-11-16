//
//  CAShapeLayer+XKExtension.m
//  CashapLayerStockKit
//
//  Created by Futhure on 2017/6/15.
//  Copyright © 2017年 Macx. All rights reserved.
//

#import "CAShapeLayer+XKExtension.h"
#import "XKCandlePointModel.h"
#import "UIBezierPath+XKExtension.h"

@implementation CAShapeLayer (XKExtension)

/**
 生成蜡烛Layer
 
 @param model 蜡烛坐标模型
 @return 返回layer
 */
+ (CAShapeLayer *)getCandleLayerWithPointModel:(XKCandlePointModel *)model
{
    //判断是否为涨跌
    BOOL isRed = model.oPoint.y >= model.cPoint.y ? YES : NO;
    
    //生成柱子的rect
    CGRect candleFrame = CGRectMake(isRed ? model.cPoint.x - 6 : model.oPoint.x-6,
                                    isRed ? model.cPoint.y : model.oPoint.y,
                                    12,
                                    ABS(model.oPoint.y - model.cPoint.y));
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:candleFrame];
    
    //绘制上下影线
    [path moveToPoint:model.lPoint];
    [path addLineToPoint:model.hPoint];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    //判断涨跌来设置颜色
    if (isRed)
    {
        //涨，设置红色
        layer.strokeColor = [UIColor redColor].CGColor;
        layer.fillColor = [UIColor redColor].CGColor;
        
    } else
    {
        //跌，设置绿色
        layer.strokeColor = [UIColor greenColor].CGColor;
        layer.fillColor = [UIColor greenColor].CGColor;
    }
    
    return layer;
}
/**
 生成蜡烛Layer
 
 @param model 蜡烛坐标模型
 @return 返回layer
 */
+ (CAShapeLayer *)getCandleLayerWithPointModel:(XKCandlePointModel *)model candleW:(double)candleW
{
    //判断是否为涨跌
    BOOL isRed = model.oPoint.y >= model.cPoint.y ? YES : NO;
    
    //生成柱子的rect
    CGRect candleFrame = CGRectMake(isRed ? model.cPoint.x - candleW/2 + 1 : model.oPoint.x - candleW/2 + 1,
                                    isRed ? model.cPoint.y : model.oPoint.y,
                                    candleW-2,
                                    ABS(model.oPoint.y - model.cPoint.y));
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:candleFrame];
    
    //绘制上下影线
    [path moveToPoint:model.lPoint];
    [path addLineToPoint:model.hPoint];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    //判断涨跌来设置颜色
    if (isRed)
    {
        //涨，设置红色
        layer.strokeColor = [UIColor redColor].CGColor;
        layer.fillColor = [UIColor redColor].CGColor;
        
    } else
    {
        //跌，设置绿色
        layer.strokeColor = [UIColor greenColor].CGColor;
        layer.fillColor = [UIColor greenColor].CGColor;
    }
    
    return layer;
}

/**
 生成OHLC
 
 @param model 蜡烛坐标模型
 @return 返回图层
 */
+ (CAShapeLayer *)getOHLCLayerWithPointModel:(XKCandlePointModel *)model
{
    //判断是否为涨跌
    BOOL isRed = model.oPoint.y >= model.cPoint.y ? YES : NO;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    //绘制上下影线
    [path moveToPoint:model.lPoint];
    [path addLineToPoint:model.hPoint];
    //开盘线
    [path moveToPoint:model.oPoint];
    [path addLineToPoint:CGPointMake(model.oPoint.x -6, model.oPoint.y)];
    //开盘线
    [path moveToPoint:model.cPoint];
    [path addLineToPoint:CGPointMake(model.cPoint.x +6, model.cPoint.y)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    //判断涨跌来设置颜色
    if (isRed)
    {
        //涨，设置红色
        layer.strokeColor = [UIColor redColor].CGColor;
    } else
    {
        //跌，设置绿色
        layer.strokeColor = [UIColor greenColor].CGColor;
    }
    layer.fillColor = [UIColor clearColor].CGColor;
    
    return layer;
}
/**
 生成OHLC
 
 @param model 蜡烛坐标模型
 @return 返回图层
 */
+ (CAShapeLayer *)getOHLCLayerWithPointModel:(XKCandlePointModel *)model candleW:(double)candleW
{
    //判断是否为涨跌
    BOOL isRed = model.oPoint.y >= model.cPoint.y ? YES : NO;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    //绘制上下影线
    [path moveToPoint:model.lPoint];
    [path addLineToPoint:model.hPoint];
    //开盘线
    [path moveToPoint:model.oPoint];
    [path addLineToPoint:CGPointMake(model.oPoint.x - candleW/2 + 1, model.oPoint.y)];
    //开盘线
    [path moveToPoint:model.cPoint];
    [path addLineToPoint:CGPointMake(model.cPoint.x + candleW/2 - 1, model.cPoint.y)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    //判断涨跌来设置颜色
    if (isRed)
    {
        //涨，设置红色
        layer.strokeColor = [UIColor redColor].CGColor;
    } else
    {
        //跌，设置绿色
        layer.strokeColor = [UIColor greenColor].CGColor;
    }
    layer.fillColor = [UIColor clearColor].CGColor;
    
    return layer;
}
/**
 生成单条线
 
 @param pointArr 坐标点数组
 @param lineColor 线颜色
 @return 返回线段图层
 */
+ (CAShapeLayer *)getSingleLineLayerWithPointArray:(NSArray *)pointArr
                                         lineColor:(UIColor *)lineColor
{
    UIBezierPath *path = [UIBezierPath getBezierPathWithPointArr:pointArr];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 1.f;
    layer.strokeColor = lineColor.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    
    return layer;
}


/**
 生成包含多条线的线段
 
 @param pointArr 坐标点数组
 @param lineColor 线颜色
 @return 返回线段图层
 */
+ (CAShapeLayer *)getMultipleLineLayerWithPointArray:(NSArray *)pointArr
                                           lineColor:(UIColor *)lineColor
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    for (int idxX=0; idxX<pointArr.count; idxX++)
    {
        NSArray *idxXArr = pointArr[idxX];
        
        [path moveToPoint:[[idxXArr firstObject] CGPointValue]];
        for (int idxY=1; idxY<idxXArr.count; idxY++)
        {
            [path addLineToPoint:[idxXArr[idxY] CGPointValue]];
        }
    }
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 1.f;
    layer.strokeColor = lineColor.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    
    return layer;
}

/**
 生成圆
 
 @param point 圆心坐标
 @param color 圆颜色
 @return 返回图层
 */
+ (CAShapeLayer *)getCircleLayerWithPoint:(CGPoint )point color:(UIColor *)color
{
    //直接用圆描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point
                                                        radius:3.f
                                                    startAngle:0.f
                                                      endAngle:(CGFloat)M_PI * 2
                                                     clockwise:true];
    //生成图层 并设置路径和属性
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = color.CGColor;
    layer.strokeColor = color.CGColor;
    
    return layer;
}

+ (CAShapeLayer *)getRectLayerWithRect:(CGRect)frameRect
                              dataRect:(CGRect)dataRect
                               dataStr:(NSString *)dataStr
                              fontSize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                             backColor:(UIColor *)backColor
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:frameRect];
    layer.path = path.CGPath;
    layer.strokeColor = textColor.CGColor;
    layer.fillColor = backColor.CGColor;
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = dataRect;
    textLayer.string = dataStr;
    textLayer.fontSize = fontSize;
    textLayer.foregroundColor = textColor.CGColor;
    textLayer.backgroundColor = [UIColor clearColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [layer addSublayer:textLayer];
    
    return layer;
    
}

@end
