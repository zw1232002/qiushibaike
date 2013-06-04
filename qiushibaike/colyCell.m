//
//  cell.m
//  testTableView
//
//  Created by coly on 13-5-21.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "colyCell.h"



@implementation colyCell
@synthesize textTag,textAuthor,textContent,AuthorImg,headPhoto,TagPhoto,backgroundImgView,UpButton,downButton,footView,commentButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    // Initialization code
    
    //单元格背景图
    UIImage *centerImage = [UIImage imageNamed:@"block_center_background.png"];
    backgroundImgView = [[UIImageView alloc] initWithImage:centerImage];
    [self.contentView addSubview:backgroundImgView];
  
    
    //作者图像
    self.AuthorImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 24, 24)];
//    [self.AuthorImg setImage:[UIImage imageNamed:@"thumb_avatar.png"]];
    self.AuthorImg.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.AuthorImg];
    
    //糗事作者
    self.textAuthor = [[UILabel alloc] initWithFrame:CGRectMake(45, 5, 200, 30)];
    self.textAuthor.text = @"匿名";
    self.textAuthor.font = [colyCell DefaultFont];
    self.textAuthor.textColor = [UIColor brownColor];
    self.textAuthor.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.textAuthor];
    
    
    //糗事内容
    self.textContent = [[UILabel alloc] init];
    [self.textContent setFrame:CGRectMake(20, 28, 280, 220)];
    [self.textContent setFont:[colyCell DefaultFont]];
    [self.textContent setNumberOfLines:0];
    [self.textContent setLineBreakMode:NSLineBreakByTruncatingTail];
    self.textContent.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.textContent];
    
    
    //糗事tag
    self.textTag = [[UILabel alloc] init];
    self.textTag.text = @"摄影";
    self.textTag.font = [colyCell DefaultFont];
    self.textTag.textColor = [UIColor brownColor];
    self.textTag.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.textTag];
    
    //tag图片
    self.TagPhoto = [[UIImageView alloc] init];
    self.TagPhoto.image = [UIImage imageNamed:@"icon_tag.png"];
    [self.contentView addSubview:self.TagPhoto];
    
    //底部图片
    self.footView = [[UIImageView alloc] init];
    self.footView.image = [UIImage imageNamed:@"block_foot_background.png"];
    [self.contentView addSubview:self.footView];
    
    //顶按钮
    self.UpButton = [[UIButton alloc] init];
    //设置背景
    [self.UpButton setBackgroundImage:[UIImage imageNamed:@"button_vote.png"] forState:UIControlStateNormal];
    [self.UpButton setBackgroundImage:[UIImage imageNamed:@"button_vote_active.png"] forState:UIControlStateHighlighted];
    //设置图片
    [self.UpButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 25)];
    [self.UpButton setImage:[UIImage imageNamed:@"icon_for_good.png"] forState:UIControlStateNormal];
    [self.UpButton setTitle:@"0" forState:UIControlStateNormal];
    [self.UpButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:13]];
    [self.UpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.contentView addSubview:self.UpButton];
    
    //踩按钮
    self.downButton = [[UIButton alloc] init];
    //设置背景
    [self.downButton setBackgroundImage:[UIImage imageNamed:@"button_vote.png"] forState:UIControlStateNormal];
    [self.downButton setBackgroundImage:[UIImage imageNamed:@"button_vote_active.png"] forState:UIControlStateHighlighted];
    //设置图片
    [self.downButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 25)];
    [self.downButton setImage:[UIImage imageNamed:@"icon_for_bad.png"] forState:UIControlStateNormal];
    [self.downButton setTitle:@"0" forState:UIControlStateNormal];
    [self.downButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:13]];
    [self.downButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.contentView addSubview:self.downButton];
    
    //评论按钮
    self.commentButton = [[UIButton alloc] init];
    //设置背景
    [self.commentButton setBackgroundImage:[UIImage imageNamed:@"button_vote.png"] forState:UIControlStateNormal];
    [self.commentButton setBackgroundImage:[UIImage imageNamed:@"button_vote_active.png"] forState:UIControlStateHighlighted];
    
    //设置图片
    [self.commentButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 25)];
    [self.commentButton setImage:[UIImage imageNamed:@"icon_for_comment.png"] forState:UIControlStateNormal];
    [self.commentButton setTitle:@"0" forState:UIControlStateNormal];
    [self.commentButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:13]];
    [self.commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.contentView addSubview:self.commentButton];
    
    [self resizeHeight];
   
  }
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

- (void)resizeHeight
{
  
  CGSize size = [colyCell getLabelSizeFromContent:self.textContent.text];
  
  [self.textContent setFrame:CGRectMake(20, 40, [colyCell ContentMaxSize].width, size.height)];
  
  [self setOtherElements:self.textContent.frame.size];
  
}

- (void)setOtherElements:(CGSize)textContentBounds
{
  [backgroundImgView setFrame:CGRectMake(0, 0, 320, textContentBounds.height+90)];
  
  [self.textTag setFrame:CGRectMake(43, textContentBounds.height + 40, 200, 30)];
  
  [self.TagPhoto setFrame:CGRectMake(15, textContentBounds.height + 45, 24, 24)];
  
  [self.UpButton setFrame:CGRectMake(10, textContentBounds.height + 65, 75, 32)];
  
  [self.downButton setFrame:CGRectMake(125, textContentBounds.height + 65, 75, 32)];
  
  [self.commentButton setFrame:CGRectMake(textContentBounds.width - 40, textContentBounds.height + 65, 75, 32)];
  
  [self.footView setFrame:CGRectMake(0, textContentBounds.height+90, 320, 15)];
}


+ (CGSize)getLabelSizeFromContent:(NSString *)content
{
  return [content sizeWithFont:[colyCell DefaultFont] constrainedToSize:[colyCell ContentMaxSize] lineBreakMode:NSLineBreakByTruncatingTail];
}

+ (CGFloat)getCellHeight:(NSString *)content
{
  return [colyCell getLabelSizeFromContent:content].height+110;
}

+ (UIFont *)DefaultFont
{
  return [UIFont fontWithName:@"Arial" size:14];
}

+(CGSize)ContentMaxSize
{
  return CGSizeMake(280, 220);
}


@end
