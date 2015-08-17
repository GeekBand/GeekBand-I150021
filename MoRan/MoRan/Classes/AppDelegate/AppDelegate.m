//
//  AppDelegate.m
//  MoRan
//
//  Created by 王祖康 on 15/8/10.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "AppDelegate.h"
#import "GBMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Custom Methods

-(void)loadLoginFrame
{
    UIStoryboard *loginStroyboard=[UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
    
    UINavigationController *navigationController=loginStroyboard.instantiateInitialViewController;
    
    self.window.rootViewController=navigationController;
}

-(void)loadMainFrame
{
    GBMainViewController *mainViewController=[[GBMainViewController alloc]init];
    self.window.rootViewController=mainViewController;
}

#pragma mark - Application LifeCycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /*
     若用户已经登录，则加载MainStoryBoard
     若用户未登录，则加载LoginStoryBoard
     */
    [self loadLoginFrame];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
