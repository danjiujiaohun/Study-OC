//
//  UILabelViewController.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/16.
//

#import "UILabelViewController.h"
#import "UILabel+Extension.h"
#import <Masonry/Masonry.h>

@interface UILabelViewController ()

@property (nonatomic, strong) UILabel *normalLabel;
@property (nonatomic, strong) UILabel *boldLabel;

@end

@implementation UILabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self setupLayout];
}

- (void) initView {
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"UILabel";
    
    self.normalLabel = [UILabel content:@"normalLabel" textColor:UIColor.redColor fontSize:22];
    
    self.boldLabel = [UILabel content:@"boldLabel" textColor:UIColor.blackColor fontSize:24];
    self.boldLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
    
    [self.view addSubview:self.normalLabel];
    [self.view addSubview:self.boldLabel];
}

- (void) setupLayout {
    [self.normalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.centerX.mas_equalTo(self.view);
    }];
    
    [self.boldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.normalLabel).offset(50);
        make.centerX.mas_equalTo(self.view);
    }];
    
}

@end
