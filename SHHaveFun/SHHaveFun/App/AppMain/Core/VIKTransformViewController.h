
#import <UIKit/UIKit.h>
#import "VIKTransform.h"
#import "VIKTransformView.h"

@interface VIKTransformViewController : UIViewController <VIKTransformViewCancelDelegate>

@property (nonatomic, strong) VIKTransformView *outView;
- (void)vikPush ;
@end
