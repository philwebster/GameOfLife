//
//  wwdcWindowController.m
//  GameOfLife
//
//  Created by Phil Webster on 5/2/13.
//  Copyright (c) 2013 Phil Webster. All rights reserved.
//

#import <WebKit/WebKit.h>
#import <Quartz/Quartz.h>
#import "wwdcWindowController.h"

@interface wwdcWindowController ()
@property IBOutlet PDFView *aboutView;
@property IBOutlet PDFView *projectsView;
@property IBOutlet PDFView *gameOfLifeView;
@end

@implementation wwdcWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
//    [[_aboutWebView mainFrame]loadRequest:[NSURL URLWithString:@"http://www.philwebster.net"]];
    
}

- (void)awakeFromNib{
    // In case a web view is needed:
    //[_aboutWebView setMainFrameURL:@"http://www.philwebster.net"];

    NSString *path;
    NSURL *pdfURL;

    path = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"pdf"];
    pdfURL = [NSURL fileURLWithPath:path];
    [_aboutView setAutoScales:TRUE];
    [_aboutView setBackgroundColor:[NSColor clearColor]];
    [_aboutView setDocument:[[PDFDocument alloc] initWithURL:pdfURL]];
    
    path = [[NSBundle mainBundle] pathForResource:@"projects" ofType:@"pdf"];
    pdfURL = [NSURL fileURLWithPath:path];
    [_projectsView setAutoScales:TRUE];
    [_projectsView setBackgroundColor:[NSColor clearColor]];
    [_projectsView setDocument:[[PDFDocument alloc] initWithURL:pdfURL]];

    path = [[NSBundle mainBundle] pathForResource:@"GOL" ofType:@"pdf"];
    pdfURL = [NSURL fileURLWithPath:path];
    [_gameOfLifeView setAutoScales:TRUE];
    [_gameOfLifeView setBackgroundColor:[NSColor clearColor]];
    [_gameOfLifeView setDocument:[[PDFDocument alloc] initWithURL:pdfURL]];

    
    return;
}

@end
