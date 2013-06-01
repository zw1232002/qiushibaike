//
//  QiushiObject.h
//  qiushibaike
//
//  Created by coly on 13-5-31.
//  Copyright (c) 2013年 coly. All rights reserved.
//  糗事的实体类

#import <Foundation/Foundation.h>

@interface QiushiObject : NSObject

//图片地址
@property(copy, nonatomic) NSString *imageUrl;

//大图片地址
@property(copy, nonatomic) NSString *bigImageUrl;

//标签
@property(copy, nonatomic) NSString *tag;

//糗事ID
@property(copy, nonatomic) NSString *id;

//糗事作者
@property(copy, nonatomic) NSString *author;

//糗事内容
@property(copy, nonatomic) NSString *content;

//顶的数量
@property(assign, nonatomic) int upCount;

//踩的数量
@property(assign, nonatomic) int downCount;

//评论数量
@property(assign, nonatomic) int commnetsCount;

//初始化实体类的属性和对应关系
- (QiushiObject *)initWithDictionary:(NSDictionary *)dictionary;

@end
