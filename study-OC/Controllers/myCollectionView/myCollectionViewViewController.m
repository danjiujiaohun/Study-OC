//
//  myCollectionViewViewController.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/8.
//

#import "myCollectionViewViewController.h"
#import "myCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface myCollectionViewViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property NSInteger horizontalTag;
@property NSInteger listTag;

@property (nonatomic, strong) UICollectionView *horizontalCollectionView;

@property (nonatomic, strong) UICollectionView *listCollectionView;

@end

@implementation myCollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self initView];
    [self setupLayout];
}

- (void) initView {
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"UICollectionView";
    
    self.horizontalTag = 1001;
    self.listTag = 1002;
    
    UICollectionViewFlowLayout *horizontalLayout = [[UICollectionViewFlowLayout alloc] init];
    horizontalLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.horizontalCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:horizontalLayout];
    self.horizontalCollectionView.backgroundColor = [UIColor.grayColor colorWithAlphaComponent:0.1];
    self.horizontalCollectionView.showsHorizontalScrollIndicator = NO;
    self.horizontalCollectionView.pagingEnabled = NO;
    self.horizontalCollectionView.tag = self.horizontalTag;
    self.horizontalCollectionView.delegate = self;
    self.horizontalCollectionView.dataSource = self;
    
    [self.horizontalCollectionView registerClass:myCollectionViewCell.self forCellWithReuseIdentifier:NSStringFromClass(myCollectionViewCell.self)];
    
    UICollectionViewFlowLayout *listLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.listCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:listLayout];
    self.listCollectionView.backgroundColor = [UIColor.brownColor colorWithAlphaComponent:0.1];
    self.listCollectionView.showsHorizontalScrollIndicator = NO;
    [self.listCollectionView setPagingEnabled: NO];
    self.listCollectionView.tag = self.listTag;
    self.listCollectionView.delegate = self;
    self.listCollectionView.dataSource = self;
    
    [self.listCollectionView registerClass:myCollectionViewCell.self forCellWithReuseIdentifier:NSStringFromClass(myCollectionViewCell.self)];
    
    
    [self.view addSubview:self.horizontalCollectionView];
    [self.view addSubview:self.listCollectionView];
}

- (void) setupLayout {
    [self.horizontalCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(90);
            make.left.mas_equalTo(self.view).offset(16);
            make.right.mas_equalTo(self.view).offset(-16);
            make.height.mas_equalTo(80);
    }];
    
    [self.listCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.horizontalCollectionView.mas_bottom).offset(40);
            make.left.equalTo(self.horizontalCollectionView);
            make.right.equalTo(self.horizontalCollectionView);
            make.bottom.equalTo(self.view);
    }];
}

#pragma mark - UICollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView.tag == self.horizontalTag) {
        return 6;
    } else {
        return 8;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    myCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(myCollectionViewCell.self) forIndexPath:indexPath];
    if (row % 2 == 0) {
        [cell updateBgViewColor:UIColor.redColor];
    } else {
        [cell updateBgViewColor:UIColor.greenColor];
    }
    [cell updateCellTitle:[NSString stringWithFormat:@"%ld", row]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView.tag == self.horizontalTag) {
        return CGSizeMake(60, 60);
    } else {
        return CGSizeMake(100, 100);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (collectionView.tag == self.horizontalTag) {
        return UIEdgeInsetsMake(0, 10, 0, 10);
    } else {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
}

/// 行之间
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (collectionView.tag == self.horizontalTag) {
        return 10;
    } else {
        return 20;
    }
}

/// 列之间
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (collectionView.tag == self.horizontalTag) {
        return 0;
    } else {
        return 10;
    }
}


@end
