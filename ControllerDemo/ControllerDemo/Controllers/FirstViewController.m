//
//  FirstViewController.m
//  XTookKitUIDemo
//
//  Created by frank.xu on 11/18/12.
//  Copyright (c) 2012 Frank. All rights reserved.
//

#import "FirstViewController.h"
#import "TestRowItem.h"
#import "TableViewTestViewController.h"
#import "UIActionSheet+MKBlockAdditions.h"

@interface FirstViewController ()
@end

@implementation FirstViewController

#pragma mark - Test methods
- (void)showImagePicker
{
    if (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone))
    {
        [UIActionSheet photoPickerWithTitle:@"选取图片" showInView:self.view presentVC:self onPhotoPicked:^(UIImage *chosenImage) {
        NSLog(@"image picked with size:(%f ,%f)", chosenImage.size.width,chosenImage.size.height);
        } onCancel:^{
            
        NSLog(@"image pic canceld");
        }];
        
    }
    else
    {

       
    }
   
}

#pragma mark - UIViewController lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.dataSource addObject:[TestRowItem itemWithMethod:@selector(showImagePicker) title:@"Pick image"]];
    [self addTestItem:[TestRowItem itemWithController:@"TableViewTestViewController" nib:@"TableViewTestViewController" title:@"上提/下拉的TableView"]];
    
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
@end
