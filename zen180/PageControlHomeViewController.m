//
//  PageControlHomeViewController.m
//  zen180
//
//  Created by iosninjamaster on 5/11/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import "PageControlHomeViewController.h"
#import "PageContentViewController.h"
#import "AwakenedMindViewController.h"
#import "CreativeMindViewController.h"
#import "FocusedMindViewController.h"
#import "RelaxedMindViewController.h"
#import "RomanticMindViewController.h"


@interface PageControlHomeViewController ()

@end

@implementation PageControlHomeViewController

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
    
    pageImages = @[@"640x1136-awakened-mind-background.png", @"640x1136-creative-mind-background.png", @"640x1136-focused-mind-background.png", @"640x1136-relaxed-mind-background.png", @"640x1136-romantic-mind-background.png"];
    
    vcArray = [[NSMutableArray alloc] init];
    [vcArray addObject:@"awakenedMind"];
    [vcArray addObject:@"creativeMind"];
    [vcArray addObject:@"focusedMind"];
    [vcArray addObject:@"relaxedMind"];
    [vcArray addObject:@"romanticMind"];
    
    [self initializePageViewController];


    
}

- (void)initializePageViewController
{
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    UIViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [vcArray indexOfObject:viewController];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [vcArray indexOfObject:viewController];
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([pageImages count] == 0) || (index >= [pageImages count]))
    {
        return nil;
    }
    
    if (index == 0)
    {
        FocusedMindViewController *focusedMindVC = [self.storyboard instantiateViewControllerWithIdentifier:@"focusedMind"];
        if ([vcArray count])
        {
            [vcArray replaceObjectAtIndex:0 withObject:focusedMindVC];
        }
        return  focusedMindVC;

        NSLog(@"vcarray = %@", vcArray);
        
    }
    else if (index == 1)
    {
        NSLog(@"vcarra = %@", vcArray);
        CreativeMindViewController *creativeMindVC = [self.storyboard instantiateViewControllerWithIdentifier:@"creativeMind"];
        if ([vcArray count])
        {
            [vcArray replaceObjectAtIndex:1 withObject:creativeMindVC];
        }
        return creativeMindVC;
    }
    else if (index == 2)
    {
        AwakenedMindViewController *awakendMindVC = [self.storyboard instantiateViewControllerWithIdentifier:@"awakenedMind"];
        if ([vcArray count])
        {
            [vcArray replaceObjectAtIndex:2 withObject:awakendMindVC];
        }
        return awakendMindVC;
    }
    else if (index == 3)
    {
        RelaxedMindViewController *relaxedMindVC = [self.storyboard instantiateViewControllerWithIdentifier:@"relaxedMind"];
        if ([vcArray count]) {
            [vcArray replaceObjectAtIndex:3 withObject:relaxedMindVC];
        }
        return relaxedMindVC;
    }
    else
    {
        RomanticMindViewController *romanticVC = [self.storyboard instantiateViewControllerWithIdentifier:@"romanticMind"];
        if ([vcArray count]) {
            [vcArray replaceObjectAtIndex:4 withObject:romanticVC];
        }
        return romanticVC;
    }
}
@end

