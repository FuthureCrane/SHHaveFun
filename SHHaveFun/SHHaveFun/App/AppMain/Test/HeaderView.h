//
//  HeaderView.h
//  loadSearch
//
//  Created by Futhure on 2017/11/22.
//  Copyright © 2017年 Futhure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView

// 当前大小
@property (nonatomic, assign) CGSize trueSize;

- (void)reloadWithData:(NSArray *)data;


/**
 头视图

 @param width 由宽度初始化
 @return 头视图
 */
- (instancetype)initWithWidth:(CGFloat)width;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;
@end
