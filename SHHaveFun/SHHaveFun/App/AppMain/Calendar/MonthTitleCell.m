//
//  MonthTitleCell.m
//  IGTest
//
//  Created by Futhure on 2017/10/24.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "MonthTitleCell.h"
#import "IGListKit.h"
#import "MonthTitleModel.h"

@interface MonthTitleCell () <IGListBindable>

@property (nonatomic, strong) UILabel *label;

@end

@implementation MonthTitleCell

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor colorWithWhite:0.7 alpha:1];
        _label.font = [UIFont boldSystemFontOfSize:13];
        [self.contentView addSubview:_label];
    }
    return _label;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}

- (NSString *)text {
    return self.label.text;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label.frame = self.contentView.bounds;
}

- (void)bindViewModel:(id)viewModel {
    if ([viewModel isKindOfClass:[MonthTitleModel class]]) {
        MonthTitleModel *model = (MonthTitleModel *)viewModel;
        self.label.text = [model.name uppercaseString];
    }
}


@end
