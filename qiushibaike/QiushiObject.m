//
//  QiushiObject.m
//  qiushibaike
//
//  Created by coly on 13-5-31.
//  Copyright (c) 2013年 coly. All rights reserved.
//  糗事的实体类

#import "QiushiObject.h"

@implementation QiushiObject
@synthesize imageUrl,bigImageUrl,author,commnetsCount,downCount,content,id,tag,upCount;

//初始化实体类的属性和对应关系
- (QiushiObject *)initWithDictionary:(NSDictionary *)dictionary
{
//  self.imageUrl = [dictionary objectForKey:@"image"];
  
  self.imageUrl = @"http://i.imgur.com/r4uwx.jpg";
  
  self.id = [dictionary objectForKey:@"id"];
  
  id user = [dictionary objectForKey:@"user"];
  if ((NSNull *)user != [NSNull null])
  {
    self.author = [[dictionary objectForKey:@"user"] objectForKey:@"login"];
  }
  
  self.content = [dictionary objectForKey:@"content"];
  
  self.tag = [dictionary objectForKey:@"tag"];
  
  self.commnetsCount = [[dictionary objectForKey:@"comments_count"] intValue];
  
  self.upCount = [[[dictionary objectForKey:@"votes"] objectForKey:@"up"] intValue];
  
  self.downCount = [[[dictionary objectForKey:@"votes"] objectForKey:@"down"] intValue];
  
  return self;
}

@end
