//
//  AwakenedMindViewController.h
//  zen180
//
//  Created by iosninjamaster on 5/11/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Music.h"
#import "HomePageViewController.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@interface AwakenedMindViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIView *theView;
    UIView *oldPickerView;
    UIView *selectedPickerView;
    NSArray *timeOptions;
    Music *music;
    AppDelegate *appDelegate;
    AVAudioPlayer *audioPlayer;
    
    IBOutlet UIPickerView *timeOptionsPickerView;
}


- (IBAction)backToHomeACTION:(id)sender;


@end
