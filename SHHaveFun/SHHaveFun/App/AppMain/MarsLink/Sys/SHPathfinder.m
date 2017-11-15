//
//  SHPathfinder.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHPathfinder.h"
#import "SHUser.h"

@implementation SHPathfinder

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSMutableArray<SHMessage *> *)messages {
    if (!_messages) {
        _messages = [[NSMutableArray<SHMessage *> alloc] init];
        [_messages addObject:[self lewiMessageText:@"Mark, are you receiving me?" interval:-803200]];
        [_messages addObject:[self lewiMessageText:@"I think I left behind some ABBA, might help with the drive 😜" interval:-259200]];
    }
    return _messages;
}

- (SHMessage *)lewiMessageText:(NSString *)text interval:(NSTimeInterval)interval {
    let user = [[SHUser alloc] initWithId:2 name:@"cpt.lewis"];
    return [[SHMessage alloc] initWithDate:[NSDate dateWithTimeIntervalSinceNow:interval] text:text user:user];
}
- (SHMessage *)lewiMessageText:(NSString *)text {
    return [self lewiMessageText:text interval:0];
}

- (void)delayTime:(NSTimeInterval)time execute:(void (^)(void))work {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        work();
        if (self.delegate && [self.delegate respondsToSelector:@selector(pathfinderDidUpdateMessgaes:)]) {
            [self.delegate pathfinderDidUpdateMessgaes:self];
        }
    });
}

- (void)connect {
    [self delayTime:2.3 execute:^{
        [self.messages addObject:[self lewiMessageText:@"Liftoff in 3..."]];
        [self delayTime:1 execute:^{
            [self.messages addObject:[self lewiMessageText:@"2..."]];
            [self delayTime:1 execute:^{
                [self.messages addObject:[self lewiMessageText:@"1..."]];
            }];
        }];
    }];
}

@end
