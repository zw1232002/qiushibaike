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
        [backgroundImgView setFrame:CGRectMake(0, 0, 320, 320)];
        [self.contentView addSubview:backgroundImgView];
        
        //糗事内容
        self.textContent = [[UILabel alloc] init];
        [self.textContent setFrame:CGRectMake(20, 28, 280, 220)];
        [self.textContent setFont:[UIFont fontWithName:@"Arial" size:14]];
        [self.textContent setLineBreakMode:NSLineBreakByTruncatingTail];
        self.textContent.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.textContent];
        
        //头部图像
        self.headPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 24, 24)];
        [self.headPhoto setImage:[UIImage imageNamed:@"thumb_avatar.png"]];
        self.headPhoto.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.headPhoto];
        
        //糗事作者
        self.textAuthor = [[UILabel alloc] initWithFrame:CGRectMake(45, 2, 200, 30)];
        self.textAuthor.text = @"匿名";
        self.textAuthor.font = [UIFont fontWithName:@"Arial" size:14];
        self.textAuthor.textColor = [UIColor brownColor];
        self.textAuthor.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.textAuthor];
        
        //糗事tag
        self.textTag = [[UILabel alloc] initWithFrame:CGRectMake(45, 198, 200, 30)];
        self.textTag.text = @"摄影";
        self.textTag.font = [UIFont fontWithName:@"Arial" size:14];
        self.textTag.textColor = [UIColor brownColor];
        self.textTag.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.textTag];
        
        //tag图片
        self.TagPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(15, 200, 24, 24)];
        self.TagPhoto.image = [UIImage imageNamed:@"icon_tag.png"];
        [self.contentView addSubview:self.TagPhoto];
        
        //底部图片
        self.footView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.textContent.bounds.size.height, 320, 15)];
        self.footView.image = [UIImage imageNamed:@"block_foot_background.png"];
        [self.contentView addSubview:self.footView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
