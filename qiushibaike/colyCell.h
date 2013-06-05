//
//  cell.h
//  testTableView
//
//  Created by coly on 13-5-21.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface colyCell : UITableViewCell

//糗事标签
@property (nonatomic, retain) UILabel *textTag;

//糗事作者
@property (nonatomic, retain) UILabel *textAuthor;

//糗事内容
@property (nonatomic, retain) UILabel *textContent;

//作者头像
@property (nonatomic, retain) UIImageView *AuthorImg;

//头部图像
@property (nonatomic, retain) UIImageView *headPhoto;

//标签图像
@property (nonatomic, retain) UIImageView *TagPhoto;

//背景图像
@property (nonatomic, retain) UIImageView *backgroundImgView;

//底部花边
@property (nonatomic, retain) UIImageView *footView;

//顶按钮
@property (nonatomic, retain) UIButton *UpButton;

//踩按钮
@property (nonatomic, retain) UIButton *downButton;

//评论按钮
@property (nonatomic, retain) UIButton *commentButton;


//根据实际的内容，重新设置内容标签的高度
- (void)resizeHeight;

//当内容改变时，根据内容的高度设置其他关联元素的位置
- (void)setOtherElements:(CGSize)textContentBounds;

//根据内容获取单元格的尺寸
+ (CGSize)getLabelSizeFromContent:(NSString *)content;

//返回cell的高度
+ (CGFloat)getCellHeight:(NSString *)content;


@end
