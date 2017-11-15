//
//  SHWeatherSummaryCell.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHWeatherSummaryCell.h"
#import "SHMarsLink.h"
#import "UIColor+MarsLink.h"
#import "SHSummaryViewModel.h"

@interface SHWeatherSummaryCell () <IGListBindable>

@end

@implementation SHWeatherSummaryCell

- (UILabel *)expandLabel {
    if (!_expandLabel) {
        _expandLabel = [[UILabel alloc] init];
        _expandLabel.backgroundColor = UIColor.clearColor;
        _expandLabel.font = MARSAppFont(30);
        _expandLabel.textColor = [UIColor colorWithHex:0x44758b];
        _expandLabel.textAlignment = NSTextAlignmentCenter;
        _expandLabel.text = @">>";
        [_expandLabel sizeToFit];
    }
    return _expandLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = UIColor.clearColor;
        
        let paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.paragraphSpacing = 4;
        let subtitleAttributes = @{
                                   NSFontAttributeName: MARSAppFont(14),
                                   NSForegroundColorAttributeName: [UIColor colorWithHex:0x42c84b],
                                   NSParagraphStyleAttributeName: paragraphStyle
                                   };
        
        let titleAttributes = @{
                                   NSFontAttributeName: MARSAppFont(24),
                                   NSForegroundColorAttributeName: [UIColor whiteColor],
                                   };
        
        var attributedText = [[NSMutableAttributedString alloc] initWithString:@"LATEST\n" attributes:subtitleAttributes];
        [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@"WEATHER" attributes:titleAttributes]];
        _titleLabel.attributedText = attributedText;
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (void)setExpanded:(BOOL)expaned {
    self.expandLabel.transform = expaned ? CGAffineTransformMakeRotation(M_PI / 2.0) : CGAffineTransformIdentity;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.expandLabel];
        [self.contentView addSubview:self.titleLabel];
        self.contentView.backgroundColor = [UIColor colorWithHex:0x0c1f3f];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    let insets = CommonInsets;
    self.titleLabel.frame = CGRectMake(insets.left, 0, self.titleLabel.bounds.size.width, self.bounds.size.height);
    self.expandLabel.center = CGPointMake(self.bounds.size.width - self.expandLabel.bounds.size.width/2 - insets.right, self.bounds.size.height/2);
}

- (void)bindViewModel:(id)viewModel {
    if ([viewModel isKindOfClass:[SHSummaryViewModel class]]) {
        
    }
}


@end















































