//
//  CreativeMindViewController.m
//  zen180
//
//  Created by iosninjamaster on 5/11/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import "CreativeMindViewController.h"

@interface CreativeMindViewController ()

@end

@implementation CreativeMindViewController

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
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"Creative" owner:self options:nil];
    theView = views[0];
    appDelegate = [[UIApplication sharedApplication] delegate];

    timeOptionsPickerView.delegate = self;
    timeOptionsPickerView.hidden = YES;
    
    
    
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [appDelegate.musicArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)componentr
{
    music = appDelegate.musicArray[row];
    return music.title;
}



- (IBAction)lockedProgramACTION:(id)sender
{
    [self.view addSubview:theView];
}

- (IBAction)backToHomeACTION:(id)sender
{
    [theView removeFromSuperview];
}
@end
