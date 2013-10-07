//
//  OOOEditViewController.m
//  UIStoryboard
//
//  Created by air on 2013/10/07.
//  Copyright (c) 2013年 oomori. All rights reserved.
//

#import "OOOSecondViewController.h"

@interface OOOSecondViewController ()

@end

@implementation OOOSecondViewController

- (IBAction)popView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

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

@end
