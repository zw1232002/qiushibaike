//
//  MainViewController.m
//  testTableView
//
//  Created by coly on 13-5-21.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

//显示帮助视图
- (void)showHelp;

//帮助视图是否显示
@property(assign, nonatomic) BOOL isShowHelp;

@end

@implementation MainViewController
@synthesize loginButton,logo,regButton,helpButton,contentController;
@synthesize isShowHelp;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  [self initInterface];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)showHelp
{
  if (self.isShowHelp)
  {
    [UIView animateWithDuration:0.8f animations:^{
      self.isShowHelp = NO;
      [self.back_helpView setAlpha:0.f];
      [self.helpImageView setFrame:CGRectMake(0, 720-44-229, 320, 209)];
    }];
    
  }else
  {
    [UIView animateWithDuration:0.8f animations:^{
      self.isShowHelp = YES;
      [self.back_helpView setAlpha:0.85f];
      [self.helpImageView setFrame:CGRectMake(0, 480-44-229, 320, 209)];
    }];
   
  }
}


/*
 * 初始化界面，创建所有的图形元素
 */
- (void)initInterface
{
  //设置背景色
  [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"main_background.png"]]];
  
  //设置header
  UIImage *headerImage = [UIImage imageNamed:@"head_background.png"];
  UIImageView *headerImageView = [[UIImageView alloc] initWithImage:headerImage];
  [headerImageView setFrame:CGRectMake(0, 0, 320, 44)];
  [self.view addSubview:headerImageView];
  
  //设置logo
  UIImage *logoImage = [UIImage imageNamed:@"head_logo.png"];
  UIImageView *logoView = [[UIImageView alloc] initWithImage:logoImage];
  [logoView setFrame:CGRectMake(103, 6, 113, 32)];
  [self.view addSubview:logoView];
  
  //内容
  self.contentController = [[ContentViewController alloc] initWithNibName:@"ContentViewController" bundle:nil];
//  [self.contentController.view setFrame:CGRectMake(0, 44, kDeviceWidth , kDeviceHeight - 44*2)];
  [self.view addSubview:self.contentController.view];
  
  self.isShowHelp = NO;
  
  //点击帮助按钮出来的视图
  self.back_helpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
  [self.back_helpView setBackgroundColor:[UIColor blackColor]];
  [self.back_helpView setAlpha:0.f];
  [self.view addSubview:self.back_helpView];
  
  //帮助图像
  UIImage *helpImage = [UIImage imageNamed:@"block_help.png"];
  self.helpImageView = [[UIImageView alloc] initWithImage:helpImage];
  self.helpImageView.frame = CGRectMake(0, 720-44-229, 320, 209);
  [self.view addSubview:self.helpImageView];
  //开启imageView的interaction属性，以便关闭按钮的事件能够起作用
  [self.helpImageView setUserInteractionEnabled:YES];
  
  //关闭按钮
  UIButton *closeButton = [UIButton new];
  closeButton.frame = CGRectMake(280, 12, 24, 24);
  [closeButton setBackgroundImage:[UIImage imageNamed:@"icon_close.png"] forState:UIControlStateNormal];
  [closeButton addTarget:self action:@selector(showHelp) forControlEvents:UIControlEventTouchUpInside];
  [self.helpImageView addSubview:closeButton];
  
  
  //底部图片
  UIImage *barImage = [UIImage imageNamed:@"bar_background.png"];
  UIImageView *barView = [[UIImageView alloc] initWithImage:barImage];
  [barView setFrame:CGRectMake(0, 480 -44 -20, 320, 44)];
  [self.view addSubview:barView];
  
  //登陆按钮
  self.loginButton = [UIButton new];
  self.loginButton.frame = CGRectMake(10, 480 -44 -20+5, 62, 40);
  [self.loginButton setBackgroundImage:[UIImage imageNamed:@"button_login.png"] forState:UIControlStateNormal];
  [self.loginButton setBackgroundImage:[UIImage imageNamed:@"button_login_active.png"] forState:UIControlStateHighlighted];
  [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
  [self.loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [self.loginButton.titleLabel setFont:[UIFont fontWithName:@"AppleGothic" size:16]];
  [self.view addSubview:self.loginButton];
  
  
  //帮助按钮
  self.helpButton = [UIButton new];
  self.helpButton.frame = CGRectMake(kDeviceWidth-50, 480 -44 -20 +5, 42, 32);
  [self.helpButton setBackgroundImage:[UIImage imageNamed:@"icon_help.png"] forState:UIControlStateNormal];
  [self.helpButton setBackgroundImage:[UIImage imageNamed:@"icon_help_active.png"] forState:UIControlStateHighlighted];
  [self.helpButton addTarget:self action:@selector(showHelp) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.helpButton];
}




@end
