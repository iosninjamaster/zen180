//
//  PageControlHomeViewController.h
//  zen180
//
//  Created by iosninjamaster on 5/11/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControlHomeViewController : UIViewController <UIPageViewControllerDataSource>
{
    NSString *viewTitle;
    NSArray *pageImages;
    IBOutlet UIPageControl *pageControl;
    NSMutableArray *vcArray;
    NSArray *vc1;
}

@property (nonatomic, strong) UIPageViewController *pageViewController;

@end
