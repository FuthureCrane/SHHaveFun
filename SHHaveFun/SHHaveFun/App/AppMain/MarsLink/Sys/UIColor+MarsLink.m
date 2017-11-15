//
//  UIColor+MarsLink.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "UIColor+MarsLink.h"

@implementation UIColor (MarsLink)

+ (instancetype)colorWithHex:(NSInteger)hexValue {
    let divisor = (CGFloat)255;
    let red     = (CGFloat)((hexValue & 0xFF0000) >> 16) / divisor;
    let green   = (CGFloat)((hexValue & 0x00FF00) >>  8) / divisor;
    let blue    = (CGFloat)( hexValue & 0x0000FF       ) / divisor;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
