//
//  DayModel.m
//  IGTest
//
//  Created by Futhure on 2017/10/24.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "DayModel.h"

@implementation DayModel

- (instancetype)initWith:(BOOL)today days:(NSInteger)days selected:(BOOL)selected appointments:(NSInteger)appointments {
    self = [super init];
    if (self) {
        self.today = today;
        self.days = days;
        self.selected = selected;
        self.appointments = appointments;
    }
    return self;
}

- (id<NSObject>)diffIdentifier {
    return @(self.days);
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    if (self == object) {
        return YES;
    }
    if (object && [(NSObject *)object isKindOfClass:[DayModel class]]) {
        DayModel *model = (DayModel *)object;
        return  self.today == model.today &&
                self.days == model.days &&
                self.selected == model.selected &&
                self.appointments == model.appointments;
    }
    return NO;
}
@end
