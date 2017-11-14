//
//  CalendarCell.m
//  IGTest
//
//  Created by Futhure on 2017/10/20.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "CalendarCell.h"
#import "DayModel.h"

@interface CalendarCell ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UILabel *dotslabel;

@end

@implementation CalendarCell

- (void)bindViewModel:(id)viewModel {
    if ([viewModel isKindOfClass:[DayModel class]]) {
        DayModel *model = (DayModel *)viewModel;
        self.label.text = [@(model.days) stringValue];
        self.label.layer.borderColor = model.today ? [UIColor redColor].CGColor : [UIColor clearColor].CGColor;
        self.label.backgroundColor = model.selected ? [[UIColor redColor] colorWithAlphaComponent:0.3]: [UIColor clearColor];
        NSMutableString *dots = @"".mutableCopy;
        for (int i = 0; i < model.appointments; i++) {
            [dots appendString:@"."];
        }
        self.dotslabel.text = dots;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    CGFloat half = bounds.size.height / 2;
    self.label.frame = bounds;
    self.label.layer.cornerRadius = half;
    self.dotslabel.frame = CGRectMake(0, half - 10, bounds.size.width, half);
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor clearColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont boldSystemFontOfSize:16];
        _label.layer.borderWidth = 2;
        _label.clipsToBounds = YES;
        [self.contentView addSubview:_label];
    }
    return _label;
}

- (UILabel *)dotslabel {
    if (!_dotslabel) {
        _dotslabel = [[UILabel alloc] init];
        _dotslabel.backgroundColor = [UIColor clearColor];
        _dotslabel.textAlignment = NSTextAlignmentCenter;
        _dotslabel.textColor = [UIColor redColor];
        _dotslabel.font = [UIFont boldSystemFontOfSize:30];
        [self.contentView addSubview:_dotslabel];
    }
    return _dotslabel;
}

- (NSString *)text {
    return self.label.text;
}
- (NSString *)dotstext {
    return self.dotslabel.text;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}

- (void)setDotstext:(NSString *)dotstext {
    self.dotslabel.text = dotstext;
}

@end
