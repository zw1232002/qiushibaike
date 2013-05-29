//
//  ContentViewController.m
//  qiushibaike
//
//  Created by coly on 13-5-22.
//  Copyright (c) 2013年 coly. All rights reserved.
//

#import "ContentViewController.h"
#import "colyCell.h"

@interface ContentViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) UITableView *table;
@property (retain, nonatomic) NSArray *list;

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
    //清除默认样式
    self.view.backgroundColor = [UIColor clearColor];
    
    self.list = [[NSArray alloc] initWithObjects:@"One", @"Two" , @"Three", nil];
    
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    //清除默认样式
    self.table.backgroundColor = [UIColor clearColor];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    
    [self.view addSubview:self.table];
        
    [self getResult];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)getResult
{
    
    
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
    cell.textContent.text = [list objectAtIndex:row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath
{
    return 320.00;
}


@end
