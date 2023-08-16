//
//  mainTableViewCell.h
//  study-OC
//
//  Created by 梁江斌 on 2023/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface mainTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *content;

- (void) updateTitle:(NSString *)title updateContent:(NSString *) content;

@end

NS_ASSUME_NONNULL_END
