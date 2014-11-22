//
//  TableViewTestViewController.m
//  XToolKitUIDemo
//
//  Created by frank.xu on 11/22/12.
//  Copyright (c) 2012 Frank. All rights reserved.
//

#import "TableViewTestViewController.h"
#import "XToolkitUI.h"
#import "XUITableView.h"
#import "SVPullToRefresh.h"
#import "XUILoadMoreFooterView.h"
#import "XToolkitCore.h"

@interface TableViewTestViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation TableViewTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dataSource = [NSMutableArray array];
        [_dataSource addObjectsFromArray:@[@1]];
        // Custom initialization
    }
    return self;
}

- (void)refreshData
{
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSNumber *lastObject = [self.dataSource objectAtIndex:0];
        for (int i = [lastObject intValue]; i>[lastObject intValue]-5; i--)
        {
            [self.dataSource insertObject:[NSNumber numberWithInt:i] atIndex:0];
        }
        [self.tableView refreshDone];
        [self.tableView reloadData];
    });
}

- (void)loadMoreData
{
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSNumber *lastObject = [self.dataSource lastObject];
        for (int i = [lastObject intValue]; i<[lastObject intValue]+5; i++)
        {
            [self.dataSource addObject:[NSNumber numberWithInt:i]];
        }
        [self.tableView reloadData];
        [self.tableView loadMoreDone:self.dataSource.count < 30];
    });
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.tableView.loadMoreFooterView = [[XAppearTriggerFooterView alloc] initWithScrollView:self.tableView];
    
    __unsafe_unretained typeof(self) pSelf = self;
    
    [self.tableView setLoadMoreBlock:^{
        [pSelf loadMoreData];
    }];
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        [pSelf refreshData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell-%@", [self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
