//
//  GuidViewController.h
//  XToolkitUiDemo
//
//  Created by frank.xu on 6/16/13.
//  Copyright (c) 2013 frank.xu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GuideViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;

- (IBAction)goToMainAction:(id)sender;
@end
