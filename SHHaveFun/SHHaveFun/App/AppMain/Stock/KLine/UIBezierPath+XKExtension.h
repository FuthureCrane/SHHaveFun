//
//  UIBezierPath+XKCategory.h
//  CashapLayerStockKit
//
//  Created by Futhure on 2017/6/15.
//  Copyright © 2017年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (XKExtension)

- (void)xk_moveToPoint:(CGPoint)a addLineTo:(CGPoint)b;


/**
 生成描述一条线段的路径
 
 @param pointArr 线段坐标点数组
 @return 返回路径
 */
+ (UIBezierPath *)getBezierPathWithPointArr:(NSArray *)pointArr;
@end
