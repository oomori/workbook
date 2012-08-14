//
//  OOOAppDelegate.m
//  NSIndexPath
//
//  Created by 大森 智史 on 2012/08/11.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"
#import "OOOMasterViewController.h"

@implementation OOOAppDelegate

#pragma mark NSIndexPath 準備
-(void)method000
{
    UINavigationController *navCon = (UINavigationController *)self.window.rootViewController;
    OOOMasterViewController *mvCon = (OOOMasterViewController *)navCon.topViewController;
    
    for (int i = 0; i <20; i++) {
        [mvCon insertNewObject:self];
    }
    
    
    
}


#pragma mark NSIndexPath indexPathForRow:inSection:
//NSIndexPath (UITableView)
-(void)method001
{
    UINavigationController *navCon = (UINavigationController *)self.window.rootViewController;
    OOOMasterViewController *mvCon = (OOOMasterViewController *)navCon.topViewController;
    UITableView *tableView = mvCon.tableView;
    NSLog(@"%s %@",__FUNCTION__,[tableView class]) ;
    
    //セクション0のインデックス15
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:15 inSection:0];
    
    //テーブルビューの指定の位置に移動
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];

    
}

#pragma mark NSIndexPath indexPathWithIndex:
-(void)method002
{
    //
    NSIndexPath* indexPath = [NSIndexPath indexPathWithIndex:10];
    NSLog(@"%s %@",__FUNCTION__,indexPath);
}

#pragma mark NSIndexPath indexPathWithIndexes:
-(void)method003
{
    NSUInteger integer[5] ;
    integer[0] = 10;
    integer[1] = 10;
    integer[2] = 10;
    integer[3] = 10;
    integer[4] = 10;
    
    NSIndexPath* indexPath = [NSIndexPath indexPathWithIndexes:integer length:5];
    NSLog(@"%s %@",__FUNCTION__,indexPath);
}

#pragma mark NSIndexPath indexPathWithIndex:
-(void)method004
{
    NSUInteger integer[5] ;
    integer[0] = 10;
    integer[1] = 20;
    integer[2] = 30;
    integer[3] = 40;
    integer[4] = 50;
    
    NSIndexPath* indexPath = [NSIndexPath indexPathWithIndexes:integer length:5];
    
    NSUInteger position = [indexPath indexAtPosition:1];
    NSLog(@"%s %d",__FUNCTION__,position);
}

#pragma mark NSIndexPath indexPathWithIndex:
-(void)method005
{
    NSUInteger integer[5] ;
    integer[0] = 10;
    integer[1] = 20;
    integer[2] = 30;
    integer[3] = 40;
    integer[4] = 50;
    
    NSIndexPath* indexPath = [NSIndexPath indexPathWithIndexes:integer length:5];
    
    NSIndexPath* indexPath2 = [indexPath indexPathByAddingIndex:60];
    NSLog(@"%s %@",__FUNCTION__,indexPath2);
}

#pragma mark NSIndexPath indexPathWithIndex:
-(void)method006
{
    NSUInteger integer[5] ;
    integer[0] = 10;
    integer[1] = 20;
    integer[2] = 30;
    integer[3] = 40;
    integer[4] = 50;
    
    NSIndexPath* indexPath = [NSIndexPath indexPathWithIndexes:integer length:5];
    
    NSIndexPath* indexPath2 = [indexPath indexPathByRemovingLastIndex];
    NSLog(@"%s %@",__FUNCTION__,indexPath2);
}

#pragma mark NSIndexPath length
-(void)method007
{
    NSUInteger integer[5] ;
    integer[0] = 10;
    integer[1] = 20;
    integer[2] = 30;
    integer[3] = 40;
    integer[4] = 50;
    
    NSIndexPath* indexPath = [NSIndexPath indexPathWithIndexes:integer length:5];
    
    NSUInteger pathLength = [indexPath length];
    NSLog(@"%s %u",__FUNCTION__,pathLength);
}



#pragma mark NSIndexPath getIndexes:
-(void)method008
{
    NSUInteger integer[5] ;
    integer[0] = 10;
    integer[1] = 20;
    integer[2] = 30;
    integer[3] = 40;
    integer[4] = 50;
    
    NSIndexPath* indexPath = [NSIndexPath indexPathWithIndexes:integer length:5];
    
    NSUInteger indexes[5];
    [indexPath getIndexes:indexes];
    NSLog(@"%s %u",__FUNCTION__,indexes[1]);
}

#pragma mark NSIndexPath compare:
-(void)method009
{
    NSUInteger integer1[5] ;
    integer1[0] = 10;
    integer1[1] = 20;
    integer1[2] = 30;
    integer1[3] = 40;
    integer1[4] = 50;
    
    NSIndexPath* indexPath1 = [NSIndexPath indexPathWithIndexes:integer1 length:5];
    
    NSUInteger integer2[5] ;
    integer2[0] = 10;
    integer2[1] = 20;
    integer2[2] = 30;
    integer2[3] = 40;
    integer2[4] = 50;
    
    NSIndexPath* indexPath2 = [NSIndexPath indexPathWithIndexes:integer2 length:5];
    
    NSLog(@"%s %@",__FUNCTION__,([indexPath1 compare:indexPath2] == NSOrderedSame)?@"YES":@"NO");
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
    }
    
    [self method000];
    [self method001];
    [self method002];
    [self method003];
    [self method004];
    [self method005];
    [self method006];
    [self method007];
    [self method008];
    
    [self method009];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
