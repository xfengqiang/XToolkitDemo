//
//  UINavigationController+CustomNavBar.h
//  CustomNavigationBarController
//
//  Created by LiJian Qiu on 11-11-16.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultNavigationNib @"XUINavigationController"

@interface UINavigationController (CustomNavBar)
+ (void)setNavibarNibName:(NSString *)nib;
+(id)navigationControllerWithRoot:(UIViewController *)root backgroundImage:(UIImage *)image barButtonItemColor:(UIColor *)bbiColor;
+(id)navigationControllerWithRoot:(UIViewController *)root backgroundImage:(UIImage *)image;
+(id)navigationControllerWithRoot:(UIViewController *)root backgroundColor:(UIColor *)color;
+(id)navigationControllerWithRoot:(UIViewController *)root backgroundColor:(UIColor *)bgColor barButtonItemColor:(UIColor *)bbiColor;

@end
