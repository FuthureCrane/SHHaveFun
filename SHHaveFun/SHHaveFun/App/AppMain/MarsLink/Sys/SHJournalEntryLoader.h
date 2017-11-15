//
//  SHJournalEntryLoader.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHJournalEntry.h"

@interface SHJournalEntryLoader : NSObject

@property (nonatomic, strong) NSMutableArray <SHJournalEntry *>*entries;

- (void)loadTest;

@end
