
#import <Foundation/Foundation.h>

@class XKKLineModel;
@interface XKOriginalModel : NSObject

@property (nonatomic, strong) NSArray <NSArray *>* Data;
@property (nonatomic, copy) NSString *Code;
@property (nonatomic, copy) NSString *Name;

+ (NSArray <XKKLineModel *>*)getKLineModelArr;

@end
