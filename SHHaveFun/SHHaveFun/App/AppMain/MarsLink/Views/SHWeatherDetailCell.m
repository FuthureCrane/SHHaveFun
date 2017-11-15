//
//  SHWeatherDetailCell.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHWeatherDetailCell.h"
#import "SHMarsLink.h"
#import "UIColor+MarsLink.h"
#import "SHDetailViewModel.h"

@interface SHWeatherDetailCell () <IGListBindable>

@end

@implementation SHWeatherDetailCell

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.numberOfLines = 0;
        _detailLabel.backgroundColor = UIColor.clearColor;
        _detailLabel.font = MARSAppFont(14);
        _detailLabel.textColor = [UIColor colorWithHex:0x42c84b];
        _detailLabel.textAlignment = NSTextAlignmentRight;
    }
    return _detailLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = UIColor.clearColor;
        _titleLabel.font = MARSAppFont(14);
        _titleLabel.textColor = [UIColor colorWithHex:0x42c84b];
    }
    return _titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithHex:0x0c1f3f];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.detailLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect fr = UIEdgeInsetsInsetRect(self.bounds, CommonInsets);
    self.titleLabel.frame = fr;
    self.detailLabel.frame = fr;
}

- (void)bindViewModel:(id)viewModel {
    if ([viewModel isKindOfClass:[SHDetailViewModel class]]) {
        let v = (SHDetailViewModel *)viewModel;
        self.titleLabel.text = v.title;
        self.detailLabel.text = v.detail;
    }
}

@end
