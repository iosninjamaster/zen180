//
//  RomanticMindViewController.h
//  zen180
//
//  Created by iosninjamaster on 5/11/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface RomanticMindViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIView *theView;
    AppDelegate *appDelegate;
    Music *music;

    IBOutlet UIPickerView *timeOptionsPickerView;
    
}
- (IBAction)lockedProgramACTION:(id)sender;
- (IBAction)backToHomeACTION:(id)sender;


@end
