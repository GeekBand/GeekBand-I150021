//
//  GBMainViewController.m
//  MoRan
//
//  Created by 王祖康 on 15/8/16.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "GBMainViewController.h"
#import "GBMyViewController.h"
#import "GBSquareViewController.h"
#import "GBTabBar.h"

@interface GBMainViewController ()<GBTabBarDelegate>
{
    
}

@end

@implementation GBMainViewController

#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化squareViewController和myViewController，并添加到UITabBarController
    UIStoryboard *mainStroyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    GBSquareViewController *squareViewController=[mainStroyboard instantiateViewControllerWithIdentifier:@"GBSquareViewController"];
    [self addChildController:squareViewController title:@"广场" imageName:@"square"];
    
    GBMyViewController *myViewController=[mainStroyboard instantiateViewControllerWithIdentifier:@"GBMyViewController"];
    [self addChildController:myViewController title:@"我的" imageName:@"my"];
   
    //使用KVC方式，更换系统自带的UITabBar
    GBTabBar *tabBar = [[GBTabBar alloc] init];
    tabBar.tabBarDelegate=self;
    //去除TabBar黑线，并设置背景颜色
    tabBar.shadowImage=[[UIImage alloc] init];
    tabBar.backgroundImage=[[UIImage alloc] init];
    tabBar.backgroundColor=[UIColor getColor:@"ebecec"];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - GBTabBarDelegate Method

-(void)tabBarDidClickPublishButton:(GBTabBar *)tabBar
{
   
}

//添加子控制器到UITabBarController中
-(void)addChildController:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName
{
    childViewController.title=title;
    
    //图片
    childViewController.tabBarItem.image=[UIImage imageNamed:imageName];
    childViewController.tabBarItem.selectedImage=[[UIImage imageNamed:
                                                  [NSString stringWithFormat:@"%@%@",imageName,@"_selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //文本样式
    [childViewController.tabBarItem setTitleTextAttributes:
                                    @{NSForegroundColorAttributeName:[UIColor getColor:@"a8a8a9"]}
                                                  forState:UIControlStateNormal];
    [childViewController.tabBarItem setTitleTextAttributes:
                                    @{NSForegroundColorAttributeName:[UIColor getColor:@"ee7f4l"]}
                                                  forState:UIControlStateSelected];
    
    UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:childViewController];
    
    [self addChildViewController:navigationController];
    
}

@end
