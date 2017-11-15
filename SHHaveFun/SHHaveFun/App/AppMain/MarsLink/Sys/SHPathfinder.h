//
//  SHPathfinder.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHMessage.h"

@protocol SHPathfinderDelegate;
@interface SHPathfinder : NSObject

@property (nonatomic, weak) id<SHPathfinderDelegate> delegate;

@property (nonatomic, strong) NSMutableArray<SHMessage *> *messages;

- (void)connect;

@end

@protocol SHPathfinderDelegate <NSObject>

- (void)pathfinderDidUpdateMessgaes:(SHPathfinder *)pathFinder;

@end
//    class Pathfinder {
//        weak var delegate: PathfinderDelegate?
//        var messages: [Message] = {
//            var arr = [Message]()
//            arr.append(lewisMessage(text: "Mark, are you receiving me?", interval: -803200))
//            arr.append(lewisMessage(text: "I think I left behind some ABBA, might help with the drive 😜", interval: -259200))
//            return arr
//        }() {
//            didSet {
//                delegate?.pathfinderDidUpdateMessages(pathfinder: self)
//            }
//        }

