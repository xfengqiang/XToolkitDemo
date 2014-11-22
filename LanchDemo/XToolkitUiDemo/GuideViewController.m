//
//  GuidViewController.m
//  XToolkitUiDemo
//
//  Created by frank.xu on 6/16/13.
//  Copyright (c) 2013 frank.xu. All rights reserved.
//

#import "GuideViewController.h"
#import "UIScreen+Size.h"
#import "XUIManager.h"

@implementation GuideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake([UIScreen width]*2, [UIScreen height]);
    self.pageControl.numberOfPages = 2;
}

- (IBAction)goToMainAction:(id)sender
{
    [[XUIManager sharedInstance] goToMainController:self];
}

#pragma - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger currentPage = [scrollView contentOffset].x/[UIScreen width];
    [self.pageControl setCurrentPage:currentPage];
}
@end
