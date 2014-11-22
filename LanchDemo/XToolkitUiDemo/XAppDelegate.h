//
//  XAppDelegate.h
//  XToolkitUiDemo
//
//  Created by frank.xu on 6/16/13.
//  Copyright (c) 2013 frank.xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XViewController;

@interface XAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) XViewController *viewController;

@end
