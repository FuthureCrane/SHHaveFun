//
//  LabelCell.m
//  IGTest
//
//  Created by Futhure on 2017/10/20.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "LabelCell.h"
#import "IGListKit.h"
//    override var isHighlighted: Bool {
//        didSet {
//            contentView.backgroundColor = UIColor(white: isHighlighted ? 0.9 : 1, alpha: 1)
//        }
//    }
//    }

@interface LabelCell () <IGListBindable>
@property (nonatomic, assign) UIEdgeInsets  insets;
@property (nonatomic, strong) UIFont        *font;
@property (nonatomic, strong) UILabel       *label;

@property (nonatomic, strong) CALayer       *separator;

@end

static UIFont *_p_font;

@implementation LabelCell

+ (UIEdgeInsets)insets {
    return  UIEdgeInsetsMake(8, 15, 8, 15);
}

+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width {
    CGSize constrainedSize = CGSizeMake(width - LabelCell.insets.left - LabelCell.insets.right, CGFLOAT_MAX);
    NSDictionary *attri = @{ NSFontAttributeName : LabelCell.font};
    CGRect bounds = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil];
    return ceil(bounds.size.height) + LabelCell.insets.top + LabelCell.insets.bottom;
}

+ (UIFont *)font {
    if (!_p_font) {
        _p_font = [UIFont systemFontOfSize:17];
    }
    return _p_font;
}

+ (CGFloat)singleLineHeight {
    return LabelCell.font.lineHeight + LabelCell.insets.top + LabelCell.insets.bottom;
}

- (void)updateText:(NSString *)text {
    self.label.text = text;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.label];
        [self.contentView.layer addSublayer:self.separator];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    self.label.frame = UIEdgeInsetsInsetRect(bounds, self.insets);
    CGFloat height = 0.5;
    CGFloat left = self.insets.left;
    self.separator.frame = CGRectMake(left, bounds.size.height - height, bounds.size.width - left, height);
}

- (UIEdgeInsets)insets {
    return  UIEdgeInsetsMake(8, 15, 8, 15);
}

- (UIFont *)font {
    if (!_font) {
        _font = [UIFont systemFontOfSize:17];
    }
    return _font;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor clearColor];
        _label.font = self.font;
        _label.numberOfLines = 0;
    }
    return _label;
}

- (CALayer *)separator {
    if (!_separator) {
        _separator = [CALayer layer];
        _separator.backgroundColor = [UIColor colorWithRed:200.0 / 255.0 green:109.0 / 255.0 blue:204.0 / 255.0 alpha:1].CGColor;
    }
    return _separator;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}

- (NSString *)text {
    return self.label.text;
}

- (void)bindViewModel:(id)viewModel {
    if ([viewModel isKindOfClass:[NSString class]])
    {
        self.label.text = viewModel;
    }
    if ([viewModel isKindOfClass:NSClassFromString(@"BtViewModel")]) {
        self.label.text = [viewModel valueForKey:@"text"];;
    }
}
@end
