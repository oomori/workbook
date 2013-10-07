//
//  OOOViewController.m
//  UIFont
//
//  Created by 大森 智史 on 12/02/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOViewController.h"

@implementation OOOViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark boldSystemFontOfSize
-(void)method001
{
    
	UITextView *aView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,320,80)];
	
	UIFont *aFont = [UIFont boldSystemFontOfSize:30];
	aView.font = aFont;
    aView.text = @"bold";
    
	[self.view addSubview:aView];
	
 
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self method001];

	
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
