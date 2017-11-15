//
//  SHMessage
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHMessage.h"

@implementation SHMessage

- (instancetype)initWithDate:(NSDate *)date text:(NSString *)text user:(SHUser *)user {
    self = [super init];
    if (self) {
        self.date = date;
        self.text = text;
        self.user = user;
    }
    return self;
}

- (NSDate *)getDate {
    return _date;
}

@end
