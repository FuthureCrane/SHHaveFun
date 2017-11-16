//
//  kLineView.m
//  kLineDemo
//
//  Created by nethanhan on 2017/5/23.
//  Copyright © 2017年 nethanhan. All rights reserved.
//

#import "XKKLineView.h"
#import "XKCandlePointModel.h"
#import "XKKLineModel.h"
#import "CAShapeLayer+XKExtension.h"

@interface XKKLineView ()


/**主图rect*/
@property (nonatomic, assign) CGRect mainRect;
/**副图rect*/
@property (nonatomic, assign) CGRect accessoryRect;
/**主图指标rect*/
@property (nonatomic, assign) CGRect mainIndexRect;
/**副图指标rect*/
@property (nonatomic, assign) CGRect accessoryIndexRect;

/**蜡烛图层*/
@property (nonatomic, strong) CAShapeLayer *candleLayer;
/**OHLC图层*/
@property (nonatomic, strong) CAShapeLayer *ohlcLayer;
/**左侧价格图层*/
@property (nonatomic, strong) CAShapeLayer *leftPriceLayer;
/**底部日期图层*/
@property (nonatomic, strong) CAShapeLayer *bottomDateLayer;
/**长按十字叉图层*/
@property (nonatomic, strong) CAShapeLayer *crossViewLayer;

/**最大值*/
@property (nonatomic, assign) float max;
/**最小值*/
@property (nonatomic, assign) float min;
/**开始索引*/
@property (nonatomic, assign) int startIndex;
/**结束索引*/
@property (nonatomic, assign) int endIndex;

/**当前主图显示的数据的坐标*/
@property (nonatomic, strong) NSMutableArray *displayPointArr;
/**当前主图类型*/
@property (nonatomic, assign) KLineMainType currentMainType;

@end

@implementation XKKLineView

//主图所占比例
static float mainFrameScale = 0.7;
//主图指标高
static float mainIndexH = 30;
//副图指标高
static float accessoryIndexH = 30;
//主图底部日期高
static float dateH = 20;
//当前一屏显示的K线数量
static int candleCount = 60;


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self drawBorder];
    }
    
    return self;
}

- (void)setKLineModelArr:(NSArray *)kLineModelArr
{
    _kLineModelArr = kLineModelArr;
    //设置起始索引
    _startIndex = (int)kLineModelArr.count - candleCount-1;
    _endIndex = (int)kLineModelArr.count;
}


/**
 绘制k线

 @param mainType 主图类型
 */
- (void)drawWithMainType:(KLineMainType)mainType
{
    //保存主图类型
    _currentMainType = mainType;
    
    //求出最大最小值
    _min = (float)INT32_MAX;
    _max = (float)INT32_MIN;
    for (int idx=_startIndex; idx<_endIndex; idx++)
    {
        XKKLineModel *model = self.kLineModelArr[idx];
        if (_min > model.low)
        {
            _min = model.low;
        }
        if (_max < model.high)
        {
            _max = model.high;
        }
    }
    float unitValue = (_max - _min) / CGRectGetHeight(_mainRect);
    //转换主图开高收低的坐标点
    [self coverCandlePointWithUnitValue:unitValue];
    switch (mainType)
    {
        case KLineMainCandle:
        {
            //绘制蜡烛
            [self drawCandleWithPointModelArr:self.displayPointArr];
        }
            break;
        case KLineMainOHLC:
        {
            //绘制OHLC
            [self drawOHLCWithPointModelArr:self.displayPointArr];
        }
            break;
        default:
            break;
    }
    //绘制左侧价格
    [self drawLeftValue];
    //绘制底部日期
    [self drawBottomDateValue];
}

/**
 绘制左侧价格
 */
