//
//  GOLWindowController.m
//  GameOfLife
//
//  Created by Phil Webster on 4/29/13.
//  Copyright (c) 2013 Phil Webster. All rights reserved.
//

#import "GOLWindowController.h"
#import "GOLGridView.h"
#import "GOLGrid.h"

@interface GOLWindowController ()

@property (weak) IBOutlet GOLGridView *gridView;
@property BOOL isRunningAuto;
@property NSTimer *timer;
@property (weak) IBOutlet NSStepper *speedStepper;
@property (weak) IBOutlet NSTextField *speedTextField;
@property (weak) IBOutlet NSButton *stepButton;
@property (weak) IBOutlet NSButton *clearButton;
@property (weak) IBOutlet NSButton *autoButton;
@property (weak) IBOutlet NSButton *repopulateButton;

@end

@implementation GOLWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        _isRunningAuto = FALSE;
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

- (IBAction)advanceGrid:(NSButton *)sender {
    [self.gridView advance];
}

- (IBAction)autoRun:(NSButton *)sender {
    if (_isRunningAuto == TRUE) {
        [_timer invalidate];
        _timer = nil;
        _isRunningAuto = FALSE;
        [self.autoButton setTitle:@"Play"];
        [self.stepButton setEnabled:TRUE];
    } else {
        float interval = 1.0 / _speedTextField.integerValue;
        _timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                  target:self
                                                selector:@selector(autorun:)
                                                userInfo:nil
                                                 repeats:YES];
        _isRunningAuto = TRUE;
        [self.autoButton setTitle:@"Pause"];
        [self.stepButton setEnabled:FALSE];
    }
}

- (IBAction)clearGrid:(NSButton *)sender {
    [self.gridView clear];
    if (_isRunningAuto == TRUE) {
        [self autoRun:self.clearButton];
    }
    [self.gridView display];
}

- (IBAction)repopulateGrid:(NSButton *)sender {
    [self.gridView repopulate];
    [self.gridView display];
}

- (IBAction)updateSpeed:(id)sender {
    
    float interval = 1.0 / [sender integerValue];
    if (_isRunningAuto == TRUE) {
        [_timer invalidate];
        _timer = nil;
        _timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                  target:self
                                                selector:@selector(autorun:)
                                                userInfo:nil
                                                 repeats:YES];
    }
    
    // Update both controls to make sure that their values match
    _speedStepper.integerValue = [sender integerValue];
    _speedTextField.integerValue = [sender integerValue];
}

- (void) autorun: (NSTimer *) t {
    [self.gridView advance];
    [self.gridView display];
}

@end