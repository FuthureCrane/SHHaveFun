//
//  Month.m
//  IGTest
//
//  Created by Futhure on 2017/10/20.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "Month.h"

@implementation Month

- (instancetype)initWith:(NSString *)name days:(NSInteger)days appointments:(NSDictionary<NSNumber *,NSArray<NSString *> *> *)appointments {
    self = [super init];
    if (self) {
        self.name = name;
        self.days = days;
        self.appointments = appointments.copy;
    }
    return self;
}

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return self == object;
}

@end
