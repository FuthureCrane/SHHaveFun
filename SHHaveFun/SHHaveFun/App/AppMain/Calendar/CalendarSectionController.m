//
//  CalendarSectionController.m
//  IGTest
//
//  Created by Futhure on 2017/10/20.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "CalendarSectionController.h"
#import "DayModel.h"
#import "MonthTitleModel.h"
#import "Month.h"
#import "CalendarCell.h"
#import "LabelCell.h"
#import "MonthTitleCell.h"

@interface CalendarSectionController ()

@property (nonatomic, assign) NSInteger selectedDay;

@end

@implementation CalendarSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _selectedDay = -1;
        self.dataSource = self;
        self.selectionDelegate = self;
    }
    return self;
}

//IGListBindingSectionControllerDataSource
- (NSArray<id<IGListDiffable>> *)sectionController:(IGListBindingSectionController *)sectionController viewModelsForObject:(id)object {
    if ([object isKindOfClass:[Month class]]) {
        Month *month = (Month *)object;
        NSDate *date = [NSDate date];
        NSInteger today = [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:date];
        NSMutableArray<id<IGListDiffable>> *viewModels = [NSMutableArray<id<IGListDiffable>> array];
        [viewModels addObject:[[MonthTitleModel alloc] initWithName:month.name]];
        for (int i = 1; i < month.days + 1; i++) {
            DayModel *viM = [[DayModel alloc] initWith:i == today days:i selected:i == self.selectedDay appointments:month.appointments[@(i)].count];
            [viewModels addObject:viM];
        }
        
        for (id appoint in month.appointments[@(self.selectedDay)]) {
            [viewModels addObject:appoint];
        }
        
        return viewModels;
    }
    return nil;
}

- (UICollectionViewCell<IGListBindable> *)sectionController:(IGListBindingSectionController *)sectionController cellForViewModel:(id)viewModel atIndex:(NSInteger)index {
    Class cellClass;
    if ([viewModel isKindOfClass:[DayModel class]]) {
        cellClass = [CalendarCell class];
    } else if ([viewModel isKindOfClass:[MonthTitleModel class]]) {
        cellClass = [MonthTitleCell class];
    } else {
        cellClass = [LabelCell class];
    }
    UICollectionViewCell <IGListBindable> *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    return cell;
}

- (CGSize)sectionController:(IGListBindingSectionController *)sectionController sizeForViewModel:(id)viewModel atIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    if ([viewModel isKindOfClass:[DayModel class]]) {
        return CGSizeMake(width / 7.0, width / 7.0);
    } else if ([viewModel isKindOfClass:[MonthTitleModel class]]) {
        return CGSizeMake(width, 30.0);
    } else {
        return CGSizeMake(width, 55.0);
    }
}
//IGListBindingSectionControllerSelectionDelegate

- (void)sectionController:(IGListBindingSectionController *)sectionController didSelectItemAtIndex:(NSInteger)index viewModel:(id)viewModel {
    if (![viewModel isKindOfClass:[DayModel class]]) {
        return;
    }
    DayModel *model = (DayModel *)viewModel;
    if (model.days == self.selectedDay) {
        self.selectedDay = -1;
    } else {
        self.selectedDay = model.days;
    }
    [self updateAnimated:YES completion:nil];
//    [(IGListAdapter *)self.collectionContext performUpdatesAnimated:YES completion:nil];
}

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return self == object;
}

@end
