//
//  CAShapeLayer+borderLayer.m
//  timeLineDemo
//
//  Created by nethanhan on 2017/5/20.
//  Copyright © 2017年 nethanhan. All rights reserved.
//

#import "CAShapeLayer+borderLayer.h"

@implementation CAShapeLayer (borderLayer)

+ (YKCAShapeLayer *)getRectLayerWithRect:(CGRect)frameRect
                              dataRect:(CGRect)dataRect
                               dataStr:(NSString *)dataStr
                              fontSize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                             backColor:(UIColor *)backColor
{
    YKCAShapeLayer *layer = [YKCAShapeLayer layer];
    
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
