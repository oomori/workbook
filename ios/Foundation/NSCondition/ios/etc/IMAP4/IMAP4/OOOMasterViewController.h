//
//  OOOMasterViewController.h
//  IMAP4
//
//  Created by 大森 智史 on 2012/09/08.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OOODetailViewController;

#import <CoreData/CoreData.h>

@interface OOOMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) OOODetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
