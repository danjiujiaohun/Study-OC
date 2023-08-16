//
//  UILabel+Extension.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/16.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (nonnull UILabel *)content:(nonnull NSString *)content textColor:(nonnull UIColor *)textColor fontSize:(CGFloat)fontSize {
    UILabel *label = [[UILabel alloc] init];
    label.text = content;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}

@end
