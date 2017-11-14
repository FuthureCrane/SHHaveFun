//
//  CalendarCell.h
//  IGTest
//
//  Created by Futhure on 2017/10/20.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "IGListKit.h"

@interface CalendarCell : UICollectionViewCell <IGListBindable>

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *dotstext;

@end
