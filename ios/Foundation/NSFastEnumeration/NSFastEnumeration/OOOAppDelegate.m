//
//  OOOAppDelegate.m
//  NSFastEnumeration
//
//  Created by 大森 智史 on 2012/08/12.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"
#import "OOOTestArray.h"

@implementation OOOAppDelegate

#pragma mark NSFastEnumeration NSArray
-(void)method001
{
    NSArray *array = [NSArray arrayWithObjects:
                      @"Jan", @"Feb", @"Mar", @"Apr", nil];
    
    for (NSString *element in array) {
        NSLog(@"%s  %@", __FUNCTION__, element);
    }
}

#pragma mark NSFastEnumeration NSDictionary
-(void)method002
{
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Mutuki", @"January", @"Kisaragi", @"February", @"Yayoi", @"March", nil];
    
    NSString *key;
    for (key in aDictionary) {
        NSLog(@"English: %@, Japanese: %@", key, [aDictionary objectForKey:key]);
    }
}

#pragma mark NSFastEnumeration NSSet
-(void)method003
{
    NSSet *aSet = [NSSet setWithObjects:
                      @"Jan", @"Feb", @"Mar", @"Apr", nil];
    
    for (NSString *element in aSet) {
        NSLog(@"%s  %@", __FUNCTION__, element);
    }
}

#pragma mark NSFastEnumeration NSOrderedSet
-(void)method004
{
    NSOrderedSet *aSet = [NSOrderedSet orderedSetWithObjects:
                   @"Jan", @"Feb", @"Mar", @"Apr", nil];
    
    for (NSString *element in aSet) {
        NSLog(@"%s  %@", __FUNCTION__, element);
    }
}

#pragma mark NSFastEnumeration 
-(void)method005
{
    OOOStack *stack=[[OOOStack alloc] init];
    [stack appendObj: [OOOTestArray objWithName: @"aaa"] ];
    [stack appendObj: [OOOTestArray objWithName: @"bbb"] ];
    [stack appendObj: [OOOTestArray objWithName: @"ccc"] ];
    [stack appendObj: [OOOTestArray objWithName: @"ddd"] ];
    int count=0;
    for(OOOTestArray *obj in stack) {
        NSLog(@"%@", obj.name);
        ++count;
    }
    NSLog(@"Total %d objects.", count);

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    [self method003];
    
    [self method004];
        [self method005];
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
