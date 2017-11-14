//
//  LabelCell.h
//  IGTest
//
//  Created by Futhure on 2017/10/20.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelCell : UICollectionViewCell

@property (nonatomic, assign, class, readonly) UIEdgeInsets  insets;
@property (nonatomic, assign, class, readonly) CGFloat       singleLineHeight;
@property (nonatomic, strong, class, readonly) UIFont        *font;

@property (nonatomic, copy) NSString *text;

- (void)updateText:(NSString *)text;

+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width;

@end
