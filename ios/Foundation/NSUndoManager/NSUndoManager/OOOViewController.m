//
//  OOOViewController.m
//  NSUndoManager
//
//  Created by 大森 智史 on 2012/09/23.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"


@interface OOOViewController ()

@end

@implementation OOOViewController


@synthesize theUndoManager;

-(IBAction)addButton {
	[self addATruck];
    [persons addATruck];
}
- (IBAction)removeButton:(id)sender {
	[self removeATruck];
    [persons removeATruck];
}

//増加
-(void)addATruck {
	i += 1;
	[[theUndoManager prepareWithInvocationTarget:self] removeATruck];
	[theUndoManager setActionName:@"Add A Truck"];
	[self updateTitle];
}

//減少
-(void)removeATruck {
	i -= 1;
	[[theUndoManager prepareWithInvocationTarget:self] addATruck];
	[self updateTitle];
}

-(void)updateTitle {
	NSString *title = [NSString stringWithFormat:@"%i", i];
	[button setTitle:title forState:UIControlStateNormal];
	[button setTitle:title forState:UIControlStateHighlighted];
	[button setTitle:title forState:UIControlStateSelected];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	i = 0;
	theUndoManager = [[NSUndoManager alloc] init];
    persons = [[OOOPresonList alloc] init];
}

-(BOOL)canBecomeFirstResponder {
	return YES;
}

-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self becomeFirstResponder];
    
}

- (void)viewWillDisappear:(BOOL)animated {
	[self resignFirstResponder];
	[super viewWillDisappear:animated];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES; // supports all interface orientations
    
	/* more general form is:
     
     return (interfaceOrientation == UIInterfaceOrientationPortrait ||
     interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ||
     interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
     interfaceOrientation == UIInterfaceOrientationLandscapeRight)
	 
     */
}
@end