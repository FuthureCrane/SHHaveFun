#import <Foundation/Foundation.h>

@interface XKKLineModel : NSObject

@property (nonatomic, assign) long timeStamp;
@property (nonatomic, assign) float open;
@property (nonatomic, assign) float close;
@property (nonatomic, assign) float high;
@property (nonatomic, assign) float low;

+ (instancetype)kLineModelWithOpen:(float)open close:(float)close high:(float)high low:(float)low timeStamp:(long)timeStamp;

@end
