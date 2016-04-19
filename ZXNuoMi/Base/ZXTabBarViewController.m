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

    // 改变UITabBarItem字体颜色
    [[UITabBarItem appearance]setTitleTextAttributes:@{UITextAttributeTextColor:navigationBarColor} forState:UIControlStateSelected];
    
}






@end
