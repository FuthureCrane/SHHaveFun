//
//  SHDetailViewModel.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/15.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+IGListDiffable.h"

@interface SHDetailViewModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *detail;


- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end
