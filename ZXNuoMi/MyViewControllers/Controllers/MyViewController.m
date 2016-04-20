//
//  MyViewController.m
//  ZXNuoMi
//
//  Created by macmini on 16/4/19.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "MyViewController.h"
#import <Masonry/Masonry.h>
#import "UIImage+Color.h"



@interface MyViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) NSArray *dataSource;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}
-(void)initData
{
    self.title = @"我的";
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor:[UIColor whiteColor]};
    _dataSource = @[@"北京",@"河北",@"天津",@"河南",@"广西",@"广东",@"湖南",@"湖北",@"山东",@"山西",@"陕西",@"新疆",@"西藏",@"青海",@"宁夏",@"福建",@"四川",@"成都",@"上海",@"浙江",@"江苏",@"江西",@"辽宁",@"黑龙江",@"吉林"];

}
-(void)initView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    [self.view addSubview:self.myTableView];
    
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view.mas_top).offset(64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
        make.width.equalTo(self.view.mas_width);
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 64) {
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    }else{
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor redColor] size:CGSizeMake(self.view.bounds.size.width, 64)] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setTintColor:[UIColor clearColor]];
    }
//    self.headerView.offsetY = offsetY;
//    
//    if (offsetY > 100) {
//        [self.navigationController setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//        [self.navigationController setTitleColor:[UIColor whiteColor]];
//    }else{
//        [self.navigationController setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
//        [self.navigationController setTitleColor:[UIColor clearColor]];
//    }
}

@end
