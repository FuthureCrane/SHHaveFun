
#import <UIKit/UIKit.h>
#import "VIKTransformViewCancelDelegate.h"

//@protocol VIKTransformViewCancelDelegate <NSObject>
//
//- (void)vikTransformDismiss;
//
//@end

@interface VIKTransformView : UIView

@property (nonatomic, strong) __kindof UIView *vikSubView;

@property (nonatomic, weak) id<VIKTransformViewCancelDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame subView:(__kindof UIView *)view;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
