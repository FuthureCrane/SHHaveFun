//
//  SHJournalEntryCell.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHMarsLink.h"

#define SHJOURNALFONT MARSAppFont(18)
#define SHJOURNALINSETS UIEdgeInsetsMake(8, 15, 8, 15)

@interface SHJournalEntryCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;

+ (CGSize)cellSize:(CGFloat)width text:(NSString *)text;

@end
