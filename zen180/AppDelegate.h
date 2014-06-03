//
//  AppDelegate.h
//  zen180
//
//  Created by iosninjamaster on 4/30/14.
//  Copyright (c) 2014 urbndna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Music.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    Music *music;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSArray *musicArray;

@end
