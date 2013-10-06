//
//  OOOFirstViewController.h
//  WordNetJPN
//
//  Created by 大森 智史 on 2013/04/14.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOFirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate>
{
    
    __weak IBOutlet UISearchBar *searchField;
    NSMutableArray *words;
    NSMutableArray *selectedWords;
    //__weak IBOutlet UITableView *tableView;
    //UINavigationController *navi;
}
- (IBAction)search:(id)sender;
//
@property (nonatomic,retain) NSMutableArray *words;
@property (nonatomic,retain) NSMutableArray *selectedWords;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
