//
//  myTableViewViewController.m
//  study-OC
//
//  Created by 梁江斌 on 2023/8/6.
//

#import "myTableViewViewController.h"
#import <Masonry/Masonry.h>
#import "myTableViewCell.h"

@interface myTableViewViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation myTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self setupLayout];
}

- (void)initView {
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"UITableView";
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.myTableView.showsVerticalScrollIndicator = NO;
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.backgroundColor = UIColor.whiteColor;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    [self.myTableView registerClass:myTableViewCell.self forCellReuseIdentifier:NSStringFromClass(myTableViewCell.self)];
    
    [self.view addSubview:self.myTableView];
}

- (void)setupLayout {
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.equalTo(self.view).offset(12);
            make.right.equalTo(self.view).offset(-12);
            make.bottom.equalTo(self.view);
    }];
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    myTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(myTableViewCell.self) forIndexPath:indexPath];
    [cell updateTitle:@"Cell的位次" updateContent:[NSString stringWithFormat:@"%ld", row+1]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}



@end
