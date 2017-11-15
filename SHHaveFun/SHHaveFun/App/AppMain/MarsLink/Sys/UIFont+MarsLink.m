//
//  UIFont+MarsLink.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "UIFont+MarsLink.h"

@implementation UIFont (MarsLink)

+ (instancetype)marsOCRFont:(CGFloat)fontSize {
    let font = [UIFont fontWithName:@"OCRAStd" size:fontSize];
    return font;
}

@end
