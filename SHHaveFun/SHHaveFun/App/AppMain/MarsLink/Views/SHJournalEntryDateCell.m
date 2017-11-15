//
//  SHJournalEntryDateCell.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHJournalEntryDateCell.h"
#import "SHMarsLink.h"
#import "UIColor+MarsLink.h"

@implementation SHJournalEntryDateCell

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 0;
        _label.backgroundColor = UIColor.clearColor;
        _label.font = MARSAppFont(14);
        _label.textColor = [UIColor colorWithHex:0x42c84b];
    }
    return _label;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithHex:0x0c1f3f];
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIEdgeInsets pading = CommonInsets;
    self.label.frame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, pading.left, 0, pading.right));
}

@end
