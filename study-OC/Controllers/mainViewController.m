//
//  mainViewController.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/6.
//

#import "mainViewController.h"
#import <Masonry/Masonry.h>
#import "mainTableViewCell.h"
#import "myTableViewViewController.h"
#import "myCollectionViewViewController.h"
#import "UIButtonViewController.h"
#import "UITextViewViewController.h"
#import "UILabelViewController.h"
#import "UIImageVIewViewController.h"

@interface mainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self setupLayout];
}

- (void) initView {
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"主页";
    
    self.titles = @[@"UIButton", @"UILabel", @"UITextView", @"UIImageView", @"UITableView", @"UICollectionView"];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.myTableView.showsVerticalScrollIndicator = NO;
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.backgroundColor = UIColor.whiteColor;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    [self.myTableView registerClass:mainTableViewCell.self forCellReuseIdentifier:NSStringFromClass(mainTableViewCell.self)];
    
    [self.view addSubview:self.myTableView];
}

- (void) setupLayout {
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view);
    }];
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    mainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(mainTableViewCell.self) forIndexPath:indexPath];
    [cell updateTitle:self.titles[section] updateContent:@""];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    if (section == 0) {
        NSLog(@"click section 0");
        UIButtonViewController *vc = [[UIButtonViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (section == 1) {
        NSLog(@"click section 1");
        UILabelViewController *vc = [[UILabelViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (section == 2) {
        NSLog(@"click section 2");
        UITextViewViewController *vc= [[UITextViewViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (section == 3) {
        NSLog(@"click section 3");
        UIImageVIewViewController *vc= [[UIImageVIewViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (section == 4) {
        NSLog(@"click section 4");
        myTableViewViewController *vc = [[myTableViewViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (section == 5) {
        NSLog(@"click section 5");
        myCollectionViewViewController *vc = [[myCollectionViewViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    
    return  view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    
    return  view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}


@end
