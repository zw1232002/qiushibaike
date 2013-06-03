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

@interface ContentViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) UITableView *table;

@end

@implementation ContentViewController

@synthesize table;
@synthesize list,cellHeightArray;

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
  
  //初始化列表和高度数组
  self.list = [NSMutableArray new];
  
  self.cellHeightArray = [NSMutableArray new];
  
  [self getResult];
  
  //清除默认样式
  self.view.backgroundColor = [UIColor clearColor];
  
  self.table = [[UITableView alloc] initWithFrame:self.view.bounds];
  
  //清除默认样式
  self.table.backgroundColor = [UIColor clearColor];
  
  self.table.delegate = self;
  self.table.dataSource = self;
  
  [self.view addSubview:self.table];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (void)getResult
{
   
  NSURL *url = [NSURL URLWithString:DayURLString(100, 1)];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  
  [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
  
  AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSURLResponse *response, id JSON)
  {
    if ([JSON objectForKey:@"items"])
    {
    [self setData:[JSON objectForKey:@"items"]];
    }
    
//    NSLog(@"%@", JSON);
    
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
  
  [cell resizeHeight];
  
  [self.cellHeightArray insertObject:[NSString stringWithFormat:@"%f", cell.frame.size.height] atIndex:row];

  
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath
{
  QiushiObject *qiushi = [self.list objectAtIndex:[indexPath row]];
  return [colyCell getCellHeight:qiushi.content];
  //  return [[self.cellHeightArray objectAtIndex:[indexPath row]] floatValue];
}




@end
