//
//  myCollectionViewCell.h
//  study-OC
//
//  Created by 梁江斌 on 2023/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface myCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;

- (void) updateBgViewColor:(UIColor *)color;
- (void) updateCellTitle:(NSString *)title;


@end

NS_ASSUME_NONNULL_END
