
#import "VIKTransformView.h"

@implementation VIKTransformView

- (instancetype)initWithFrame:(CGRect)frame subView:(__kindof UIView *)view {
    self = [super initWithFrame:frame];
    if (self) {
        _vikSubView = view;
        [self addSubview:view];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (self.delegate && [self.delegate respondsToSelector:@selector(vikTransformDismiss)]) {
        [self.delegate vikTransformDismiss];
    }
}

- (void)dealloc
{
    NSLog(@"tr view delete ");
}

@end
