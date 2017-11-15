//
//  SHFeedController.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHFeedController.h"
#import "SHJournalEntry.h"
#import "SHPathfinder.h"
#import "SHWxScanner.h"
#import "IGListKit.h"
#import "SHJournalEntryLoader.h"
#import "SHMessage.h"
#import "SHWeather.h"
#import "SHJournalEntry.h"
#import "SHMessageSectionController.h"
#import "SHJournalSectionController.h"
#import "SHWeatherSectionController.h"

@interface SHFeedController () <SHPathfinderDelegate, IGListAdapterDataSource>

@property (nonatomic, strong) SHWxScanner *wxScanner;
@property (nonatomic, strong) SHPathfinder *pathfinder;

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) SHJournalEntryLoader *loader;

@end

@implementation SHFeedController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loader loadTest];
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.pathfinder.delegate = self;
    [self.pathfinder connect];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

// pathfinder
- (void)pathfinderDidUpdateMessgaes:(SHPathfinder *)pathFinder {
    [self.adapter performUpdatesAnimated:YES completion:nil];
}
// list
- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[SHMessage class]]) {
        return [[SHMessageSectionController alloc] init];
    } else if ([object isKindOfClass:[SHWeather class]]) {
        return [[SHWeatherSectionController alloc] init];
    } else if ([object isKindOfClass:[SHJournalEntry class]]) {
        return [[SHJournalSectionController alloc] init];
    } else {
        return nil;
    }
}
//objects(for:) 返回一个数据对象组成的数组，这些对象将显示在 collection view。这里返回了loader.entries，因为它包含了日志记录。
//对于每个数据对象，listAdapter(_:sectionControllerFor:) 方法必须返回一个新的 section conroller 实例。现在，你返回了一个空的 IGListSectionController以解除编译器的抱怨——等会，你会修改这里，返回一个自定义的日志的 section controller。
//emptyView(for:) 返回一个 view，它将在 List 为空时显示。NASA 给的时间比较仓促，他们没有为这个功能做预算。

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray<id<IGListDiffable>> *items = [NSMutableArray arrayWithObject:self.wxScanner.currentWeather];
    [items addObjectsFromArray:self.loader.entries];
    [items addObjectsFromArray:self.pathfinder.messages];
    NSArray<id<IGListDiffable>> *results = [items sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 conformsToProtocol:@protocol(SHDateSortable)] && [obj2 conformsToProtocol:@protocol(SHDateSortable)]) {
            id<SHDateSortable> o1 = obj1;
            id<SHDateSortable> o2 = obj2;
            return [[o2 getDate] compare: [o1 getDate]];
        }
        return NSOrderedAscending;
    }];
    return results;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}
// lazy`
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        _collectionView.backgroundColor = UIColor.blackColor;
    }
    return _collectionView;
}

- (SHJournalEntryLoader *)loader {
    if (!_loader) {
        _loader = [[SHJournalEntryLoader alloc] init];
    }
    return _loader;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self workingRangeSize:0];
    }
    return _adapter;
}

- (SHPathfinder *)pathfinder {
    if (!_pathfinder) {
        _pathfinder = [[SHPathfinder alloc] init];
    }
    return _pathfinder;
}

- (SHWxScanner *)wxScanner {
    if (!_wxScanner) {
        _wxScanner = [[SHWxScanner alloc] init];
    }
    return _wxScanner;
}

@end

























