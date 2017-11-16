
#import "XKOriginalModel.h"
#import "YYModel.h"
#import "XKKLineModel.h"


@implementation XKOriginalModel

+ (NSArray <XKKLineModel *>*)getKLineModelArr
{
    XKOriginalModel *model = [XKOriginalModel yy_modelWithJSON:[XKOriginalModel getJsonFromFile:@"kLine"]];
    
    NSMutableArray *kLineArr = [NSMutableArray array];
    for (int idx=(int)model.Data.count-1; idx>=0; idx--)
    {
        NSArray *idxArr = model.Data[idx];
        [kLineArr addObject:[XKKLineModel kLineModelWithOpen:[idxArr[1] doubleValue]
                                                       close:[idxArr[4] doubleValue]
                                                        high:[idxArr[2] doubleValue]
                                                         low:[idxArr[3] doubleValue]
                                                   timeStamp:[idxArr[0] longValue]]];
    }
    
    return kLineArr;
}

+ (NSString *)getJsonFromFile:(NSString *)fileName
{
    NSString *pathForJsonFile = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSString *jsonStr = [NSString stringWithContentsOfFile:pathForJsonFile encoding:NSUTF8StringEncoding error:nil];
    return jsonStr;
}

+ (NSArray <XKKLineModel *>*)getKLineModelWithOriginalModel:(XKOriginalModel *)orighinalModel
{
    return nil;
}

@end
