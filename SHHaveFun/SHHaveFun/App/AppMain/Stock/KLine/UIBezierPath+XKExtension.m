//
//  UIBezierPath+XKCategory.m
//  CashapLayerStockKit
//
//  Created by Futhure on 2017/6/15.
//  Copyright © 2017年 Macx. All rights reserved.
//

#import "UIBezierPath+XKExtension.h"

@implementation UIBezierPath (XKExtension)

- (void)xk_moveToPoint:(CGPoint)a addLineTo:(CGPoint)b
{
    [self moveToPoint:a];
    [self addLineToPoint:b];
}

/**
 生成描述一条线段的路径
 
 @param pointArr 线段坐标点数组
 @return 返回路径
 */
+ (UIBezierPath *)getBezierPathWithPointArr:(NSArray *)pointArr
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint firstPoint = [[pointArr firstObject] CGPointValue];
    [path moveToPoint:firstPoint];
    
    for (int idx = 1; idx < pointArr.count; idx++)
    {
        [path addLineToPoint:[pointArr[idx] CGPointValue]];
    }
    
    return path;
}

@end
