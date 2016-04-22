//
//  MyViewController.m
//  ZXNuoMi
//
//  Created by macmini on 16/4/19.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "MyViewController.h"
#import "UIImage+Color.h"



@interface MyViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIImageView * topImageView;

@property (nonatomic, assign) CGFloat topContentInset;

@property (nonatomic, assign) CGFloat alphaMemory;


@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    [self.view addSubview:self.tableView];
    
    [self createScaleImageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:_alphaMemory];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];

    if (_alphaMemory == 0) {
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    else {
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    }
}

#pragma mark - 初始化 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 49)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(200, 0, 0, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _tableView;
}
- (void)createScaleImageView
{
//    828 × 871 pixels
    _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth*435.5/414.0)];
    _topImageView.backgroundColor = [UIColor whiteColor];
    _topImageView.image = [UIImage imageNamed:@"backImage"];
    [self.view insertSubview:_topImageView belowSubview:_tableView];
}
#pragma mark - 设置分割线顶头
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"CELL";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text =@"测试";
    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}


#pragma mark - 滑动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetY = scrollView.contentOffset.y + _tableView.contentInset.top;//注意
        NSLog(@"%lf", offsetY);
//
//    if (offsetY > _topContentInset && offsetY <= _topContentInset * 2) {
//        
//        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
//            [self setNeedsStatusBarAppearanceUpdate];
//        }
//        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
//        
//        _alphaMemory = offsetY/(_topContentInset * 2) >= 1 ? 1 : offsetY/(_topContentInset * 2);
//        
//        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:_alphaMemory];
//        
//    }
//    else if (offsetY <= _topContentInset) {
//        
//        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
//            [self setNeedsStatusBarAppearanceUpdate];
//        }
//        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//        
//        _alphaMemory = 0;
//        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
//    }
//    else if (offsetY > _topContentInset * 2) {
//        _alphaMemory = 1;
//        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
//    }
//
    // 向下拉动，偏移量是负的。
    if (offsetY < 0) {
        // CGAffineTransformMakeScale两个参数，代表x和y方向缩放倍数。
        _topImageView.transform = CGAffineTransformMakeScale(1 + offsetY/(-500), 1 + offsetY/(-500));
    }
    CGRect frame = _topImageView.frame;
    frame.origin.y = 0;
    _topImageView.frame = frame;
}




@end
