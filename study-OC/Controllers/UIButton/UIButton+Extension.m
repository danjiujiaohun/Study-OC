//
//  UIButton+Extension.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/16.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (UIButton *)setTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    return button;
}

@end
