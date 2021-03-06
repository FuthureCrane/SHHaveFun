//
//  SHIGListCollectionCell.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/20.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHIGListCollectionCell.h"
//    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationFade];
@implementation SHIGListCollectionCell {
    UIImageView *_imageView;
    UILabel *_textLabel;
    UILabel *_detailTextLabel;
    CALayer *_separator;
    BOOL _useSeparatorInset;
}

+ (void)load {
    SHIGListCollectionCell *cell = [SHIGListCollectionCell appearance];
    cell.separatorColor = [UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1];
    cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        _needConfig = YES;
    }
    return self;
}

#pragma mark - set
- (void)setSeparatorInset:(UIEdgeInsets)separatorInset {
    _separatorInset    = separatorInset;
    _useSeparatorInset = YES;
}

#pragma mark - view

- (CALayer *)separator {
    if(!_separator) {
        _separator = [CALayer new];
        UIColor *backgroundColor = self.separatorColor ? :[SHIGListCollectionCell appearance].separatorColor;
        
        _separator.backgroundColor = backgroundColor.CGColor;
        [self.contentView.layer addSublayer:_separator];
    }
    return _separator;
}

- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)textLabel {
    if(!_textLabel) {
        _textLabel = [UILabel new];
        [self.contentView addSubview:_textLabel];
    }
    return _textLabel;
}

- (UILabel *)detailTextLabel {
    if(!_detailTextLabel) {
        _detailTextLabel = [UILabel new];
        [self.contentView addSubview:_detailTextLabel];
    }
    return _detailTextLabel;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    !self.didMoveToSuperviewBlock ? : self.didMoveToSuperviewBlock(self);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if(_separator) {
        UIEdgeInsets inset = self.separatorInset;
        if(!_useSeparatorInset) {
            inset = [SHIGListCollectionCell appearance].separatorInset;
        }
        
        CGRect separatorFrame = CGRectZero;
        separatorFrame.origin.x    = inset.left;
        separatorFrame.origin.y    = self.contentView.frame.size.height-0.5-inset.bottom;
        separatorFrame.size.height = 0.5;
        separatorFrame.size.width  = ceil( self.contentView.frame.size.width-inset.left-inset.right);
        _separator.frame = separatorFrame;
    }
    
    !self.didLayoutSubviewsBlock ? : self.didLayoutSubviewsBlock(self);
}

@end