- (void)drawLeftValue
{
    float unitPrice = (_max - _min) / 4.f;
    float unitH = CGRectGetHeight(_mainRect) / 4.f;
    
    //求得价格rect
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:9.f]};
    CGRect priceRect = [self rectOfNSString:[NSString stringWithFormat:@"%.2f", _max] attribute:attribute];
    
    for (int idx = 0; idx < 5; idx++)
    {
        float height = 0.f;
        if (idx == 4)
        {
            height = idx * unitH - CGRectGetHeight(priceRect);
        } else
        {
            height = idx * unitH;
        }
        CGRect rect = CGRectMake(CGRectGetMinX(_mainRect),
                                 CGRectGetMinY(_mainRect) + height,
                                 CGRectGetWidth(priceRect),
                                 CGRectGetHeight(priceRect));
        //计算价格
        NSString *str = [NSString stringWithFormat:@"%.2f", _max - idx * unitPrice];
        CATextLayer *layer = [CATextLayer getTextLayerWithString:str
                                                       textColor:[UIColor blackColor]
                                                        fontSize:9.f
                                                 backgroundColor:[UIColor clearColor]
                                                           frame:rect];
        
        [self.leftPriceLayer addSublayer:layer];
    }
    
    [self.layer addSublayer:self.leftPriceLayer];
}

/**
 绘制日期
 */
- (void)drawBottomDateValue
{
    NSMutableArray *kLineDateArr = [NSMutableArray array];
    
    int unitCount = candleCount / 4;
    for (int idx=0; idx<5; idx++)
    {
        XKKLineModel *model = self.kLineModelArr[_startIndex + idx * unitCount];
        
        NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:model.timeStamp];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        NSString *dateStr = [dateFormatter stringFromDate:detaildate];
        
        [kLineDateArr addObject:dateStr];
    }
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:9.f]};
    CGRect strRect = [self rectOfNSString:@"0000-00-00" attribute:attribute];
    float strW = CGRectGetWidth(strRect);
    float strH = CGRectGetHeight(strRect);
    
    float unitW = CGRectGetWidth(_mainRect) / 4;
    
    //循环绘制坐标点
    for (int idx = 0; idx < kLineDateArr.count; idx++)
    {
        CATextLayer *textLayer = nil;
        
        if (idx == kLineDateArr.count-1)
        {//最后一个
            CGRect rect = CGRectMake(idx * unitW - strW, CGRectGetMaxY(_mainRect), strW, strH);
            textLayer = [CATextLayer getTextLayerWithString:kLineDateArr[idx] textColor:[UIColor blackColor] fontSize:9.f backgroundColor:[UIColor clearColor] frame:rect];
        }else if(idx == 0)
        {//第一个
            CGRect rect = CGRectMake(idx * unitW, CGRectGetMaxY(_mainRect), strW, strH);
            textLayer = [CATextLayer getTextLayerWithString:kLineDateArr[idx] textColor:[UIColor blackColor] fontSize:9.f backgroundColor:[UIColor clearColor] frame:rect];
        }else
        {//中间
            CGRect rect = CGRectMake(idx * unitW - strW/2, CGRectGetMaxY(_mainRect), strW, strH);
            textLayer = [CATextLayer getTextLayerWithString:kLineDateArr[idx] textColor:[UIColor blackColor] fontSize:9.f backgroundColor:[UIColor clearColor] frame:rect];
        }
        
        [self.bottomDateLayer addSublayer:textLayer];
    }
    
    [self.layer addSublayer:self.bottomDateLayer];
}

/**
 绘制OHLC线

 @param pointModelArr 坐标点模型数组
 */
- (void)drawOHLCWithPointModelArr:(NSArray *)pointModelArr
{
    float candleW = CGRectGetWidth(_mainRect) / candleCount;
    
    for (int idx = 0; idx< candleCount; idx++)
    {
        XKCandlePointModel *model = pointModelArr[idx];
        CAShapeLayer *layer = [CAShapeLayer getOHLCLayerWithPointModel:model candleW:candleW];
        
        [self.ohlcLayer addSublayer:layer];
    }
    
    [self.layer addSublayer:self.ohlcLayer];
}

