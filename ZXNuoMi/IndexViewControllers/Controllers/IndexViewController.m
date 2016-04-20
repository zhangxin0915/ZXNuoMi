//
//  IndexViewController.m
//  ZXNuoMi
//
//  Created by macmini on 16/4/19.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "IndexViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <AFNetworking/AFNetworking.h>


@interface IndexViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *indexTabelView;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initView];
}
-(void)initView
{
    self.indexTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 499) style:UITableViewStyleGrouped];
    self.indexTabelView.delegate = self;
    self.indexTabelView.dataSource =self;
    [self.view addSubview: self.indexTabelView];

    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    UIImage *image = [UIImage imageNamed:@"icon_refresh_1"];
    NSMutableArray *idleImages = [NSMutableArray arrayWithObjects:image, nil];
    // 设置普通状态的动画图片
    [header setImages:idleImages forState:MJRefreshStateIdle];
    NSMutableArray *pullingImages = [NSMutableArray array];
    NSMutableArray *refreshingImages =[NSMutableArray array];
    for (int i = 1; i < 8; i ++) {
        NSString *imgstr = [NSString stringWithFormat:@"icon_refresh_%d",i];
        UIImage *image = [UIImage imageNamed:imgstr];
        [pullingImages addObject:image];
        [refreshingImages addObject:image];
    }
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    // 设置header
    self.indexTabelView.mj_header = header;
    [self.indexTabelView.mj_header beginRefreshing];
}
- (void)loadMoreData
{
    

}
- (void)loadNewData
{
    [self.indexTabelView.mj_header endRefreshing];
    
}
#pragma -  UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
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
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}





@end
