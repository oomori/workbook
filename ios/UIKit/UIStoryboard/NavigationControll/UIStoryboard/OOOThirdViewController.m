//
//  OOOThirdViewController.m
//  UIStoryboard
//
//  Created by 大森 智史 on 2013/10/07.
//  Copyright (c) 2013年 oomori. All rights reserved.
//

#import "OOOThirdViewController.h"

@interface OOOThirdViewController ()

@end

@implementation OOOThirdViewController
- (IBAction)popView:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
