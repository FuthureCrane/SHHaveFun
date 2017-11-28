//
//  HeaderView.m
//  loadSearch
//
//  Created by Futhure on 2017/11/22.
//  Copyright © 2017年 Futhure. All rights reserved.
//

#import "HeaderView.h"
//#define TestConfigFlag

@interface TZTHeaderViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, copy) NSString *text;

@end

@implementation TZTHeaderViewCell

- (UILabel *)label
{
    if (!_label)
    {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:15];
        _label.adjustsFontSizeToFitWidth = YES;
        _label.layer.cornerRadius = 5;
        _label.layer.borderWidth = 1;
        _label.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _label;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareUI];
    }
    return self;
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.label.text = text;
}

- (void)prepareUI
{
    [self.contentView addSubview:self.label];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.contentView.bounds;
    rect.origin.x = 5;
    rect.origin.y = 5;
    rect.size.width -= 10;
    rect.size.height -= 10;
    self.label.frame = rect;
}

@end

#define _tzt_Sort_Width  [UIScreen mainScreen].bounds.size.width
#define _tzt_Sort_Height [UIScreen mainScreen].bounds.size.height
#define _tzt_Sort_Item_Width (CGFloat)((_tzt_Sort_Width - 20) * 0.25)

@interface HeaderViewHeader : UICollectionReusableView

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation HeaderViewHeader

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.font = [UIFont systemFontOfSize:13];
    }
    return _textLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor blackColor];
    }
    return _lineView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textLabel];
        [self addSubview:self.lineView];
    }
    return self;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.textLabel.text = text;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    CGFloat fwidht = frame.size.width;
    CGFloat fheight = frame.size.height;
    CGFloat lineheight = 0.5;
    CGFloat space = 5.0;
    
    self.textLabel.frame = CGRectMake(0, 0, (fwidht - 20.0) / 4.0 , fheight);
    self.lineView.frame = CGRectMake(self.textLabel.frame.size.width + space, (fheight - lineheight) / 2.0, fwidht - (self.textLabel.frame.size.width + space), lineheight);
 
}

@end

@interface HeaderView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *recommandArray;

@property (nonatomic, strong) NSMutableArray *hotStockArray;

@property (nonatomic, strong) NSMutableArray *headerTextArray;

@property (nonatomic, strong) NSMutableArray *footerTextArray;

@property (nonatomic, strong) NSMutableArray *recentTextArray;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HeaderView

- (NSMutableArray *)recommandArray {
    if (!_recommandArray) {
        _recommandArray = @[@"智能选股"].mutableCopy;
    }
    return _recommandArray;
}

- (NSMutableArray *)hotStockArray {
    if (!_hotStockArray) {
        _hotStockArray = @[@"新兴铸管", @"永和智控", @"北新路桥", @"浙大网新", @"江特电机", @"先河环保", @"瑞斯康达", @"圣龙股份"].mutableCopy;
    }
    return _hotStockArray;
}

- (NSMutableArray *)headerTextArray {
    if (!_headerTextArray) {
        _headerTextArray = @[@"推荐功能", @"热搜股票", @"最近浏览"].mutableCopy;
    }
    return _headerTextArray;
}

- (NSMutableArray *)recentTextArray {
    if (!_recentTextArray) {
        _recentTextArray = @[@"新兴铸管", @"永和智控", @"北新路桥", @"浙大网新", @"江特电机", @"先河环保", @"瑞斯康达", @"圣龙股份"].mutableCopy;
    }
    return _recentTextArray;
}

- (NSMutableArray *)footerTextArray {
    if (!_footerTextArray) {
        _footerTextArray = @[@"最近浏览"].mutableCopy;
    }
    return _footerTextArray;
}

- (instancetype)initWithWidth:(CGFloat)width {
    self = [super initWithFrame:CGRectMake(0, 0, width, 0)];
    if (self) {
        [self setUpUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setUpUI {
    [self addSubview:self.collectionView];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        CGRect rect = self.bounds;
        _collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[TZTHeaderViewCell class] forCellWithReuseIdentifier:@"headerCell"];
        [_collectionView registerClass:[HeaderViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerHeader"];
        [_collectionView registerClass:[HeaderViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"headerFooter"];
    }
    return _collectionView;
}

// UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section ==0 ) {
        return self.recommandArray.count;
    } else if (section == 1) {
        return self.hotStockArray.count;
    } else {
        return self.recentTextArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTHeaderViewCell *cell = (TZTHeaderViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"headerCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.label.text = self.recommandArray[indexPath.item];
    } else if (indexPath.section == 1){
        cell.label.text = self.hotStockArray[indexPath.item];
    } else {
        cell.label.text = self.recentTextArray[indexPath.item];
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HeaderViewHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerHeader" forIndexPath:indexPath];
    header.text = self.headerTextArray[indexPath.section];
    return header;
}

// UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(_tzt_Sort_Width, 30);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return CGSizeMake(_tzt_Sort_Item_Width * 4, 40);
    }else {
        return CGSizeMake(_tzt_Sort_Item_Width, 40);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

// UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
}

- (void)reloadWithData:(NSArray *)data {
    CGRect f = self.frame;
    f.size.height = 160;
    f.size.height = 120;
//    f.size.height = 210;
    f.size.height = 420;
    self.frame = f;
    
    self.collectionView.frame = self.frame;
    [self.collectionView reloadData];
}


@end
