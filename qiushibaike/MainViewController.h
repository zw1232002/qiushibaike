//
//  MainViewController.h
//  testTableView
//
//  Created by coly on 13-5-21.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentViewController.h"

@interface MainViewController : UIViewController

//logo
@property (nonatomic ,retain) UIImageView *logo;

//登陆按钮
@property (nonatomic, retain) UIButton *loginButton;

//注册按钮
@property (nonatomic, retain) UIButton *regButton;

//帮助按钮
@property (nonatomic, retain) UIButton *helpButton;

//内容视图
@property(retain, nonatomic) ContentViewController *contentController;

@end
