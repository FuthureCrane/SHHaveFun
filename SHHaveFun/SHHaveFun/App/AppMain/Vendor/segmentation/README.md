# 这是什么
这是 Pin 里面使用的文本分词功能的代码，哦对了，完全是本地的，准确率有限

# 使用方法
```objc
#import "NSString+Extension.h"

NSArray<NSString *> *texts = [@"测试中文分词功能" segment:PINSegmentationOptionsNone];
[texts enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    NSLog(@"%@", obj);
}];
```