/**
 绘制蜡烛线

 @param pointModelArr 坐标点模型数组
 */
- (void)drawCandleWithPointModelArr:(NSArray *)pointModelArr
{
    
    float candleW = CGRectGetWidth(_mainRect) / candleCount;
    
    for (int idx = 0; idx< candleCount; idx++)
    {
        XKCandlePointModel *model = pointModelArr[idx];
        CAShapeLayer *layer = [CAShapeLayer getCandleLayerWithPointModel:model candleW:candleW];
        
        [self.candleLayer addSublayer:layer];
    }
    
    [self.layer addSublayer:self.candleLayer];
}

/**
 转换蜡烛图坐标点

 @param unitValue 单位值
 */
- (void)coverCandlePointWithUnitValue:(float)unitValue
{
    [self.displayPointArr removeAllObjects];
    
    float candleW = CGRectGetWidth(_mainRect) / candleCount;

    for (int idx = _startIndex; idx<_endIndex; idx++)
    {
        XKKLineModel *model = self.kLineModelArr[idx];
        float x = CGRectGetMinX(_mainRect) + candleW * (idx - (_startIndex - 0));
        
        CGPoint hPoint = CGPointMake(x + candleW/2,
                                     ABS(CGRectGetMaxY(_mainRect) - (model.high  - _min)/unitValue));
        CGPoint lPoint = CGPointMake(x + candleW/2,
                                     ABS(CGRectGetMaxY(_mainRect) - (model.low   - _min)/unitValue));
        CGPoint oPoint = CGPointMake(x + candleW/2,
                                     ABS(CGRectGetMaxY(_mainRect) - (model.open  - _min)/unitValue));
        CGPoint cPoint = CGPointMake(x + candleW/2,
                                     ABS(CGRectGetMaxY(_mainRect) - (model.close - _min)/unitValue));
        [_displayPointArr addObject:[XKCandlePointModel candlePointModelWithOpoint:oPoint
                                                                            Hpoint:hPoint
                                                                            Lpoint:lPoint
                                                                            Cpoint:cPoint]];
    }
}

/**
 清理图层
 */
- (void)clearLayer
{
    [self.ohlcLayer removeFromSuperlayer];
    self.ohlcLayer = nil;
    
    [self.candleLayer removeFromSuperlayer];
    self.candleLayer = nil;
    
    [self.leftPriceLayer removeFromSuperlayer];
    self.leftPriceLayer = nil;
    
    [self.bottomDateLayer removeFromSuperlayer];
    self.bottomDateLayer = nil;
}

