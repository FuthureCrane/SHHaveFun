//
//  SHMessageSectionController.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "SHMessageSectionController.h"
#import "SHMessage.h"
#import "SHMessageCell.h"

@implementation SHMessageSectionController
{
    SHMessage *_message;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 15, 0);
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    let cell = (SHMessageCell *)[self.collectionContext dequeueReusableCellOfClass:[SHMessageCell class] forSectionController:self atIndex:index];
    cell.messageLabel.text = _message.text;
    cell.titleLabel.text = [_message.user.name uppercaseString];
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return [SHMessageCell cellSize:self.collectionContext.containerSize.width text:_message.text];
}

- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[SHMessage class]]) {
        _message = object;
    }
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    
}

@end
























