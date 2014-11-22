//
//  TableViewTestViewController.h
//  XToolKitUIDemo
//
//  Created by frank.xu on 11/22/12.
//  Copyright (c) 2012 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XNaviBaseViewController.h"

@class XUITableView;
@interface TableViewTestViewController : XNaviBaseViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet XUITableView *tableView;
@end
