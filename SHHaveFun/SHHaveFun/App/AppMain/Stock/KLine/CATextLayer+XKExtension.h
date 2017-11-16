//
//  CATextLayer+XKExtension.h
//  CashapLayerStockKit
//
//  Created by Futhure on 2017/6/15.
//  Copyright © 2017年 Macx. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CATextLayer (XKExtension)

/**
 绘制文字
 
 @param text 字符串
 @param textColor 文字颜色
 @param bgColor 背景颜色
 @param frame 文字frame
 @return 返回textLayer
 */
+ (CATextLayer *)getTextLayerWithString:(NSString *)text
                              textColor:(UIColor *)textColor
                               fontSize:(NSInteger)fontSize
                        backgroundColor:(UIColor *)bgColor
                                  frame:(CGRect)frame;

+ (CAShapeLayer *)getRectLayerWithRect:(CGRect)frameRect
                              dataRect:(CGRect)dataRect
                               dataStr:(NSString *)dataStr
                              fontSize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                             backColor:(UIColor *)backColor;

@end
