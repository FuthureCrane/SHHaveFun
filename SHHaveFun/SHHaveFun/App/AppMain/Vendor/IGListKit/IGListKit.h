/**
 * Copyright (c) 2016-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "IGListCompatibility.h"

///**
// * Project version number for IGListKit.
// */
//FOUNDATION_EXPORT double IGListKitVersionNumber;
//
///**
// * Project version string for IGListKit.
// */
//FOUNDATION_EXPORT const unsigned char IGListKitVersionString[];

#if TARGET_OS_EMBEDDED || TARGET_OS_SIMULATOR

// iOS and tvOS only:

#import "IGListAdapter.h"
#import "IGListAdapterDataSource.h"
#import "IGListAdapterDelegate.h"
#import "IGListAdapterUpdater.h"
#import "IGListAdapterUpdaterDelegate.h"
#import "IGListBatchContext.h"
#import "IGListBindable.h"
#import "IGListBindingSectionController.h"
#import "IGListBindingSectionControllerSelectionDelegate.h"
#import "IGListBindingSectionControllerDataSource.h"
#import "IGListBindable.h"
#import "IGListCollectionContext.h"
#import "IGListDisplayDelegate.h"
#import "IGListExperiments.h"
#import "IGListGenericSectionController.h"
#import "IGListSectionController.h"
#import "IGListReloadDataUpdater.h"
#import "IGListScrollDelegate.h"
#import "IGListSingleSectionController.h"
#import "IGListStackedSectionController.h"
#import "IGListSupplementaryViewSource.h"
#import "IGListUpdatingDelegate.h"
#import "IGListCollectionViewLayout.h"
#import "IGListWorkingRangeDelegate.h"

#endif

// Shared (iOS, tvOS, macOS compatible):

#import "IGListAssert.h"
#import "IGListBatchUpdateData.h"
#import "IGListDiff.h"
#import "IGListDiffable.h"
#import "IGListExperiments.h"
#import "IGListIndexPathResult.h"
#import "IGListIndexSetResult.h"
#import "IGListMoveIndex.h"
#import "IGListMoveIndexPath.h"
#import "NSNumber+IGListDiffable.h"
#import "NSString+IGListDiffable.h"
