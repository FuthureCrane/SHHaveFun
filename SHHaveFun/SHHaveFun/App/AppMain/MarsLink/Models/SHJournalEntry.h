//
//  SHJournalEntry.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHDateSortable.h"
#import "SHUser.h"
#import "NSObject+IGListDiffable.h"

@interface SHJournalEntry : NSObject <SHDateSortable>

@property (nonatomic, strong) SHUser *user;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, copy) NSString *text;

- (instancetype)initWithDate:(NSDate *)date text:(NSString *)text user:(SHUser *)user;

@end
