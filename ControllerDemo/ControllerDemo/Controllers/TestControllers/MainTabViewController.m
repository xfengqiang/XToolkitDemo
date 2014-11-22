//
//  MainTabViewController.m
//  XToolKitUIDemo
//
//  Created by frank.xu on 12/2/12.
//  Copyright (c) 2012 Frank. All rights reserved.
//

#import "MainTabViewController.h"
#import "UIImage+Ext.h"
#import "XUITabBarItem.h"
#import "IconTitleTabBarItem.h"
#import "XToolkitCore.h"
#import "XUITabBar.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (XUITabBarItem *)tabBarItem:(NSString *)title icon:(UIImage *)icon frame:(CGRect)frame
{
    UIImage *img = icon;
    IconTitleTabBarItem *item1 = [[IconTitleTabBarItem alloc] initWithIcon:img highlightedIcon:[UIImage imageWithColor:[UIColor orangeColor] size:icon.size ]
                                                                     title:title frame:frame];
    item1.showsTouchWhenHighlighted = YES;
    //    item1.iconView.backgroundColor = [UIColor yellowColor];
    //    item1.xTitleLabel.backgroundColor = [UIColor greenColor];
    return item1;
}

- (void)loadTabBar:(XUITabBar *)tabBar
{
    tabBar.backgroundColor = [UIColor blackColor];
    tabBar.animatedTabSelect = YES;
    tabBar.backgroundImage = [[UIImage imageNamed:@"tab_bg"] tiledImage];
    
    tabBar.indicatorView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 47, 40, 2)];
    tabBar.indicatorView.backgroundColor = [UIColor grayColor];
    
    CGFloat width = 320 / 3;
    CGRect frame = CGRectMake(0, 0, width, 49);
    XUITabBarItem *item1 = [self tabBarItem:@"First" icon:[UIImage imageNamed:@"first"] frame:frame];
    XUITabBarItem *item2 = [self tabBarItem:@"Second" icon:[UIImage imageNamed:@"second"] frame:frame];
    [tabBar setItems:@[item1, item2]];
}

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
