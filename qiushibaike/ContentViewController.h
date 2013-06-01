//
//  ContentViewController.h
//  qiushibaike
//
//  Created by coly on 13-5-22.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController

//糗事列表
@property (retain, nonatomic) NSMutableArray *list;

//存储所有cell高度的数组
@property (retain, nonatomic) NSMutableArray *cellHeightArray;

//获取糗事列表
- (void)getResult;

//根据内容，动态获取高度
- (CGFloat)getTheHeight:(NSInteger)row;

@end
