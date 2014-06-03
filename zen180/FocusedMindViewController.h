//
//  FocusedMindViewController.h
//  zen180
//
//  Created by iosninjamaster on 5/11/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
//#import <AVFoundation/AVFoundation.h>
#import "AudioPlayer.h"

@interface FocusedMindViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

{
    UIView *theView;
    AppDelegate *appDelegate;
    Music *music;
    
    IBOutlet UIButton *lockedButton;
    IBOutlet UIPickerView *timeOptionsPickerView;
    NSString *musicPlayerState;
    
}
@property (strong, nonatomic) AudioPlayer *musicPlayer;
@property (strong, nonatomic) IBOutlet UISlider *currentTimeSlider;
@property (strong, nonatomic) IBOutlet UILabel *timeElapsed;
@property (strong, nonatomic) IBOutlet UILabel *duration;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property BOOL isPaused;
@property BOOL scrubbing;
@property NSTimer *timer;
- (IBAction)lockedProgramACTION:(id)sender;
- (IBAction)backToHomeACTION:(id)sender;


@end
