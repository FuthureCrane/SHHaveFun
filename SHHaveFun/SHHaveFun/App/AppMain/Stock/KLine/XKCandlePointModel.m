//
//  XKCandlePointModel.m
//  CashapLayerStockKit
//
//  Created by Futhure on 2017/6/15.
//  Copyright © 2017年 Macx. All rights reserved.
//

#import "XKCandlePointModel.h"

@implementation XKCandlePointModel

+ (instancetype)candlePointModelWithOpoint:(CGPoint)oPoint
                                            Hpoint:(CGPoint)hPoint
                                            Lpoint:(CGPoint)lPoint
                                            Cpoint:(CGPoint)cPoint
{
    XKCandlePointModel * model = [[XKCandlePointModel alloc] init];
    model.oPoint = oPoint;
    model.hPoint = hPoint;
    model.lPoint = lPoint;
    model.cPoint = cPoint;
    
    return model;
}
@end
