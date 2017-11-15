//
//  SHSolFormatter.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHSolFormatter : NSObject

@property (nonatomic, strong) NSDate *landingDate;

- (instancetype)initWithLandingDate:(NSDate *)landingDate;

- (NSInteger)solsFrom:(NSDate *)date;

@end
