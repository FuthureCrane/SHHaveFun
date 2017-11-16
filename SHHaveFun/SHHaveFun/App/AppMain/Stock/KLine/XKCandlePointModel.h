//
//  XKCandlePointModel.h
//  CashapLayerStockKit
//
//  Created by Futhure on 2017/6/15.
//  Copyright © 2017年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XKCandlePointModel : NSObject

@property (nonatomic, assign) CGPoint oPoint;
@property (nonatomic, assign) CGPoint hPoint;
@property (nonatomic, assign) CGPoint lPoint;
@property (nonatomic, assign) CGPoint cPoint;

+ (instancetype)candlePointModelWithOpoint:(CGPoint)oPoint
                                            Hpoint:(CGPoint)hPoint
                                            Lpoint:(CGPoint)lPoint
                                            Cpoint:(CGPoint)cPoint;
@end
