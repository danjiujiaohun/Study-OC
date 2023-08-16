//
//  myCollectionViewCell.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/8.
//

#import "myCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation myCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initView];
    [self setupLayout];
    
    return self;
}

- (void) initView {
    self.backgroundColor = UIColor.clearColor;
    
    self.bgView = [[UIView alloc] init];
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.masksToBounds = YES;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = UIColor.blackColor;
    self.titleLabel.font = [UIFont systemFontOfSize:22];
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.titleLabel];
}

- (void) setupLayout {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.bgView);
    }];
}

- (void)updateBgViewColor:(nonnull UIColor *)color {
    self.bgView.backgroundColor = color;
}

- (void)updateCellTitle:(nonnull NSString *)title {
    self.titleLabel.text = title;
}

@end
