//
//  GBLoginViewController.m
//  MoRan
//
//  Created by 王祖康 on 15/8/13.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "GBLoginViewController.h"

@interface GBLoginViewController ()

@end

@implementation GBLoginViewController

#pragma mark - View LifeCycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initControlTheme];
    
    self.emailTextField.delegate=self;
    self.passwordTextField.delegate=self;
    
    //注册键盘显示和隐藏通知
    [[NSNotificationCenter defaultCenter ] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter ] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

//初始化页面控件样式
-(void)initControlTheme
{
    self.bannerView.backgroundColor=[UIColor getColor:@"ee7f4l"];
    self.loginButton.backgroundColor=[UIColor getColor:@"ee7f4l"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Button Action

- (IBAction)login:(UIButton *)sender {
    
    [self loadMainStoryBorad];
    
}

#pragma mark - LoadMainStoryBoard

//加载主界面
-(void)loadMainStoryBorad
{
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [appDelegate loadMainFrame];
}

#pragma mark - TextField Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Keyboard Show And Hide

-(void) keyboardDidShow:(NSNotification *)notification
{
    //如果键盘已经出现，要忽略通知
    if (keyBoardVisible) {
        return;
    }

    //获取键盘尺寸
    NSDictionary *info=[notification userInfo];
    NSValue *aValue=[info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize=[aValue CGRectValue].size;
    
    //重新定义ScrollView的尺寸
    CGRect viewFrame=self.loginScrollView.frame;
    viewFrame.size.height-=keyboardSize.height;
    self.loginScrollView.frame=viewFrame;
    
    //滚动到当前文本框
    CGRect textFieldRect;
    if (self.emailTextField.isFirstResponder)
    {
        textFieldRect=self.emailTextField.frame;
    }
    else if(self.passwordTextField.isFirstResponder)
    {
        textFieldRect=self.passwordTextField.frame;
    }
    
    [self.loginScrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyBoardVisible=YES;
}

-(void) keyboardDidHide:(NSNotification *)notification
{
    //获取键盘尺寸
    NSDictionary *info=[notification userInfo];
    NSValue *aValue=[info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize=[aValue CGRectValue].size;
    
    //重新定义ScrollView的尺寸
    CGRect viewFrame=self.loginScrollView.frame;
    viewFrame.size.height+=keyboardSize.height;
    self.loginScrollView.frame=viewFrame;
    
    if (!keyBoardVisible) {
        return;
    }
    
    keyBoardVisible=NO;
}

@end
