//
//  SHWeatherSectionController.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHWeatherSectionController.h"
#import "SHWeather.h"
#import "SHWeatherDetailCell.h"
#import "SHWeatherSummaryCell.h"

#import "SHSummaryViewModel.h"
#import "SHDetailViewModel.h"

@interface SHWeatherSectionController ()

@property (nonatomic, strong) SHWeather *weather;

@property (nonatomic, assign) BOOL expanded;

@end

@implementation SHWeatherSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 15, 0);
        
        self.dataSource = self;
        self.selectionDelegate = self;
    }
    return self;
}
//
- (UICollectionViewCell<IGListBindable> *)sectionController:(IGListBindingSectionController *)sectionController cellForViewModel:(id)viewModel atIndex:(NSInteger)index {
    let cellClass = index == 0 ? [SHWeatherSummaryCell class] : [SHWeatherDetailCell class];
    let cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    if ([cell isKindOfClass:[SHWeatherSummaryCell class]]) {
        let lc = (SHWeatherSummaryCell*)cell;
        [lc setExpanded:self.expanded];
    } else if ([cell isKindOfClass:[SHWeatherDetailCell class]]) {
        NSString *title = @"";
        NSString *detail = @"";
        let lc = (SHWeatherDetailCell *)cell;
        switch (index) {
            case 1:
                title = @"SUNRISE";
                detail = self.weather.sunrise;
                break;
            case 2:
                title = @"SUNSET";
                detail = self.weather.sunset;
                break;
            case 3:
                title = @"HIGH";
                detail = [NSString stringWithFormat:@"%ld C", self.weather.high];
                break;
            case 4:
                title = @"LOW";
                detail = [NSString stringWithFormat:@"%ld C", self.weather.low];
                break;
            default:
                title = @"n/a";
                detail = @"n/a";
                break;
        }
        lc.titleLabel.text = title;
        lc.detailLabel.text = detail;
    }
    return cell;
}

- (CGSize)sectionController:(IGListBindingSectionController *)sectionController sizeForViewModel:(id)viewModel atIndex:(NSInteger)index {
    let width = self.collectionContext.containerSize.width;
    if (index == 0) {
        return CGSizeMake(width, 70);
    } else {
        return CGSizeMake(width, 40);
    }
}

- (NSArray<id<IGListDiffable>> *)sectionController:(IGListBindingSectionController *)sectionController viewModelsForObject:(id)object {
    if ([object isKindOfClass:[SHWeather class]]) {
        let ok = (SHWeather *)object;
        if (self.expanded) {
            NSMutableArray *arr = [NSMutableArray array];
            SHSummaryViewModel *v1 = [[SHSummaryViewModel alloc] init];
            
            [arr addObject:v1];
            
            SHDetailViewModel *m1 = [[SHDetailViewModel alloc] initWithTitle:@"SUNRISE" detail:ok.sunrise];
            SHDetailViewModel *m2 = [[SHDetailViewModel alloc] initWithTitle:@"SUNSET" detail:ok.sunset];
            SHDetailViewModel *m3 = [[SHDetailViewModel alloc] initWithTitle:@"HIGH" detail:[NSString stringWithFormat:@"%ld C", ok.high]];
            SHDetailViewModel *m4 = [[SHDetailViewModel alloc] initWithTitle:@"LOW" detail:[NSString stringWithFormat:@"%ld C", ok.low]];
            [arr addObject:m1];
            [arr addObject:m2];
            [arr addObject:m3];
            [arr addObject:m4];
            return arr;
            
        } else {
            return @[[SHSummaryViewModel new]];
        }
    }
    return nil;
}
// delegate
- (void)sectionController:(IGListBindingSectionController *)sectionController didSelectItemAtIndex:(NSInteger)index viewModel:(id)viewModel {
    self.expanded = !self.expanded;
    [self updateAnimated:YES completion:nil];
}

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return self == object;
}

@end
