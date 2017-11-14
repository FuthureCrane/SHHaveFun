//
//  SHAutoScrollController.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHAutoScrollController.h"
#import "SHAutoScrollView.h"

@interface SHAutoScrollController () <SHAutoScrollDelegate>

@property (nonatomic, strong) SHAutoScrollView *cycleNew;

@property (nonatomic, strong) SHAutoScrollView *cycleOld;

@end

@implementation SHAutoScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_cycleNew) {
        _cycleNew = [SHAutoScrollView cycleScrollViewWithFrame:CGRectMake(50, 100, 200, 80) delegate:self];
        _cycleNew.scrollDirection = UICollectionViewScrollDirectionVertical;
        _cycleNew.autoScrollTimeInterval = 3.0;
        _cycleNew.titleLabelTextColor = [UIColor blueColor];
        _cycleNew.titlesGroup = @[@"那日少年薄春衫,", @"明月照银簪。", @"燕子分别时候,", @"恨风疾云乱。", @"志未酬,", @"鬓先斑,", @"梦已残。", @"今生休去,", @"人老沧海,", @"心再天山。"];
        [self.view addSubview:_cycleNew];
    }
    
    
    if (!_cycleOld) {
        _cycleOld = [SHAutoScrollView cycleScrollViewWithFrame:CGRectMake(50, 200, 200, 80) delegate:self];
        _cycleOld.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _cycleOld.autoScrollTimeInterval = 3.0;
        _cycleOld.titleLabelTextColor = [UIColor blueColor];
        _cycleOld.titlesGroup = @[@"那日少年薄春衫,", @"明月照银簪。", @"燕子分别时候,", @"恨风疾云乱。", @"志未酬,", @"鬓先斑,", @"梦已残。", @"今生休去,", @"人老沧海,", @"心再天山。"];
        [self.view addSubview:_cycleOld];
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)cycleScrollView:(SHAutoScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%@", cycleScrollView.titlesGroup[index]);
}

@end
