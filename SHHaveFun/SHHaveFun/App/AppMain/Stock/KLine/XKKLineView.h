//
//  kLineView.h
//  kLineDemo
//
//  Created by nethanhan on 2017/5/23.
//  Copyright © 2017年 nethanhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XKKLineModel.h"
#import "CATextLayer+XKExtension.h"
#import "CAShapeLayer+XKExtension.h"


/**
 k线主图类型

 - KLineMainCandle: 蜡烛
 - KLineMainOHLC: OHLC
 */
typedef NS_ENUM(NSUInteger, KLineMainType) {
    KLineMainCandle = 1000,
    KLineMainOHLC,
};

@interface XKKLineView : UIView


/**
 k线数据模型
 */
@property (nonatomic, strong) NSArray *kLineModelArr;


/**
 绘制K线

 @param mainType 主图类型
 */
- (void)drawWithMainType:(KLineMainType)mainType;

/**
 向右拖拽
 
 @param offsetcount 拖拽的偏移量
 */
- (void)dragRightOffsetcount:(int)offsetcount;

/**
 向左拖拽
 
 @param offsetcount 拖拽的偏移量
 */
- (void)dragLeftOffsetcount:(int)offsetcount;

- (void)drawCrossViewWithX:(float)x;

- (void)clearCrossViewLayer;


@end
