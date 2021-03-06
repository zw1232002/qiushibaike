//
//  ContentViewController.m
//  qiushibaike
//
//  Created by coly on 13-5-22.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "ContentViewController.h"
#import "colyCell.h"
#import "AFJSONRequestOperation.h"
#import "QiushiObject.h"
#import "UIImageView+AFNetworking.h"
#import "PullTableView.h"

@interface ContentViewController ()<UITableViewDataSource, UITableViewDelegate, PullTableViewDelegate>

@property (retain, nonatomic) PullTableView *table;

@end

@implementation ContentViewController

@synthesize table;
@synthesize list;
@synthesize page;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  self.view.frame = CGRectMake(0, 44, kDeviceWidth , kDeviceHeight - 44*2-10);
  
  //初始化列表和高度数组
  self.list = [NSMutableArray new];
  
  //初始化页数
  self.page = 1;
  
  //清除默认样式
  self.view.backgroundColor = [UIColor clearColor];

  self.table = [[PullTableView alloc] initWithFrame:self.view.bounds];
  
  self.table.pullDelegate = self;
  
  self.table.pullBackgroundColor = [UIColor clearColor];
  
  //清除默认样式
  self.table.backgroundColor = [UIColor clearColor];
  
  self.table.delegate = self;
  self.table.dataSource = self;
  
  [self.view addSubview:self.table];
  
}

- (void)viewDidUnload
{
  self.table = nil;
  self.list = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
  if(!self.table.pullTableIsRefreshing) {
    self.table.pullTableIsRefreshing = YES;
    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:1.f];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (void)getResult
{
  
//  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"fuck" message:[NSString stringWithFormat:@"这是第%d次请求",self.page] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"OK个屁", nil];
//  [alert show];
  
  NSURL *url = [NSURL URLWithString:DayURLString(500, self.page)];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
  
  AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSURLResponse *response, id JSON)
  {
//    NSLog(@"第%d次：%@\n\n\n\n\n", self.page,JSON);
    if ([JSON objectForKey:@"items"])
    {
      [self setData:[JSON objectForKey:@"items"]];
    }

    [self.table reloadData];

  } failure:^(NSURLRequest *request, NSURLResponse *response, NSError *error, id jj)
  {
    NSLog(@"\nThe http request error:%@",error);
  }];
  
  [operation start];
  
  
}


- (void)setData:(NSArray *)jsonData
{
  for (NSDictionary *qiushi in jsonData)
  {
    QiushiObject *qs = [[QiushiObject alloc] initWithDictionary:qiushi];
    [self.list addObject:qs];
  }
  self.page++;
}

#pragma tableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
  return [self.list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
  static NSString *identifier = @"viewCell";
  
  colyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  
  if (cell == nil)
  {
    cell = [[colyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    //清除默认样式
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
  }
  
  NSUInteger row = [indexPath row];
  
  QiushiObject *qiushi = [self.list objectAtIndex:row];
  
  [cell.textContent setText:qiushi.content];
  
  if (qiushi.author !=nil)
  {
    cell.textAuthor.text = qiushi.author;
  }
  
  
  [cell.UpButton setTitle:[NSString stringWithFormat:@"%d",qiushi.upCount] forState:UIControlStateNormal];
  
  [cell.downButton setTitle:[NSString stringWithFormat:@"%d",qiushi.downCount] forState:UIControlStateNormal];
  
  [cell.commentButton setTitle:[NSString stringWithFormat:@"%d",qiushi.commnetsCount] forState:UIControlStateNormal];
  
  cell.textTag.text = qiushi.tag;
  
  [cell.AuthorImg setImageWithURL:[NSURL URLWithString:qiushi.imageUrl] placeholderImage:[UIImage imageNamed:@"thumb_avatar.png"]];
  
  [cell resizeHeight];

  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath
{
  QiushiObject *qiushi = [self.list objectAtIndex:[indexPath row]];
  return [colyCell getCellHeight:qiushi.content];
}


#pragma mark - Refresh and load more methods

- (void) refreshTable
{
  [self getResult];
  self.table.pullLastRefreshDate = [NSDate date];
  self.table.pullTableIsRefreshing = NO;
}

- (void) loadMoreDataToTable
{
  [self getResult];
  self.table.pullTableIsLoadingMore = NO;
}


#pragma mark - PullTableViewDelegate

- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView
{
  
  [self performSelector:@selector(refreshTable) withObject:nil afterDelay:1.0f];
}

- (void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView
{
  [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:1.0f];
}

@end
