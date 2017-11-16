
#import "XKKLineModel.h"

@implementation XKKLineModel

+ (instancetype)kLineModelWithOpen:(float)open close:(float)close high:(float)high low:(float)low timeStamp:(long)timeStamp
{
    XKKLineModel *model = [[XKKLineModel alloc] init];
    model.open = open;
    model.close = close;
    model.high = high;
    model.low = low;
    model.timeStamp = timeStamp;
    
    return model;
}

@end
