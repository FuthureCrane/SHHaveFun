//
//  SHJournalSectionController.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHJournalSectionController.h"
#import "SHJournalEntry.h"
#import "SHSolFormatter.h"
#import "SHJournalEntryCell.h"
#import "SHJournalEntryDateCell.h"

@interface SHJournalSectionController ()

@property (nonatomic, strong) SHJournalEntry *entry;

@property (nonatomic, strong) SHSolFormatter *solFormatter;

@end

@implementation SHJournalSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 15, 0);
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 2;
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    let cellClass = index == 0 ? [SHJournalEntryDateCell class] : [SHJournalEntryCell class];
    let cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    if ([cell isKindOfClass:[SHJournalEntryDateCell class]]) {
        let lc = (SHJournalEntryDateCell*)cell;
        lc.label.text = [NSString stringWithFormat:@"SOL %ld", (long)[self.solFormatter solsFrom:self.entry.date]];
    } else if ([cell isKindOfClass:[SHJournalEntryCell class]]) {
        let lc = (SHJournalEntryCell*)cell;
        lc.label.text = self.entry.text;
    }
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    let width = self.collectionContext.containerSize.width;
    if (index == 0) {
        return CGSizeMake(width, 30);
    } else {
        return [SHJournalEntryCell cellSize:width text:self.entry.text];
    }
}

- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[SHJournalEntry class]]) {
        self.entry = object;
    }
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    
}

@end
