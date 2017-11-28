#import <UIKit/UIKit.h>
#import "VIKTransformView.h"

@interface VIKTransform : NSObject

/**
 偏移弹出

 @param vikView 蒙版
 @param navigationController 当前视图导航控制器
 @param distance 偏移距离
 */
+ (void)vikTransformOpen:(__kindof VIKTransformView *)vikView on:(__kindof UINavigationController *)navigationController animationDistance:(CGFloat)distance;

/**
 偏移回收

 @param vikView 蒙版
 @param navigationController 当前视图导航控制器
 @param dispose 回收处理
 */
+ (void)vikTransformClose:(__kindof VIKTransformView *)vikView on:(__kindof UINavigationController *)navigationController dispose:(void (^)(void))dispose;

@end
