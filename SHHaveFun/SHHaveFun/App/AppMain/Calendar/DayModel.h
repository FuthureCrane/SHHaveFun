//
//  DayModel.h
//  IGTest
//
//  Created by Futhure on 2017/10/24.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "IGListKit.h"

@interface DayModel : NSObject <IGListDiffable>

@property (nonatomic, assign) BOOL today;

@property (nonatomic, assign) NSInteger days;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, assign) NSInteger appointments;

- (instancetype)initWith:(BOOL)today days:(NSInteger)days selected:(BOOL)selected appointments:(NSInteger)appointments;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;
@end
