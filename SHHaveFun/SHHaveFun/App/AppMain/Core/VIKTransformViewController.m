
#import "VIKTransformViewController.h"
#import "VIKTransform.h"
#import "VIKTransformView.h"
#import "VIKCustomBottomView.h"

#define V_T_WIDTH UIScreen.mainScreen.bounds.size.width
#define V_T_HEIGHT UIScreen.mainScreen.bounds.size.height
#define V_T_height(y) [UIScreen mainScreen].bounds.size.height / 667 * y
#define V_T_width( x ) [UIScreen mainScreen].bounds.size.width / 375 * x

@interface VIKTransformViewController () <VIKCustomDelegate>

@end

@implementation VIKTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self setUpUI];
}
- (void)setUpUI {
    if (!_outView) {
        VIKCustomBottomView *subView = [[VIKCustomBottomView alloc] initWithFrame:CGRectMake(0, V_T_HEIGHT, V_T_WIDTH, V_T_height(146))];
        NSArray *titles = @[@"系统指定",@"高级专家",@"知名专家",@"指定专家",@"系统指定",@"高级专家",@"知名专家",@"指定专家"];
        NSArray *images = @[@"image1",@"image2",@"image3",@"image4",@"image1",@"image2",@"image3",@"image4"];
        
        NSMutableArray <JSAlertMultiModel *> *models = [NSMutableArray arrayWithCapacity:titles.count];
        for (NSInteger i = 0; i < titles.count; i++) {
            JSAlertMultiModel *model = [JSAlertMultiModel new];
            model.title = titles[i];
            model.imageName = images[i];
            [models addObject:model];
        }
        JSAlertAction *action = [JSAlertAction multiSelectAlertActionWithMutiModels:[models copy]];
        [subView addAction:action];
        _outView = [[VIKTransformView alloc] initWithFrame:CGRectMake(0, 0, V_T_WIDTH, V_T_HEIGHT) subView:subView];
        _outView.delegate = self;
        subView.delegate = self;
        subView.dismissDelegate = self;
    }
}

- (void)vikPush {
    [self setUpUI];
    [VIKTransform vikTransformOpen:_outView on:self.navigationController animationDistance:V_T_height(146)];
}

- (void)vikdismiss{
    [VIKTransform vikTransformClose:_outView on:self.navigationController dispose:^{
        _outView = nil;
    }];
}

- (void)vikTouchAtIndex:(NSInteger)index {
    NSLog(@"%@", @(index));
}
- (void)vikTransformDismiss {
    [self vikdismiss];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self vikPush];
}

@end
