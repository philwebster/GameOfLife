//
//  GOLCell.h
//  GameOfLife
//
//  Created by Phil Webster on 4/29/13.
//  Copyright (c) 2013 Phil Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GOLCell : NSObject

@property BOOL alive;
@property BOOL lastState;
@property NSBezierPath *path;
@property NSRect r;

-(id)initWithPoint:(NSPoint)point;
-(void)drawCell;
-(void)flipCell;

@end
