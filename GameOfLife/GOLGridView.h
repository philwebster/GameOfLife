//
//  GOLGridView.h
//  GameOfLife
//
//  Created by Phil Webster on 4/29/13.
//  Copyright (c) 2013 Phil Webster. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GOLGrid.h"

@interface GOLGridView : NSView {
    NSTimer *timer;
}

-(void) advance;
-(void) clear;
-(void) repopulate;

@end
