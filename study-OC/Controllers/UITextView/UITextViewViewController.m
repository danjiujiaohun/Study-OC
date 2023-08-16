//
//  UITextViewViewController.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/16.
//

#import "UITextViewViewController.h"
#import <Masonry/Masonry.h>

@interface UITextViewViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITextField *myTextField;
@property (nonatomic, strong) UITextView *myTextView;

@end

@implementation UITextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self setupLayout];
    [self setupPlaceholder];
}

- (void)initView {
    self.title = @"UITextView";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.myTextField = [[UITextField alloc] init];
    self.myTextField.textColor = UIColor.blackColor;
    self.myTextField.font = [UIFont systemFontOfSize:16];
    self.myTextField.backgroundColor = [UIColor.grayColor colorWithAlphaComponent:0.1];
    self.myTextField.layer.cornerRadius = 8;
    self.myTextField.layer.masksToBounds = YES;
    NSDictionary *attributes = @{
        NSForegroundColorAttributeName: UIColor.lightGrayColor,
        NSFontAttributeName: [UIFont systemFontOfSize:16 weight:UIFontWeightRegular]
    };
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:attributes];
    self.myTextField.attributedPlaceholder = attributeString;
    self.myTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.myTextField.delegate = self;
    
    self.myTextView = [[UITextView alloc] init];
    self.myTextView.textColor = UIColor.blackColor;
    self.myTextView.font = [UIFont systemFontOfSize:16];
    self.myTextView.backgroundColor = [UIColor.grayColor colorWithAlphaComponent:0.1];
    self.myTextView.layer.cornerRadius = 8;
    self.myTextView.layer.masksToBounds = YES;
    self.myTextView.delegate = self;
    
    [self.view addSubview:self.myTextField];
    [self.view addSubview:self.myTextView];
}

- (void)setupLayout{
    [self.myTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(100);
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(220, 40));
    }];
    
    [self.myTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.myTextField.mas_bottom).offset(40);
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(220, 120));
    }];
}

- (void)setupPlaceholder {
    NSString *placeholderText = @"Enter your text here...";
    self.myTextView.text = placeholderText;
    self.myTextView.textColor = UIColor.lightGrayColor;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.text.length == 0) {
        return YES;
    }
    
    if (textField.text.length == 11) {
        if (string.length > 0) {
            return NO;
            
        } else {
            return YES;
        }
    }
    
    return YES;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqual: @"Enter your text here..."]) {
        textView.text = @"";
        textView.textColor = UIColor.blackColor;
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        [self setupPlaceholder];
    }
}

@end