- (void)drawCrossViewWithX:(float)x
{
    [self clearCrossViewLayer];
    
    //根据坐标计算索引
    float unitW = CGRectGetWidth(_mainRect) / candleCount;
    int index = (int)(x / unitW);
    if (index >= self.kLineModelArr.count)
    {
        index = (int)self.kLineModelArr.count - 1;
    }
    XKKLineModel *model = self.kLineModelArr[index + _startIndex];
    XKCandlePointModel *pointModel = self.displayPointArr[index];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //竖线
    [path moveToPoint:CGPointMake(pointModel.cPoint.x, CGRectGetMinY(_mainRect))];
    [path addLineToPoint:CGPointMake(pointModel.cPoint.x, CGRectGetMaxY(_mainRect))];
    
    //横线
    [path moveToPoint:CGPointMake(CGRectGetMinX(_mainRect), pointModel.cPoint.y)];
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(_mainRect), pointModel.cPoint.y)];
    //设置横竖线的属性
    self.crossViewLayer.path = path.CGPath;
    self.crossViewLayer.lineWidth = 1.f;
    self.crossViewLayer.strokeColor = [UIColor blackColor].CGColor;
    self.crossViewLayer.fillColor = [UIColor clearColor].CGColor;
    //取出数据模型
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:9.f]};
    //计算各种rect
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:model.timeStamp];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *timeStr = [dateFormatter stringFromDate:detaildate];
    NSString *priceStr = [NSString stringWithFormat:@"%.2f", model.close];
    CGRect timeStrRect = [self rectOfNSString:timeStr attribute:attribute];
    CGRect priceStrRect = [self rectOfNSString:priceStr attribute:attribute];
    
    CGRect maskTimeRect = CGRectMake(pointModel.cPoint.x - CGRectGetWidth(timeStrRect)/2-5.f,
                                     CGRectGetMaxY(_mainRect),
                                     CGRectGetWidth(timeStrRect)+10.f,
                                     CGRectGetHeight(timeStrRect) + 5.f);
    CGRect maskPriceRect = CGRectMake(CGRectGetMinX(_mainRect),
                                      pointModel.cPoint.y - CGRectGetHeight(priceStrRect)/2-2.5f,
                                      CGRectGetWidth(priceStrRect)+10.f,
                                      CGRectGetHeight(priceStrRect)+5.f);
    
    CGRect timeRect = CGRectMake(CGRectGetMinX(maskTimeRect)+5.f, CGRectGetMinY(maskTimeRect)+2.5f, CGRectGetWidth(timeStrRect), CGRectGetHeight(timeStrRect));
    CGRect priceRect = CGRectMake(CGRectGetMinX(maskPriceRect)+5.f, CGRectGetMinY(maskPriceRect)+2.5f, CGRectGetWidth(priceStrRect), CGRectGetHeight(priceStrRect));
    //生成时间方块图层
    CAShapeLayer *timeLayer = [CAShapeLayer getRectLayerWithRect:maskTimeRect dataRect:timeRect dataStr:timeStr fontSize:9.f textColor:[UIColor whiteColor] backColor:[UIColor blackColor]];
    //生成价格方块图层
    CAShapeLayer *priceLayer = [CAShapeLayer getRectLayerWithRect:maskPriceRect dataRect:priceRect dataStr:priceStr fontSize:9.f textColor:[UIColor whiteColor] backColor:[UIColor blackColor]];

    //把3个图层全部添加到十字叉图层中
    [self.crossViewLayer addSublayer:timeLayer];
    [self.crossViewLayer addSublayer:priceLayer];

    //再添加到分时图view的图层中
    [self.layer addSublayer:self.crossViewLayer];
}

/**
 清理十字叉图层
 */
- (void)clearCrossViewLayer
{
    [self.crossViewLayer removeFromSuperlayer];
    self.crossViewLayer = nil;
}

/**
 向右拖拽

 @param offsetcount 拖拽的偏移量
 */
- (void)dragRightOffsetcount:(int)offsetcount
{
    if (_startIndex - offsetcount < 0)
    {
        return;
    }
    [self clearLayer];
    _startIndex -= offsetcount;
    _endIndex -= offsetcount;
    
    [self drawWithMainType:self.currentMainType];
}

/**
 向左拖拽

 @param offsetcount 拖拽的偏移量
 */
- (void)dragLeftOffsetcount:(int)offsetcount
{
    if (_endIndex + offsetcount > self.kLineModelArr.count)
    {
        return;
    }
    [self clearLayer];
    _startIndex += offsetcount;
    _endIndex += offsetcount;
    
    [self drawWithMainType:self.currentMainType];
}

/**
 绘制边框
 */
