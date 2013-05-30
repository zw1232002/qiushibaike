//
//  ContentViewController.h
//  qiushibaike
//
//  Created by coly on 13-5-22.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController

@property (retain, nonatomic) NSDictionary *list;

//获取糗事列表
- (void)getResult;

@end
