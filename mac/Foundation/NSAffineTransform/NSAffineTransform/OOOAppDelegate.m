//
//  OOOAppDelegate.m
//  NSAffineTransform
//
//  Created by Satoshi Oomori on 12/02/12.
//  Copyright (c) 2012 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#define PI 3.14159265358979323846

static inline double radians(double degrees) { return degrees * PI / 180; }

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    //[self method001:self];
}

#pragma mark +transform
- (IBAction)method001:(id)sender {
    //make bezier path
	NSBezierPath *thePath1 = [NSBezierPath bezierPath];
	
    //make affin transform
    NSAffineTransform *affin = [NSAffineTransform transform];
	NSAffineTransform *affin2 = [NSAffineTransform transform];
    
    //focus window's view
    [_window.contentView lockFocus];
        //clear window
        NSRect rect = [_window.contentView frame ];
        [[NSColor windowBackgroundColor] set];
        NSRectFill(rect);
        //set winding rule
        [thePath1 setWindingRule:NSEvenOddWindingRule];
        //move pen
        [thePath1 moveToPoint:NSMakePoint(20,20)];
        //make path
        [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(50,50,100,100)];
        [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(20,20,80,80)];
        //set color
        [[NSColor blueColor] set];
        
        //fill path
        [thePath1 fill];
        
        //set transform
        [affin translateXBy: 10.0 yBy: 10.0];
        [affin2 translateXBy: 10.0 yBy: 10.0];
        [affin appendTransform:affin2];
        [thePath1 transformUsingAffineTransform: affin];
        
        //set color
        [[NSColor redColor] set];
        [thePath1 fill];
    //unlock focus
    [_window.contentView unlockFocus];
    [_window.contentView displayIfNeeded];
}

#pragma mark -initWithTransform:
- (IBAction)method002:(id)sender {
    //make bezier path
	NSBezierPath *thePath1 = [NSBezierPath bezierPath];
	
    //make affin transform
    NSAffineTransform *affin = [NSAffineTransform transform];
	//NSAffineTransform *affin2 = [[NSAffineTransform alloc] initWithTransform:affin];
    
    //focus window's view
    [_window.contentView lockFocus];
        //clear window
        NSRect rect = [_window.contentView frame ];
        [[NSColor windowBackgroundColor] set];
        NSRectFill(rect);
        //set winding rule
        [thePath1 setWindingRule:NSEvenOddWindingRule];
        
        [thePath1 moveToPoint:NSMakePoint(20,20)];
        [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(50,50,100,100)];
        [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(20,20,80,80)];
        
        //1st draw
        [[NSColor blueColor] set];
        [thePath1 fill];
        
        [affin translateXBy: 50.0 yBy: 0.0];
        
        NSAffineTransform *affin2 = [[NSAffineTransform alloc] initWithTransform:affin];
        [thePath1 transformUsingAffineTransform: affin];
        
        //2nd draw
        [[NSColor yellowColor] set];
        [thePath1 fill];
        
        [affin2 translateXBy: 0.0 yBy: 50.0];
        [thePath1 transformUsingAffineTransform: affin2];
        //3rd draw
        [[NSColor redColor] set];
        [thePath1 fill];
    //unlock focus
    [_window.contentView unlockFocus];
    [_window.contentView displayIfNeeded];
}

#pragma mark -rotateByDegrees:
- (IBAction)method003:(id)sender {
    //make bezier path
	NSBezierPath *thePath1 = [NSBezierPath bezierPath];
	
    //make affin transform
    NSAffineTransform *affin = [NSAffineTransform transform];
	//NSAffineTransform *affin2 = [NSAffineTransform transform];
    
    //focus window's view
    [_window.contentView lockFocus];
    //clear window
    NSRect rect = [_window.contentView frame ];
    [[NSColor windowBackgroundColor] set];
    NSRectFill(rect);
    //set winding rule
    
	[thePath1 setWindingRule:NSEvenOddWindingRule];
	
	[thePath1 moveToPoint:NSMakePoint(20,20)];
	
	[thePath1 appendBezierPathWithOvalInRect:NSMakeRect(50,50,100,100)];
	[thePath1 appendBezierPathWithOvalInRect:NSMakeRect(20,20,80,80)];
	
    //1st drawing
	[[NSColor blueColor] set];
	[thePath1 fill];
	
    //add rotate transform
	[affin rotateByDegrees:30.0];
	
	
	[thePath1 transformUsingAffineTransform: affin];
	
    //2nd drawing
	[[NSColor redColor] set];
	[thePath1 fill];
	
    //unlock focus
    [_window.contentView unlockFocus];
    [_window.contentView displayIfNeeded];
}
#pragma mark -rotateByDegrees:
- (IBAction)method004:(id)sender {
    
    
    
    //make bezier path
	NSBezierPath *thePath1 = [NSBezierPath bezierPath];
	
    //make affin transform
    NSAffineTransform *affin = [NSAffineTransform transform];
	//NSAffineTransform *affin2 = [NSAffineTransform transform];
    
    //focus window's view
    [_window.contentView lockFocus];
    //clear window
    NSRect rect = [_window.contentView frame ];
    [[NSColor windowBackgroundColor] set];
    NSRectFill(rect);
    //set winding rule
    
	[thePath1 setWindingRule:NSEvenOddWindingRule];
	
	[thePath1 moveToPoint:NSMakePoint(20,20)];
	
	[thePath1 appendBezierPathWithOvalInRect:NSMakeRect(50,50,100,100)];
	[thePath1 appendBezierPathWithOvalInRect:NSMakeRect(20,20,80,80)];
	
    //1st drawing
	[[NSColor blueColor] set];
	[thePath1 fill];
	
    //already define inline function.
    //#define PI 3.14159265358979323846
    //static inline double radians(double degrees) { return degrees * PI / 180; }
    //add rotate transform
	[affin rotateByRadians:radians(-30.0)];
	
	
	[thePath1 transformUsingAffineTransform: affin];
	
    //2nd drawing
	[[NSColor redColor] set];
	[thePath1 fill];
	
    //unlock focus
    [_window.contentView unlockFocus];
    [_window.contentView displayIfNeeded];
}

