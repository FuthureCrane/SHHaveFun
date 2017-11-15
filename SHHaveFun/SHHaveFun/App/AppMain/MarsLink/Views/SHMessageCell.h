//
//  SHMessageCell.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHMarsLink.h"

#define SHMESSAGEFONT MARSAppFont(18)
#define SHMESSAGEHEIGHT 30 

@interface SHMessageCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *statusLabel;

+ (CGSize)cellSize:(CGFloat)width text:(NSString *)text;
@end
