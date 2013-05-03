//
//  GOLAppDelegate.m
//  GameOfLife
//
//  Created by Phil Webster on 4/29/13.
//  Copyright (c) 2013 Phil Webster. All rights reserved.
//

#import "GOLAppDelegate.h"

@implementation GOLAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

    // Set the window background to transparent black
    [_window setOpaque:NO];
    NSColor *semiTransparentBlack = [NSColor colorWithDeviceRed:0.108 green:0.107 blue:0.109 alpha:0.87];
    _window.backgroundColor = semiTransparentBlack;
    [_window orderFrontRegardless];
    [_wwdcWindow orderFrontRegardless];
}

@end
