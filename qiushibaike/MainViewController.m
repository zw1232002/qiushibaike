//
//  MainViewController.m
//  testTableView
//
//  Created by coly on 13-5-21.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController
@synthesize loginButton,logo,regButton,helpButton;

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
  [self.contentController.view setFrame:CGRectMake(0, 44, kDeviceWidth, kDeviceHeight-44*2)];
  [self.view addSubview:self.contentController.view];
  
  
}




@end
