//
//  GOLCell.m
//  GameOfLife
//
//  Created by Phil Webster on 4/29/13.
//  Copyright (c) 2013 Phil Webster. All rights reserved.
//

#import "GOLCell.h"

@implementation GOLCell

-(id)initWithPoint:(NSPoint)point {
    self = [super init];
    if (self) {
        // Create a 16x16 rect centered inside a 20x20 square
        _r = NSMakeRect(point.x + 2,point.y + 2,16,16);

        // Activate for circular cells
        _path = [NSBezierPath bezierPathWithOvalInRect:_r];

        // Activate for square cells
        //_path = [NSBezierPath bezierPathWithRect:_r];
    }
    return self;
}

-(void)drawCell {
    // TODO: These colors should be defined outside of this method
    // so that they don't have to be created each time a cell is
    // drawn.
    
    if (self.alive == TRUE) {
        NSColor *aliveColor = [NSColor colorWithDeviceRed:0.053
                                                    green:0.853
                                                     blue:0.000
                                                    alpha:0.900];
        [aliveColor set];
    } else {
        NSColor *deadColor = [NSColor colorWithDeviceRed:0.108
                                                   green:0.107
                                                    blue:0.109
                                                   alpha:0.500];
        [deadColor set];
    }
    [_path fill];
}

-(void)flipCell {
    self.alive ^= TRUE;
}


@end