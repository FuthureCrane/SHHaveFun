
#import <UIKit/UIKit.h>
#import "VIKTransformViewCancelDelegate.h"
#import "JSAlertAction.h"

@protocol VIKCustomDelegate <NSObject>

- (void)vikTouchAtIndex:(NSInteger)index;

@end

@interface VIKCustomBottomView : UIView

@property (nonatomic, weak) id<VIKCustomDelegate> delegate;

@property (nonatomic, weak) id<VIKTransformViewCancelDelegate> dismissDelegate;
/**
 添加Action
 
 @param action JSAlertAction
 */

- (void)addAction:(JSAlertAction *)action;
@end
