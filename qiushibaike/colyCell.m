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
        [backgroundImgView setFrame:CGRectMake(0, 0, 320, 220)];
        [self.contentView addSubview:backgroundImgView];
        
        //糗事内容
        self.textContent = [[UILabel alloc] init];
        [self.textContent setFrame:CGRectMake(20, 28, 280, 220)];
        [self.textContent setFont:[UIFont fontWithName:@"Arial" size:14]];
        [self.textContent setLineBreakMode:NSLineBreakByTruncatingTail];
        self.textContent.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.textContent];
        
        //糗事内容的frame
        CGSize textContentBounds = self.textContent.bounds.size;
        
        
        //头部图像
        self.headPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 24, 24)];
        [self.headPhoto setImage:[UIImage imageNamed:@"thumb_avatar.png"]];
        self.headPhoto.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.headPhoto];
        
        //糗事作者
        self.textAuthor = [[UILabel alloc] initWithFrame:CGRectMake(45, 5, 200, 30)];
        self.textAuthor.text = @"匿名";
        self.textAuthor.font = [UIFont fontWithName:@"Arial" size:14];
        self.textAuthor.textColor = [UIColor brownColor];
        self.textAuthor.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.textAuthor];
        
        //糗事tag
        self.textTag = [[UILabel alloc] initWithFrame:CGRectMake(43, textContentBounds.height - 53, 200, 30)];
        self.textTag.text = @"摄影";
        self.textTag.font = [UIFont fontWithName:@"Arial" size:14];
        self.textTag.textColor = [UIColor brownColor];
        self.textTag.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.textTag];
        
        //tag图片
        self.TagPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(15, textContentBounds.height - 50, 24, 24)];
        self.TagPhoto.image = [UIImage imageNamed:@"icon_tag.png"];
        [self.contentView addSubview:self.TagPhoto];
        
        //底部图片
        self.footView = [[UIImageView alloc] initWithFrame:CGRectMake(0, textContentBounds.height, 320, 15)];
        self.footView.image = [UIImage imageNamed:@"block_foot_background.png"];
        [self.contentView addSubview:self.footView];
        
        //顶按钮
        self.UpButton = [[UIButton alloc] initWithFrame:CGRectMake(10, textContentBounds.height - 25, 70, 32)];
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
        self.downButton = [[UIButton alloc] initWithFrame:CGRectMake(125, textContentBounds.height - 25, 70, 32)];
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
        self.commentButton = [[UIButton alloc] initWithFrame:CGRectMake(textContentBounds.width - 40, textContentBounds.height - 25, 70, 32)];
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
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
