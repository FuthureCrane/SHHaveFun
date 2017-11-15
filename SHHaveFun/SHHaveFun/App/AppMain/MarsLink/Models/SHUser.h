//
//  SHUser.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+IGListDiffable.h"
@interface SHUser : NSObject

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *name;


- (instancetype)initWithId:(NSInteger)id name:(NSString *)name;
@end
