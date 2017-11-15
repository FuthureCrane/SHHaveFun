//
//  SHJournalEntryCell.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHJournalEntryCell.h"
#import "UIColor+MarsLink.h"

@implementation SHJournalEntryCell

+ (CGSize)cellSize:(CGFloat)width text:(NSString *)text {
    return marsLinkSize(text, SHJOURNALFONT, width, SHJOURNALINSETS).size;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 0;
        _label.backgroundColor = UIColor.clearColor;
        _label.font = SHJOURNALFONT;
        _label.textColor = UIColor.whiteColor;
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
    self.label.frame = UIEdgeInsetsInsetRect(self.bounds, SHJOURNALINSETS);
}

@end
