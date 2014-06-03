//
//  FocusedMindViewController.m
//  zen180
//
//  Created by iosninjamaster on 5/11/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import "FocusedMindViewController.h"

@interface FocusedMindViewController ()

@end

@implementation FocusedMindViewController

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
    musicPlayerState = @"paused";
    
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"Focused" owner:self options:nil];
    theView = views[0];
    appDelegate = [[UIApplication sharedApplication] delegate];
    timeOptionsPickerView.delegate = self;
    lockedButton.hidden = YES;
    
    [self.playButton setImage:[UIImage imageNamed:@"play-64.png"]
                     forState:UIControlStateNormal];
    [self setAudioSessionCategoryToPlayback];
    self.musicPlayer = [[AudioPlayer alloc] init];
    [self setupAudioPlayer:@"Focused Mind 5 - Alpha.mp3"];

    
    
}


- (void)setupAudioPlayer:(NSString*)fileName
{
    //insert Filename & FileExtension
    NSString *fileExtension = @"mp3";
    
    //init the Player to get file properties to set the time labels
    [self.musicPlayer initPlayer:fileName fileExtension:fileExtension];
    self.currentTimeSlider.maximumValue = [self.musicPlayer getAudioDuration];
    
    //init the current timedisplay and the labels. if a current time was stored
    //for this player then take it and update the time display
    self.timeElapsed.text = @"0:00";
    
    self.duration.text = [NSString stringWithFormat:@"-%@",
                          [self.musicPlayer timeFormat:[self.musicPlayer getAudioDuration]]];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    music = appDelegate.musicArray[row];
    if ([music.title isEqualToString:@"5 minutes"])
    {
        [self setupAudioPlayer:@"Focused Mind 5 - Alpha.mp3"];
        [self.playButton setImage:[UIImage imageNamed:@"play-64.png"] forState:UIControlStateNormal];
        
        
    }
    
    else if ([music.title isEqualToString:@"15 minutes"])
    {
        [self setupAudioPlayer:@"Focused Mind 15 - Alpha.mp3"];
        [self.playButton setImage:[UIImage imageNamed:@"play-64.png"] forState:UIControlStateNormal];

    }
    
    else
        [self setupAudioPlayer:@"Focused Mind 30 - Alpha.mp3"];
    [self.playButton setImage:[UIImage imageNamed:@"play-64.png"] forState:UIControlStateNormal];

    
}



/*
 * PlayButton is pressed
 * plays or pauses the audio and sets
 * the play/pause Text of the Button
 */
- (IBAction)playAudioPressed:(id)playButton
{
    [self.timer invalidate];
    //play audio for the first time or if pause was pressed
    if (!self.isPaused) {
        [self.playButton setImage:[UIImage imageNamed:@"pause-64.png"]
                                   forState:UIControlStateNormal];
        
        //start a timer to update the time label display
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(updateTime:)
                                                    userInfo:nil
                                                     repeats:YES];
        
        [self.musicPlayer playAudio];
        self.isPaused = TRUE;
        
    } else {
        //player is paused and Button is pressed again
        [self.playButton setImage:[UIImage imageNamed:@"play-64.png"]
                                   forState:UIControlStateNormal];
        
        [self.musicPlayer pauseAudio];
        self.isPaused = FALSE;
    }

}




/*
 * Updates the time label display and
 * the current value of the slider
 * while audio is playing
 */
- (void)updateTime:(NSTimer *)timer {
    //to don't update every second. When scrubber is mouseDown the the slider will not set
    if (!self.scrubbing) {
        self.currentTimeSlider.value = [self.musicPlayer getCurrentAudioTime];
    }
    self.timeElapsed.text = [NSString stringWithFormat:@"%@",
                             [self.musicPlayer timeFormat:[self.musicPlayer getCurrentAudioTime]]];
    
    self.duration.text = [NSString stringWithFormat:@"-%@",
                          [self.musicPlayer timeFormat:[self.musicPlayer getAudioDuration] - [self.musicPlayer getCurrentAudioTime]]];
}

/*
 * Sets the current value of the slider/scrubber
 * to the audio file when slider/scrubber is used
 */
- (IBAction)setCurrentTime:(id)scrubber {
    //if scrubbing update the timestate, call updateTime faster not to wait a second and dont repeat it
    [NSTimer scheduledTimerWithTimeInterval:0.01
                                     target:self
                                   selector:@selector(updateTime:)
                                   userInfo:nil
                                    repeats:NO];
    
    [self.musicPlayer setCurrentAudioTime:self.currentTimeSlider.value];
    self.scrubbing = FALSE;
}

/*
 * Sets if the user is scrubbing right now
 * to avoid slider update while dragging the slider
 */

- (IBAction)userIsScrubbing:(id)sender {
    self.scrubbing = TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setAudioSessionCategoryToPlayback
{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    BOOL ok;
    NSError *setCategoryError = nil;
    ok = [audioSession setCategory:AVAudioSessionCategoryPlayback error:&setCategoryError];
    if (!ok)
    {
        NSLog(@"%s setCategoryError=%@", __PRETTY_FUNCTION__, setCategoryError);
    }
}




- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [appDelegate.musicArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    music = appDelegate.musicArray[row];
    return music.title;
}


- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    music = appDelegate.musicArray[row];
    NSString *title = music.title;
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
    
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
