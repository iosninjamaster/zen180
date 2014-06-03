//
//  AudioPlayer.m
//  zen180
//
//  Created by iosninjamaster on 5/28/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import "AudioPlayer.h"

@implementation AudioPlayer



- (void)initPlayer:(NSString *)audioFile fileExtension:(NSString *)fileExtension
{
    //NSURL *audioFileLocationURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Focused Mind 5 - Alpha.mp3",[[NSBundle mainBundle] resourcePath]]];
    NSLog(@"audioFile = %@", audioFile);
    NSURL *audioFileLocationURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], audioFile]];
    NSLog(@"audioFileLocationURL = %@", audioFileLocationURL);

    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileLocationURL error:&error];
}

/*
 * Simply fire the play Event
 */
- (void)playAudio {
    [self.audioPlayer play];
}

/*
 * Simply fire the pause Event
 */
- (void)pauseAudio {
    [self.audioPlayer pause];
}

/*
 * Format the float time values like duration
 * to format with minutes and seconds
 */
-(NSString*)timeFormat:(float)value{
    
    float minutes = floor(lroundf(value)/60);
    float seconds = lroundf(value) - (minutes * 60);
    
    int roundedSeconds = lroundf(seconds);
    int roundedMinutes = lroundf(minutes);
    
    NSString *time = [[NSString alloc]
                      initWithFormat:@"%d:%02d",
                      roundedMinutes, roundedSeconds];
    return time;
}

/*
 * To set the current Position of the
 * playing audio File
 */
- (void)setCurrentAudioTime:(float)value {
    [self.audioPlayer setCurrentTime:value];
}

/*
 * Get the time where audio is playing right now
 */
- (NSTimeInterval)getCurrentAudioTime {
    return [self.audioPlayer currentTime];
}

/*
 * Get the whole length of the audio file
 */
- (float)getAudioDuration {
    return [self.audioPlayer duration];
}



@end
