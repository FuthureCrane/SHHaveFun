
#import "VIKCustomBottomView.h"
#import "JSAlertMultiCell.h"
#import "JSAlertAction.h"
#import "JSAlertMultiModel.h"

#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >> 8))/255.0 blue:((s & 0xFF))/255.0  alpha:1.0]

#define vikspace (0)
#define vikwidth (UIScreen.mainScreen.bounds.size.width - vikspace - vikspace)
@interface VIKCustomBottomView () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UIView *containerView;

@property (nonatomic, strong)JSAlertAction *multiSelectAction;

@property (nonatomic, strong)UIButton *cancelBtn;

@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation VIKCustomBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)addAction:(JSAlertAction *)action{
    self.multiSelectAction = action;
}
- (void)setupUI{
    [self addSubview:self.collectionView];
    [self addSubview:self.cancelBtn];
}

- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(vikspace,
                                                               js_height(150) - (js_height(4) + js_height(44)) ,
                                                               vikwidth,
                                                               js_height(44))];
        [_cancelBtn setBackgroundImage:[self cancelButtonBackgroundImageWithCollor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [_cancelBtn setBackgroundImage:[self cancelButtonBackgroundImageWithCollor:[UIColor lightTextColor]] forState:UIControlStateHighlighted];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(vikspace, 0, vikwidth, js_height(93)) collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[JSAlertMultiCell class] forCellWithReuseIdentifier:@"JSAlertMultiCell"];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, vikwidth, js_height(93))];
        view.layer.contents = (id)[self collectionViewBackgroundImageWithColor:[UIColor whiteColor]].CGImage;
        _collectionView.backgroundView = view;
    }
    return _collectionView;
}

- (UIImage *)cancelButtonBackgroundImageWithCollor:(UIColor *)color {
    UIImage *image;
    CGRect rect = CGRectMake( 0 , 0 , UIScreen.mainScreen.bounds.size.width , 44);
    UIGraphicsBeginImageContext(rect.size);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(12, 12)];
    [color setFill];
    [path fill];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)collectionViewBackgroundImageWithColor:(UIColor *)color {
    UIImage *image;
    CGRect rect = CGRectMake( 0 , 0 , UIScreen.mainScreen.bounds.size.width , 93);
    UIGraphicsBeginImageContext(rect.size);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(12 , 12 )];
    [color setFill];
    [path fill];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)cancelAction {
    if (self.dismissDelegate && [self.dismissDelegate respondsToSelector:@selector(vikTransformDismiss)]) {
        [self.dismissDelegate vikTransformDismiss];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.multiSelectAction.models.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSAlertMultiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSAlertMultiCell" forIndexPath:indexPath];
    cell.model  = self.multiSelectAction.models[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(vikwidth / 4.0, js_height(93));
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(vikTouchAtIndex:)]) {
        [self.delegate vikTouchAtIndex:indexPath.row];
    }
    
    if (self.dismissDelegate && [self.dismissDelegate respondsToSelector:@selector(vikTransformDismiss)]) {
        [self.dismissDelegate vikTransformDismiss];
    }
}

@end
