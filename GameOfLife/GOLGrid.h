//
//  GOLGrid.h
//  GameOfLife
//
//  Created by Phil Webster on 4/29/13.
//  Copyright (c) 2013 Phil Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GOLGrid : NSObject

@property NSSize size;
@property NSMutableArray *grid;

-(id)initWithSize:(NSSize)size;
-(void)drawGrid;
-(void)populate;
-(void)clearGrid;
-(void)advance;
-(void)flipCellAtPoint:(NSPoint)pt;

@end
