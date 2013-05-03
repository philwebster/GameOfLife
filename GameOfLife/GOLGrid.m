//
//  GOLGrid.m
//  GameOfLife
//
//  Created by Phil Webster on 4/29/13.
//  Copyright (c) 2013 Phil Webster. All rights reserved.
//

#import "GOLGrid.h"
#import "GOLCell.h"
#include <stdlib.h>

@implementation GOLGrid

-(id)initWithSize:(NSSize)size {
    // Set up grid with specified dimensions. Currently, 30x20 is
    // the only tested option. In order to change this, modifying
    // the view and window is necessary.
    
    self = [super init];
    if (self) {
        _size.width = size.width;
        _size.height = size.height;
        _grid = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < size.height; i++) {
            [_grid addObject:[[NSMutableArray alloc] init]];
            for (int j = 0; j < size.width; j++) {
                [[_grid objectAtIndex:i]
                    addObject:[[GOLCell alloc]
                        initWithPoint:NSMakePoint(j * 20, i * 20)]];
            }
        }
        return self;
    }
    return nil;
}

-(void)drawGrid {
    // Tell each cell to draw itself
    
    GOLCell *c;
    
    for (int i = 0; i < _size.height; i++) {
        for (int j = 0; j < _size.width; j++) {
            c = [[_grid objectAtIndex:i] objectAtIndex:j];
            [c drawCell];
        }
    }
}

-(void)populate {
    // Randomly populate 50% of the cells

    int generated;
    GOLCell *c;
    
    for (int i = 0; i < _size.height; i++) {
        for (int j = 0; j < _size.width; j++) {
            generated = arc4random() % 2;
            c = [[_grid objectAtIndex:i] objectAtIndex:j];
            if (generated == 0) {
                c.alive = FALSE;
                c.lastState = FALSE;
            } else {
                c.alive = TRUE;
                c.lastState = TRUE;
            }
        }
    }
}

-(void)clearGrid {
    // Set each cell to dead state
    
    GOLCell *c;

    for (int i = 0; i < _size.height; i++) {
        for (int j = 0; j < _size.width; j++) {
            c = [[_grid objectAtIndex:i] objectAtIndex:j];
            c.alive = FALSE;
        }
    }

    [self drawGrid];
}

-(void)advance {
    // Set cell state based on the rules of the Game of Life
    
    int neighbors;
    GOLCell *c;
    [self shiftForward];

    for (int i = 0; i < _size.height; i++) {
        for (int j = 0; j < _size.width; j++) {
            neighbors = [self numNeighbors:i col:j];
            c = [[_grid objectAtIndex:i] objectAtIndex:j];
            if (neighbors < 2) {
                c.alive = FALSE;
            }
            if (c.alive == TRUE && (neighbors == 2 || neighbors == 3)) {
                c.alive = TRUE;
            }
            if (c.alive == TRUE && neighbors > 3) {
                c.alive = FALSE;
            }
            if (c.alive == FALSE && neighbors == 3) {
                c.alive = TRUE;
            }
        }
    }
}

-(void)flipCellAtPoint:(NSPoint)pt {
    // When a user clicks a cell, this method will run to reverse the cell
    // state.
    
    [[[_grid objectAtIndex:pt.y / 20] objectAtIndex:pt.x / 20] flipCell];
}

-(int)numNeighbors:(int)r col:(int)c {
    // Count the number of neighbor cells that are alive
    
    int row, col;
    int n = 0;
    GOLCell *t;

    for (int i = r-1; i <= r+1; i++) {
        for (int j = c-1; j <= c+1; j++) {
            if (i == r && j == c) {
                continue;
            }
            row = i;
            col = j;
            if (i < 0) {
                row = _size.height - 1;
            }
            if (i > _size.height - 1) {
                row = 0;
            }
            if (j < 0) {
                col = _size.width - 1;
            }
            if (j > _size.width - 1) {
                col = 0;
            }
            t = [[_grid objectAtIndex:row] objectAtIndex:col];
            if (t.lastState) {
                n += 1;
            }
        }
    }
    
    return n;
}

-(void)shiftForward {
    // Set the cell lastState to the current state so that the next
    // frame can be computed from the lastState while current state
    // is updated.
    
    GOLCell *t;
    for (int i = 0; i < _size.height; i++) {
        for (int j = 0; j < _size.width; j++) {
            t = [[_grid objectAtIndex:i] objectAtIndex:j];
            t.lastState = t.alive;
        }
    }
}

@end
