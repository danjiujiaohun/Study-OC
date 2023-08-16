//
//  mainTableViewCell.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/8.
//

#import "mainTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation mainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self initView];
    [self setupLayout];
    
    return self;
}

- (void) initView {
    self.layer.cornerRadius = 20;
    self.clipsToBounds = YES;
    
    self.contentView.backgroundColor = [UIColor.greenColor colorWithAlphaComponent:0.4];
    
    self.title = [[UILabel alloc] init];
    self.title.textColor = UIColor.blackColor;
    
    self.content = [[UILabel alloc] init];
    self.content.textColor = UIColor.redColor;
    
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.content];
}

- (void) setupLayout {
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView).offset(15);
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView).offset(-15);
    }];
}

- (void) updateTitle:(NSString *)title updateContent:(NSString *)content {
    self.title.text = title;
    self.content.text = content;
}

@end
