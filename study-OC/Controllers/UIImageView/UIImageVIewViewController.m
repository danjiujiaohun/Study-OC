//
//  UIImageVIewViewController.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/16.
//

#import "UIImageVIewViewController.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/SDWebImage.h>

@interface UIImageVIewViewController ()

@property (nonatomic, strong) UIImageView *localImageView;
@property (nonatomic, strong) UIImageView *onlineImageView;

@end

@implementation UIImageVIewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self setupLayout];
}

- (void) initView {
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"UIImageView";
    
    UIImage *localImage = [UIImage imageNamed:@"image_fruit_blueberries"];
    self.localImageView = [[UIImageView alloc] initWithImage: localImage];
    
    self.onlineImageView = [[UIImageView alloc] init];
    [self.onlineImageView sd_setImageWithURL:[NSURL URLWithString:@"https://img1.baidu.com/it/u=1026655641,4222494931&fm=253&fmt=auto&app=138&f=JPEG?w=747&h=500"]];    
    
    [self.view addSubview:self.localImageView];
    [self.view addSubview:self.onlineImageView];
}

- (void) setupLayout {
    [self.localImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];
    
    [self.onlineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.localImageView.mas_bottom).offset(50);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];
}

@end
