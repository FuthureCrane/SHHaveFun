//
//  MonthTitleModel.m
//  IGTest
//
//  Created by Futhure on 2017/10/24.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "MonthTitleModel.h"

@implementation MonthTitleModel

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (id<NSObject>)diffIdentifier {
    return self.name;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    if (self == object) {
        return YES;
    }
    if (object && [(NSObject *)object isKindOfClass:[MonthTitleModel class]]) {
        return YES;
    }
    return NO;
}

@end
