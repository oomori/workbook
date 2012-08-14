//
//  OOOViewController.m
//  NSMutableDictionary
//
//  Created by 大森 智史 on 12/07/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
