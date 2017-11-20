//
//  SHIGListCollectionCell.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/20.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//
/**
 * IGListKit 仿tableViewCell 基类
 *
 */

#import <UIKit/UIKit.h>

#ifndef SHIGListCollectionCell
#define SHIGListCollectionCell(_name_) \
@interface SHIGListCollectionCell ## _name_ : SHIGListCollectionCell @end \
@implementation SHIGListCollectionCell_ ## _name_ @end
#endif

#define Identifier(_Class_) \
static NSString *reuse ## _Class_ ## Identifier; \
static dispatch_once_t onceToken ## _Class_; \
dispatch_once(&onceToken ## _Class_, ^{ \
reuse ## _Class_ ## Identifier = NSStringFromClass([_Class_ class]); \
});


@interface SHIGListCollectionCell : UICollectionViewCell

@property (nonatomic, assign) BOOL needConfig;

@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UILabel *textLabel;
@property (nonatomic, readonly) UILabel *detailTextLabel;
@property (nonatomic, readonly) CALayer *separator;

/**
 allows customization of the separator color.
 This only affect appearance,if you want change separator'color,you should set cell.separator.backgroundColor
 */
@property (nonatomic, strong) UIColor *separatorColor UI_APPEARANCE_SELECTOR;

/**
 allows customization of the separator frame
 */
@property (nonatomic) UIEdgeInsets separatorInset UI_APPEARANCE_SELECTOR;


@property (nonatomic, copy) void (^didMoveToSuperviewBlock)(SHIGListCollectionCell *cell);
@property (nonatomic, copy) void (^didLayoutSubviewsBlock)(SHIGListCollectionCell *cell);

@end
