//
//  OOOViewController.m
//  UIStoryboard
//
//  Created by air on 2013/10/07.
//  Copyright (c) 2013年 oomori. All rights reserved.
//

#import "OOOFirstViewController.h"

@interface OOOFirstViewController ()

@end

@implementation OOOFirstViewController

@synthesize testID;
#pragma mark UIStoryboard performSegueWithIdentifier
- (IBAction)method001:(id)sender {
    [self performSegueWithIdentifier:@"toEditor" sender:self];
}
- (IBAction)popView:(id)sender {
    NSLog(@"%@",((OOOFirstViewController *)self.presentingViewController));
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toEditor"]) {
        testID = @"111";
        //id destinationViewController = segue.destinationViewController;
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = _objects[indexPath.row];
        //[[segue destinationViewController] setDetailItem:object];
        NSLog(@"%@",[segue identifier]);
    }
    id destinationViewController = segue.destinationViewController;
    NSLog(@"%@",[destinationViewController description]);
    
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
