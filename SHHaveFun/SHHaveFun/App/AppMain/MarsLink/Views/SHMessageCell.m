//
//  SHMessageCell.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHMessageCell.h"
#import "UIColor+MarsLink.h"

@implementation SHMessageCell

+ (CGSize)cellSize:(CGFloat)width text:(NSString *)text {
    let lbounds = marsLinkSize(text, SHMESSAGEFONT, width, CommonInsets).size;
    return CGSizeMake(width, lbounds.height + SHMESSAGEHEIGHT);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.messageLabel];
        [self.contentView addSubview:self.statusLabel];
        [self.contentView addSubview:self.titleLabel];
        self.contentView.backgroundColor = [UIColor colorWithHex:0x0c1f3f];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(CommonInsets.left, 0, self.bounds.size.width - CommonInsets.left - CommonInsets.right, SHMESSAGEHEIGHT);
    self.statusLabel.frame = CGRectMake(self.bounds.size.width - 80, 4, 70, 18);
    let messageFrame = CGRectMake(0,  CGRectGetMaxY(self.titleLabel.frame), self.bounds.size.width, self.bounds.size.height - SHMESSAGEHEIGHT);
    self.messageLabel.frame = UIEdgeInsetsInsetRect(messageFrame, CommonInsets);
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.numberOfLines = 0;
        _messageLabel.backgroundColor = UIColor.clearColor;
        _messageLabel.font = MARSAppFont(18);
        _messageLabel.textColor = [UIColor whiteColor];
    }
    return _messageLabel;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.numberOfLines = 0;
        _statusLabel.layer.borderColor = [UIColor colorWithHex:0x76879d].CGColor;
        _statusLabel.layer.borderWidth = 1;
        _statusLabel.backgroundColor = UIColor.clearColor;
        _statusLabel.font = MARSAppFont(8);
        _statusLabel.textColor = [UIColor colorWithHex:0x76879d];
        _statusLabel.text = @"NEW MESSAGE";
        _statusLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _statusLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = UIColor.clearColor;
        _titleLabel.font = MARSAppFont(14);
        _titleLabel.textColor = [UIColor colorWithHex:0x42c84b];
    }
    return _titleLabel;
}

@end
