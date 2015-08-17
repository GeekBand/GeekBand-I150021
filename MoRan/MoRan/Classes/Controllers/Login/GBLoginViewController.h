//
//  GBLoginViewController.h
//  MoRan
//
//  Created by 王祖康 on 15/8/13.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBBaseViewController.h"
#import "AppDelegate.h"
#import "UIColor+Extend.h"

@interface GBLoginViewController : GBBaseViewController<UITextFieldDelegate>
{
    BOOL keyBoardVisible;
}

@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollView;

@end
