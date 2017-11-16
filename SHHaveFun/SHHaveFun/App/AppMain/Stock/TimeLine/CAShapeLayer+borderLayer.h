//
//  CAShapeLayer+borderLayer.h
//  timeLineDemo
//
//  Created by nethanhan on 2017/5/20.
//  Copyright © 2017年 nethanhan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "YKCAShapeLayer.h"

@interface CAShapeLayer (borderLayer)

+ (YKCAShapeLayer *)getRectLayerWithRect:(CGRect)frameRect
                              dataRect:(CGRect)dataRect
                               dataStr:(NSString *)dataStr
                              fontSize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                             backColor:(UIColor *)backColor;

@end
