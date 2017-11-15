//
//  SHWeatherSummaryCell.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHWeatherSummaryCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *expandLabel;
@property (nonatomic, strong) UILabel *titleLabel;

- (void)setExpanded:(BOOL)expaned;
@end