#pragma mark -scaleBy:
- (IBAction)method005:(id)sender {
    //make bezier path
	NSBezierPath *thePath1 = [NSBezierPath bezierPath];
	
    //make affin transform
    NSAffineTransform *affin = [NSAffineTransform transform];
	
    //focus window's view
    [_window.contentView lockFocus];
        //clear window
        NSRect rect = [_window.contentView frame ];
        [[NSColor windowBackgroundColor] set];
        NSRectFill(rect);
        //set winding rule
        [thePath1 setWindingRule:NSEvenOddWindingRule];
        //move pen
        [thePath1 moveToPoint:NSMakePoint(20,20)];
        //make path
        [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(50,50,100,100)];
        [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(20,20,80,80)];
        //set color
        [[NSColor blueColor] set];
        
        //fill path
        [thePath1 fill];
        
        //set transform
        [affin scaleBy:1.5];
        [thePath1 transformUsingAffineTransform: affin];
        
        //set color
        [[NSColor redColor] set];
        [thePath1 fill];
    //unlock focus
    [_window.contentView unlockFocus];
    [_window.contentView displayIfNeeded];
}
#pragma mark -scaleXBy:yBy:
- (IBAction)method006:(id)sender {
    //make bezier path
	NSBezierPath *thePath1 = [NSBezierPath bezierPath];
	
    //make affin transform
    NSAffineTransform *affin = [NSAffineTransform transform];
	
    //focus window's view
    [_window.contentView lockFocus];
    //clear window
    NSRect rect = [_window.contentView frame ];
    [[NSColor windowBackgroundColor] set];
    NSRectFill(rect);
    //set winding rule
    [thePath1 setWindingRule:NSEvenOddWindingRule];
    //move pen
    [thePath1 moveToPoint:NSMakePoint(20,20)];
    //make path
    [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(50,50,100,100)];
    [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(20,20,80,80)];
    //set color
    [[NSColor blueColor] set];
    
    //fill path
    [thePath1 fill];
    
    //set transform
    [affin scaleXBy:1.5 yBy:3.0];
    [thePath1 transformUsingAffineTransform: affin];
    
    //set color
    [[NSColor redColor] set];
    [thePath1 fill];
    //unlock focus
    [_window.contentView unlockFocus];
    [_window.contentView displayIfNeeded];
}
#pragma mark -translateXBy:yBy:
- (IBAction)method007:(id)sender {
    //make bezier path
	NSBezierPath *thePath1 = [NSBezierPath bezierPath];
	
    //make affin transform
    NSAffineTransform *affin = [NSAffineTransform transform];
	
    //focus window's view
    [_window.contentView lockFocus];
    //clear window
    NSRect rect = [_window.contentView frame ];
    [[NSColor windowBackgroundColor] set];
    NSRectFill(rect);
    //set winding rule
    [thePath1 setWindingRule:NSEvenOddWindingRule];
    //move pen
    [thePath1 moveToPoint:NSMakePoint(20,20)];
    //make path
    [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(50,50,100,100)];
    [thePath1 appendBezierPathWithOvalInRect:NSMakeRect(20,20,80,80)];
    //set color
    [[NSColor blueColor] set];
    
    //fill path
    [thePath1 fill];
    
    //set transform
    [affin translateXBy:30.0 yBy:50.0];
    [thePath1 transformUsingAffineTransform: affin];
    
    //set color
    [[NSColor redColor] set];
    [thePath1 fill];
    //unlock focus
    [_window.contentView unlockFocus];
    [_window.contentView displayIfNeeded];
}

@end