- (void)drawBorder
{
    //设置主图、主图指标、副图、副图指标rect
    _mainIndexRect = CGRectMake(0, 0, CGRectGetWidth(self.frame), mainIndexH);
    _mainRect = CGRectMake(0, mainIndexH, CGRectGetWidth(self.frame), (CGRectGetHeight(self.frame) - (mainIndexH + accessoryIndexH + dateH)) * mainFrameScale);
    _accessoryIndexRect = CGRectMake(0, mainIndexH + CGRectGetHeight(_mainRect)+dateH, CGRectGetWidth(self.frame), accessoryIndexH);
    _accessoryRect = CGRectMake(0, mainIndexH + CGRectGetHeight(_mainRect)+dateH+accessoryIndexH, CGRectGetWidth(self.frame), (CGRectGetHeight(self.frame) - (mainIndexH + accessoryIndexH + dateH)) * (1-mainFrameScale));
    
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    
    [path moveToPoint:CGPointMake(0, mainIndexH)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), mainIndexH)];
    
    [path moveToPoint:CGPointMake(0, CGRectGetMaxY(_mainRect))];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetMaxY(_mainRect))];
    
    [path moveToPoint:CGPointMake(0, CGRectGetMinY(_accessoryIndexRect))];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetMinY(_accessoryIndexRect))];
    
    [path moveToPoint:CGPointMake(0, CGRectGetMinY(_accessoryRect))];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetMinY(_accessoryRect))];
    
    float mainUnitH = CGRectGetHeight(_mainRect) / 4.f;
    float mainUnitW = CGRectGetWidth(_mainRect) / 4.f;
    
    for (int idx = 1; idx <= 3; idx++)
    {
        //画3条横线
        [path moveToPoint:CGPointMake(0, mainIndexH + mainUnitH * idx)];
        [path addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), mainIndexH + mainUnitH * idx)];
        
        //画3条竖线
        [path moveToPoint:CGPointMake(idx * mainUnitW, mainIndexH)];
        [path addLineToPoint:CGPointMake(idx * mainUnitW, CGRectGetMaxY(_mainRect))];
        
        //画3条竖线
        [path moveToPoint:CGPointMake(idx * mainUnitW, CGRectGetMinY(_accessoryRect))];
        [path addLineToPoint:CGPointMake(idx * mainUnitW, CGRectGetMaxY(_accessoryRect))];
    }

    float accessoryUnitH = CGRectGetHeight(_accessoryRect) / 2.f;
    [path moveToPoint:CGPointMake(0, CGRectGetMaxY(_accessoryRect) - accessoryUnitH)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetMaxY(_accessoryRect) - accessoryUnitH)];
    
    borderLayer.path = path.CGPath;
    borderLayer.lineWidth = 0.5f;
    borderLayer.strokeColor = [UIColor colorWithRed:222.f/255.f green:222.f/255.f blue:222.f/255.f alpha:1.f].CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    
    [self.layer addSublayer:borderLayer];
    
}

/**
 工具类:根据字符串和富文本属性来生成rect
 
 @param string 字符串
 @param attribute 富文本属性
 @return 返回生成的rect
 */
- (CGRect)rectOfNSString:(NSString *)string attribute:(NSDictionary *)attribute
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 0)
                                       options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                    attributes:attribute
                                       context:nil];
    return rect;
}

#pragma mark - lazy

- (CAShapeLayer *)candleLayer
{
    if (!_candleLayer)
    {
        _candleLayer = [CAShapeLayer layer];
    }
    
    return _candleLayer;
}

- (CAShapeLayer *)ohlcLayer
{
    if (!_ohlcLayer)
    {
        _ohlcLayer = [CAShapeLayer layer];
    }
    
    return _ohlcLayer;
}

- (CAShapeLayer *)leftPriceLayer
{
    if (!_leftPriceLayer)
    {
        _leftPriceLayer = [CAShapeLayer layer];
    }
    
    return _leftPriceLayer;
}

- (CAShapeLayer *)bottomDateLayer
{
    if (!_bottomDateLayer)
    {
        _bottomDateLayer = [CAShapeLayer layer];
    }
    
    return _bottomDateLayer;
}

- (CAShapeLayer *)crossViewLayer
{
    if (!_crossViewLayer)
    {
        _crossViewLayer = [CAShapeLayer layer];
    }
    
    return _crossViewLayer;
}

- (NSMutableArray *)displayPointArr
{
    if (!_displayPointArr)
    {
        _displayPointArr = [NSMutableArray array];
    }
    
    return _displayPointArr;
}

@end
