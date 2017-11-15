//
//  SHMarsLinkNavigationBar.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHMarsLinkNavigationBar.h"
#import "SHMarsLink.h"
#import "UIColor+MarsLink.h"

@implementation SHMarsLinkNavigationBar

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = MARSAppFont(18);
        _titleLabel.text = @"MARSLINK";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.backgroundColor = [UIColor clearColor];
        _statusLabel.text = @"RECEIVING";
        _statusLabel.font = MARSAppFont(13);
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        _statusLabel.textColor = [UIColor colorWithHex:0x42c84b];
        [_statusLabel sizeToFit];
    }
    return _statusLabel;
}

- (CAShapeLayer *)statusIndicator {
    if (!_statusIndicator) {
        _statusIndicator = [CAShapeLayer layer];
        _statusIndicator.strokeColor = UIColor.whiteColor.CGColor;
        _statusIndicator.lineWidth = 1;
        _statusIndicator.fillColor = UIColor.blackColor.CGColor;
        let size = 8;
        let frame = CGRectMake(0, 0, size, size);
        _statusIndicator.path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:size / 2.0].CGPath;
        _statusIndicator.frame = frame;
    }
    return _statusIndicator;
}

- (CAShapeLayer *)highLayer {
    if (!_highLayer) {
        _highLayer = [CAShapeLayer layer];
        _highLayer.fillColor = [UIColor colorWithHex:0x76879D].CGColor;
    }
    return _highLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.highLayer];
        [self.layer addSublayer:self.statusIndicator];
        [self addSubview:self.titleLabel];
        [self addSubview:self.statusLabel];
        self.barTintColor = UIColor.blackColor;
        [self updateStatus];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    let titleWidth = 130;
    let borderHeight = 4;
    let path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(titleWidth, 0)];
    [path addLineToPoint:CGPointMake(titleWidth, self.bounds.size.height - borderHeight)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height - borderHeight)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [path closePath];
    self.highLayer.path = path.CGPath;
    self.titleLabel.frame = CGRectMake(0, 0, titleWidth, self.bounds.size.height);
    self.statusLabel.frame = CGRectMake(self.bounds.size.width - self.statusLabel.bounds.size.width - CommonInsets.right, self.bounds.size.height - borderHeight - self.statusLabel.bounds.size.height - 6, self.statusLabel.bounds.size.width, self.statusLabel.bounds.size.height);
    self.statusIndicator.position = CGPointMake(self.statusLabel.center.x - 50, self.statusLabel.center.y - 1);
    
}

- (void)updateStatus {
    self.statusOn = !self.statusOn;
    [CATransaction begin];
    [CATransaction setValue:(__bridge id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    self.statusIndicator.fillColor = (self.statusOn ? UIColor.whiteColor : UIColor.blackColor).CGColor;
    [CATransaction commit];
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self updateStatus];
        });
    });
}

@end
