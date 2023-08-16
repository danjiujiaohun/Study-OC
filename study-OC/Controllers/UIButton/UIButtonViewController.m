//
//  UIButtonViewController.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/16.
//

#import "UIButtonViewController.h"
#import "UIButton+Extension.h"
#import <Masonry/Masonry.h>

@interface UIButtonViewController ()

@property (nonatomic, strong) UIButton *normalButton;
@property (nonatomic, strong) UIButton *backgroundButton;
@property (nonatomic, strong) UIButton *outerButton;

@end

@implementation UIButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self setupLayout];
}

- (void) initView {
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"UIButton";
    
    self.normalButton = [UIButton setTitle:@"normal" titleColor:UIColor.greenColor fontSize:28];
    [self.normalButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.backgroundButton = [UIButton setTitle:@"backgroundButton" titleColor:UIColor.whiteColor fontSize:28];
    self.backgroundButton.frame = CGRectMake(0, 0, 240, 40);
    self.backgroundButton.backgroundColor = [UIColor.greenColor colorWithAlphaComponent:0.2];
    self.backgroundButton.layer.cornerRadius = 20;
    self.backgroundButton.layer.masksToBounds = YES;
    [self.backgroundButton addTarget:self action:@selector(clickBackgroundButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.outerButton = [UIButton setTitle:@"outerButton" titleColor:UIColor.redColor fontSize:28];
    self.outerButton.frame = CGRectMake(0, 0, 180, 40);
    self.outerButton.layer.cornerRadius = 20;
    self.outerButton.layer.masksToBounds = YES;
    self.outerButton.layer.borderColor = UIColor.redColor.CGColor;
    self.outerButton.layer.borderWidth = 1;
    [self.outerButton addTarget:self action:@selector(clickOuterButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.normalButton];
    [self.view addSubview:self.backgroundButton];
    [self.view addSubview:self.outerButton];
}

- (void) setupLayout {
    [self.normalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 40));
    }];
    
    [self.backgroundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.normalButton.mas_bottom).offset(50);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(240, 40));
    }];
    
    [self.outerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroundButton.mas_bottom).offset(50);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(180, 40));
    }];
}

- (void)clickButton:(UIButton *)sender {
    NSLog(@"click button test");
}

- (void)clickBackgroundButton:(UIButton *)sender {
    NSLog(@"click background Button");
}

- (void)clickOuterButton:(UIButton *)sender {
    NSLog(@"click outerButton");
}


@end
