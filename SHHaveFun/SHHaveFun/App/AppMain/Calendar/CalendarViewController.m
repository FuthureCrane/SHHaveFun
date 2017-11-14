//
//  CalendarViewController.m
//  IGTest
//
//  Created by Futhure on 2017/10/20.
//  Copyright © 2017年 Auto. All rights reserved.
//

#import "CalendarViewController.h"
#import "IGListKit.h"
#import "Month.h"
#import "CalendarSectionController.h"

@interface CalendarViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray    <Month *>*months;


@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *date = [NSDate date];
    NSInteger currentMonth = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:date];
    Month *month = [[Month alloc] initWith:[[NSDateFormatter alloc] init].monthSymbols[currentMonth - 1] days:30 appointments:
                    @{
                    @2: @[@"理发"],
                    @4: @[@"做指甲"],
                    @7: @[@"看牙医", @"逛超市"],
                    @12: @[@"装斯文", @"扮禽兽"],
                    @13: @[@"吃一顿丰盛大餐"],
                    @17: @[@"买跑鞋", @"买智能手环", @"开始跑步"],
                    @20: @[@"打电话回家"],
                    @21: @[@"面试"],
                    @25: @[@"学习IGListKit"],
                    @26: @[@"停止跑步", @"买冰激凌"]
                    }];
    [self.months addObject:month];
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (NSMutableArray<Month *> *)months {
    if (!_months) {
        _months = [[NSMutableArray<Month *> alloc] init];
    }
    return _months;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self];
    }
    return _adapter;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO topContentInset:0 stretchToEdge:NO]];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [[CalendarSectionController alloc] init];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.months;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end
