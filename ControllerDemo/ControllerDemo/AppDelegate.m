//
//  AppDelegate.m
//  XTookKitUIDemo
//
//  Created by frank.xu on 11/18/12.
//  Copyright (c) 2012 Frank. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

#import "SecondViewController.h"
#import "UINavigationController+CustomNavBar.h"
#import "XUINavigationBar.h"
#import "MainTabViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@", [[NSBundle mainBundle] bundlePath]);
    [UIColor redColor];
    [UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    self.tabBarController = [[MainTabViewController alloc] init];
    

    UINavigationController *navCtrl1 = [UINavigationController navigationControllerWithRoot:viewController1
                                         backgroundImage:[UIImage imageNamed:@"navbar.png"]];
    
    UINavigationController *navCtrl2 = [UINavigationController navigationControllerWithRoot:viewController2
                                                                            backgroundColor:[UIColor redColor]];
    
    XUINavigationBar *bar = (XUINavigationBar *)navCtrl2.navigationBar;
    [bar setCustomStyle:CustomNavigationLinearGradient];
    self.tabBarController.viewControllers = @[navCtrl1, navCtrl2];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
