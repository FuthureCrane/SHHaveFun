//
//  SHMarsLinkNavigationBar.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHMarsLinkNavigationBar : UINavigationBar

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) CAShapeLayer *statusIndicator;
@property (nonatomic, strong) CAShapeLayer *highLayer;

@property (nonatomic, assign) BOOL statusOn;

- (void)updateStatus;

@end
