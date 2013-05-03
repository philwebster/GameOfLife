//
//  GOLGridView.m
//  GameOfLife
//
//  Created by Phil Webster on 4/29/13.
//  Copyright (c) 2013 Phil Webster. All rights reserved.
//
//  GOLGridView contains the game grid and manages its drawing.

#import "GOLGridView.h"
#import "GOLGrid.h"

@interface GOLGridView()

@property GOLGrid *g;

@end

@implementation GOLGridView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // GOLGrid can be resized to contain a different number of cells
        // but modification of the view and/or window would be required.
        _g = [[GOLGrid alloc ] initWithSize:NSMakeSize(30,20)];
        [_g populate];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [_g drawGrid];
}

- (void)mouseUp:(NSEvent *)theEvent {
    // User clicked on a cell, so the cell state needs to be reversed
    NSPoint curPoint = [self convertPoint:[theEvent locationInWindow]
                                 fromView:nil];
    [_g flipCellAtPoint:curPoint];
    [self setNeedsDisplay:YES];
}

- (void) advance {
    // Advances the cells based on the rules of Game of Life
    [_g advance];
    [self setNeedsDisplay:YES];
}

- (void) clear {
    // Resets all cells to dead state
    [_g clearGrid];
}

- (void) repopulate {
    // Randomly populates 50% of the cells
    [_g populate];
}

@end
