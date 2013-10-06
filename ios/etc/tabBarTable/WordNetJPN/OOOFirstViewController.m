//
//  OOOFirstViewController.m
//  WordNetJPN
//
//  Created by 大森 智史 on 2013/04/14.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOFirstViewController.h"
#import "DetailViewController.h"


@interface OOOFirstViewController ()

@end

@implementation OOOFirstViewController

@synthesize words;
@synthesize selectedWords;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //setup word array
    words = [NSMutableArray arrayWithCapacity:10];
    selectedWords = [NSMutableArray arrayWithCapacity:10];
    
    //read default file
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"sampleText" withExtension:@"txt"];
    
    //add object
	NSString *multiLine = [NSString stringWithContentsOfURL:modelURL encoding:NSUTF8StringEncoding error:nil];
    
	[multiLine enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
		[words addObject:line];
	}];

    
    //navi = [[UINavigationController alloc] initWithRootViewController:self];
}
- (IBAction)insertNewObject:(id)sender
{
    if (!self.words) {
        self.words = [[NSMutableArray alloc] init];
    }
    /*
    [self.words insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
     
     */
}
- (IBAction)search:(id)sender
{
    NSLog(@"%@",[[sender textLabel] text]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark -
#pragma mark Search
- (void) searchItem:(NSString *) searchText {
    // 検索処理
}

- (void) searchBarSearchButtonClicked: (UISearchBar *) searchBar {
    [searchBar resignFirstResponder];
    [self searchItem:searchBar.text];
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *) searchText {
    NSLog(@"serch text=%@", searchText);
    if ([searchText length]!=0) {
        // インクリメンタル検索など
        [self searchItem:searchText];
    }
}

- (BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchString:(NSString*)searchString {
    
    [selectedWords removeAllObjects];

    for(NSString *label in self.words) {
        NSRange range = [label rangeOfString:searchString
                                     options:NSCaseInsensitiveSearch];
        if(!(range.location == NSNotFound)){
            [selectedWords addObject:label];

        }
    }

     return YES;
}

#pragma mark -
#pragma mark Table Data source Methods

-(NSInteger)tableView:( UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        
	return ([self.selectedWords count]>0)?[self.selectedWords count]:[self.words count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 44;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
       [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //タブ内入れ替え
    NSMutableArray *tabs = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];
    DetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    
    controller.backController = self;
    
    //NSLog(@"%@",[controller.displayDataDic description]);
    //showDetail
    UIViewController *tmpController = [tabs objectAtIndex:0];
    controller.tabBarItem = tmpController.tabBarItem;
    [tabs replaceObjectAtIndex:0 withObject:controller];
    [self.tabBarController setViewControllers:tabs animated:NO];
    [UIView transitionWithView:tmpController.view duration:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
        tmpController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [self.navigationController pushViewController:tmpController animated:NO];
        [tmpController.view removeFromSuperview];
    }];
    
    
    [controller.displayDataDic removeAllObjects];
    controller.displayDataDic = [NSMutableDictionary dictionaryWithCapacity:1];
    
    if (selectedWords.count) {
        [controller.displayDataDic setObject:[selectedWords objectAtIndex:indexPath.row] forKey:@"word"];
    }else{
        [controller.displayDataDic setObject:[words objectAtIndex:indexPath.row] forKey:@"word"];
    }
    [controller setupDisplay];
    /*
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
     detailViewController.view.frame = self.view.bounds;
     detailViewController.view.alpha = 0.0;
    [self.view addSubview:detailViewController.view];
    [self.view bringSubviewToFront:detailViewController.view];
     
     [UIView transitionWithView:detailViewController.view duration:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
     detailViewController.view.alpha = 1.0;
     } completion:^(BOOL finished) {
     [self.navigationController pushViewController:detailViewController animated:NO];
     [detailViewController.view removeFromSuperview];
     }];
    */
    NSLog(@"%@",[tmpController description]);
    
     

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}
-(UITableViewCell *)tableView:( UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	static NSString *CellIdentifier = @"CellTableIdentifier";
    
    UITableViewCell *aCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (aCell == nil) {
        aCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    if ([self.selectedWords count]>0){
        aCell.textLabel.text = (self.selectedWords)[row];
    }else{
        aCell.textLabel.text = (self.words)[row];
        
    }

	return aCell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = _objects[indexPath.row];
        //[[segue destinationViewController] setDetailItem:object];
        
    }
    NSLog(@"showDetail");
}
//削除、挿入
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		[words removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
        //
    }
}
@end
