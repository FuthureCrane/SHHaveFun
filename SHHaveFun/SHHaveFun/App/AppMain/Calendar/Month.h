//
//  Month.h
//  IGTest
//
//  Created by Futhure on 2017/10/20.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "IGListKit.h"

@interface Month : NSObject <IGListDiffable>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger days;

@property (nonatomic, strong) NSDictionary <NSNumber*, NSArray<NSString* >*>*appointments;

- (instancetype)initWith:(NSString *)name days:(NSInteger)days appointments:(NSDictionary <NSNumber*, NSArray<NSString* >*>*)appointments;

@end
