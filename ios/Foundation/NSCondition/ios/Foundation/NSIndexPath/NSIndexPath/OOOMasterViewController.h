//
//  OOOMasterViewController.h
//  NSIndexPath
//
//  Created by 大森 智史 on 2012/08/11.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OOODetailViewController;

@interface OOOMasterViewController : UITableViewController

@property (strong, nonatomic) OOODetailViewController *detailViewController;

- (void)insertNewObject:(id)sender;

@end
