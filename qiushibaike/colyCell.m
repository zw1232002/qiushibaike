//
//  cell.m
//  testTableView
//
//  Created by coly on 13-5-21.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "colyCell.h"

@implementation colyCell
@synthesize textTag,textAuthor,textContent,AuthorImg,TagPhoto,backgroundImg,UpButton,downButton,footView,commentButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textContent = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height)];
        [self.contentView addSubview:self.textContent];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
