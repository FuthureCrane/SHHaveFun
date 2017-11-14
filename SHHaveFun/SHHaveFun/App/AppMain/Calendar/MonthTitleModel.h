//
//  MonthTitleModel.h
//  IGTest
//
//  Created by Futhure on 2017/10/24.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "IGListKit.h"

@interface MonthTitleModel : NSObject <IGListDiffable>

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@end
