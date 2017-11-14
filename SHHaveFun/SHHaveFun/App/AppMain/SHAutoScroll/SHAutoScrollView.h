//
//  SHAutoScrollView.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHAutoScrollCell.h"
@class SHAutoScrollView;
@protocol SHAutoScrollDelegate <NSObject>

@optional
/** 点击回调 */
- (void)cycleScrollView:(SHAutoScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
/** 滚动回调 */
- (void)cycleScrollView:(SHAutoScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index;

@end

@interface SHAutoScrollView : UIView

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<SHAutoScrollDelegate>)delegate;
/** 数据源 */
@property (nonatomic, strong) NSArray *titlesGroup;
/** 自动滚动间隔时间,默认2s */
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;
/** 是否无限循环,默认Yes */
@property (nonatomic,assign) BOOL infiniteLoop;
/** 是否自动滚动,默认Yes */
@property (nonatomic,assign) BOOL autoScroll;
/** 图片滚动方向，默认为水平滚动 */
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;
@property (nonatomic, weak) id<SHAutoScrollDelegate> delegate;
/** block方式监听点击 */
@property (nonatomic, copy) void (^clickItemOperationBlock)(NSInteger currentIndex);
/** block方式监听滚动 */
@property (nonatomic, copy) void (^itemDidScrollOperationBlock)(NSInteger currentIndex);
/** 解决viewWillAppear时出现时轮播图卡在一半的问题，在控制器viewWillAppear时调用此方法 */
- (void)adjustWhenControllerViewWillAppera;
/** 轮播文字label字体颜色 */
@property (nonatomic, strong) UIColor *titleLabelTextColor;
/** 轮播文字label字体大小 */
@property (nonatomic, strong) UIFont  *titleLabelTextFont;
/** 轮播文字label背景颜色 */
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;
/** 轮播文字label高度 */
@property (nonatomic, assign) CGFloat titleLabelHeight;
/** 轮播文字label对齐方式 */
@property (nonatomic, assign) NSTextAlignment titleLabelTextAlignment;

@end
