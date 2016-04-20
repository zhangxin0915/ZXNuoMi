//
//  ZXTabBarViewController.m
//  ZXNuoMi
//
//  Created by macmini on 16/4/19.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "ZXTabBarViewController.h"
#import "Define.h"


@interface ZXTabBarViewController ()

@end

@implementation ZXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBarItem];
}

-(void)setupTabBarItem
{
    UITabBar *tabbar = self.tabBar;
    UITabBarItem *item0 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:3];
    
    item0.selectedImage = [[UIImage imageNamed:@"icon_tab_shouye_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.image = [[UIImage imageNamed:@"icon_tab_shouye_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.selectedImage = [[UIImage imageNamed:@"icon_tab_fujin_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"icon_tab_fujin_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"tab_icon_selection_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"tab_icon_selection_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [[UIImage imageNamed:@"icon_tab_wode_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"icon_tab_wode_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 改变UITabBarItem字体颜色
    [[UITabBarItem appearance]setTitleTextAttributes:@{UITextAttributeTextColor:navigationBarColor} forState:UIControlStateSelected];
}






@end
