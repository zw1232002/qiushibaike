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

@interface ContentViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) UITableView *table;

@end

@implementation ContentViewController

@synthesize table;
@synthesize list;

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
   
    NSURL *url = [NSURL URLWithString:LastestURLString(100, 1)];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSURLResponse *response, id JSON)
    {
        [self setData:[JSON valueForKey:@"items"]];
        [self.table reloadData];

    } failure:^(NSURLRequest *request, NSURLResponse *response, NSError *error, id jj)
    {
        NSLog(@"\nThe http request error:%@",error);
    }];
    
    [operation start];
    
    
}


- (void)setData:(NSArray *)jsonData
{
    self.list = [[NSMutableArray alloc] initWithArray:jsonData];
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
//    cell.textContent.text = [list o
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath
{
    return 320.00;
}


@end
