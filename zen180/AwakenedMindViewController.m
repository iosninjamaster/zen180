//
//  AwakenedMindViewController.m
//  zen180
//
//  Created by iosninjamaster on 5/11/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import "AwakenedMindViewController.h"
#import "Music.h"

@interface AwakenedMindViewController ()

@end

@implementation AwakenedMindViewController

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
    
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"awake" owner:self options:nil];
    theView = [views objectAtIndex:0];
    appDelegate = [[UIApplication sharedApplication] delegate];
    timeOptionsPickerView.delegate = self;
    timeOptionsPickerView.hidden = YES;
    
    
    [self setAudioSessionCategoryToPlayback];
    //[self playMusic];
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

- (void)playMusic
{
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Focused Mind 5 - Alpha.mp3",[[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = -1;
    
    if (audioPlayer == nil)
        NSLog(@"error = %@", [error description]);
    else
        [audioPlayer play];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [appDelegate.musicArray count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    music = appDelegate.musicArray[row];
    return music.title;

}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    view.backgroundColor = [UIColor redColor];
    //    if (oldPickerView != nil)
//        oldPickerView.backgroundColor = [UIColor clearColor];
//    
//    selectedPickerView = [pickerView viewForRow:row forComponent:component];
//    selectedPickerView.backgroundColor = [UIColor redColor];
//    [selectedPickerView setNeedsDisplay];
//    oldPickerView = selectedPickerView;
//    
//    return view ;
//}

- (IBAction)lockedProgamACTION:(id)sender
{
    [self.view addSubview:theView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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


- (IBAction)backToHomeACTION:(id)sender
{
    [theView removeFromSuperview];
}
@end
