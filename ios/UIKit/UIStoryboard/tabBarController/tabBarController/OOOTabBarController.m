//
//  OOOTabBarController.m
//  tabBarController
//
//  Created by 大森 智史 on 2013/10/07.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOTabBarController.h"

@interface OOOTabBarController ()

@end

@implementation OOOTabBarController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toEditor"]) {
        
        //id destinationViewController = segue.destinationViewController;
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = _objects[indexPath.row];
        //[[segue destinationViewController] setDetailItem:object];
        NSLog(@"%@",[segue identifier]);
    }
    id destinationViewController = segue.destinationViewController;
    NSLog(@"%@",[destinationViewController description]);
    
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
