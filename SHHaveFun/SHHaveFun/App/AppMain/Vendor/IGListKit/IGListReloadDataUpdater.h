/**
 * Copyright (c) 2016-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <UIKit/UIKit.h>

#import "IGListMacros.h"
#import "IGListUpdatingDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `IGListReloadDataUpdater` is a concrete type that conforms to `IGListUpdatingDelegate`.
 It is an out-of-box updater for `IGListAdapter` objects to use.

 @note This updater performs simple, synchronous updates using `-[UICollectionView reloadData]`.
 */
IGLK_SUBCLASSING_RESTRICTED
NS_SWIFT_NAME(ListReloadDataUpdater)
@interface IGListReloadDataUpdater : NSObject <IGListUpdatingDelegate>

@end

NS_ASSUME_NONNULL_END
