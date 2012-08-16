//
//  OOOAppDelegate.m
//  NSDate
//
//  Created by 大森 智史 on 2012/08/15.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

#pragma mark NSDate date
-(void)method001
{
    NSDate *aDate = [NSDate date];
    
    NSLog(@"%s %@",__FUNCTION__,[aDate description]);
    //=>-[OOOAppDelegate method001] 2012-08-15 14:12:26 +0000
}
#pragma mark NSDate dateWithTimeIntervalSinceNow
-(void)method002
{
    NSDate *aDate = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)60];
    
    NSLog(@"%s %@",__FUNCTION__,[aDate description]);
    //=>-[OOOAppDelegate method001] 2012-08-15 14:12:26 +0000
}

#pragma mark NSDate dateWithTimeInterval:
-(void)method003
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
    NSDate *bDate = [NSDate dateWithTimeInterval:(NSTimeInterval)60 sinceDate:aDate];
    
    NSLog(@"%s %@",__FUNCTION__,[aDate description]);
    NSLog(@"%s %@",__FUNCTION__,[bDate description]);
    //=>-[OOOAppDelegate method003] 2012-08-14 15:00:00 +0000
    //=>-[OOOAppDelegate method003] 2012-08-14 15:01:00 +0000
}
#pragma mark NSDate dateWithTimeInterval:
-(void)method004
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
    NSDate *bDate = [NSDate dateWithTimeInterval:(NSTimeInterval)60 sinceDate:aDate];
    
    NSLog(@"%s %@",__FUNCTION__,[aDate description]);
    NSLog(@"%s %@",__FUNCTION__,[bDate description]);
    //=>-[OOOAppDelegate method003] 2012-08-14 15:00:00 +0000
    //=>-[OOOAppDelegate method003] 2012-08-14 15:01:00 +0000
}

#pragma mark NSDate dateWithTimeInterval:
-(void)method005
{
    NSDate *aDate = [NSDate dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)60];
    
    NSLog(@"%s %@",__FUNCTION__,[aDate description]);
    //=>-[OOOAppDelegate method003] 2012-08-14 15:00:00 +0000
}

#pragma mark NSDate dateWithTimeInterval:
-(void)method006
{
    NSDate *aDate = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)60];
    
    NSLog(@"%s %@",__FUNCTION__,[aDate description]);
    //=>-[OOOAppDelegate method003] 2012-08-14 15:00:00 +0000
}

#pragma mark NSDate dateWithTimeInterval:
-(void)method007
{
    NSLog(@"%s %@",__FUNCTION__,[NSDate distantFuture]);
    //=>-[OOOAppDelegate method007] 4001-01-01 00:00:00 +0000
    NSLog(@"%s %@",__FUNCTION__,[NSDate distantPast]);
    //=>-[OOOAppDelegate method007] 0001-12-30 00:00:00 +0000
}

#pragma mark NSDate isEqualToDate:
-(void)method008
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
    NSDate *bDate = [formatter dateFromString:@"2012-08-16 00:00:00 +0900"];
    
    
    NSLog(@"%s isEqualToDate :%@",__FUNCTION__,([aDate isEqualToDate:bDate])?@"YES":@"NO");
    //=>-[OOOAppDelegate method008] isEqualToDate :NO
}

#pragma mark NSDate earlierDate: laterDate:
-(void)method009
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
    NSDate *bDate = [formatter dateFromString:@"2012-08-16 00:00:00 +0900"];
    
    NSDate *cDate = [aDate earlierDate:bDate];
    NSLog(@"%s %@",__FUNCTION__,[cDate description]);
    //=>-[OOOAppDelegate method009] 2012-08-14 15:00:00 +0000
    
    NSDate *dDate = [aDate laterDate:bDate];
    NSLog(@"%s %@",__FUNCTION__,[dDate description]);
    //=>-[OOOAppDelegate method009] 2012-08-15 15:00:00 +0000
}

#pragma mark NSDate isEqualToDate:
-(void)method010
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
    NSDate *bDate = [formatter dateFromString:@"2012-08-16 00:00:00 +0900"];
    
    switch ([aDate compare:bDate]) {
        case NSOrderedAscending:
            NSLog(@"NSOrderedAscending");
            break;
        case NSOrderedSame:
            NSLog(@"NSOrderedSame");
            break;
        case NSOrderedDescending:
            NSLog(@"NSOrderedDescending");
            break;
            
        default:
            break;
    }
    //=>NSOrderedAscending
}

#pragma mark NSDate descriptionWithLocale:
-(void)method011
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
    
    NSDate *cDate = [aDate dateByAddingTimeInterval:(NSTimeInterval)60];
    NSString *desc = [cDate description];
    NSLog(@"%s %@",__FUNCTION__,desc);
    //=>2012-08-14 15:01:00 +0000
    
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"];
    NSString *loDesc = [cDate descriptionWithLocale:jpLocale];
    NSLog(@"%s %@",__FUNCTION__,loDesc);
    //=>2012年8月15日水曜日 0時01分00秒 日本標準時

}

#pragma mark NSDate timeIntervalSinceDate:
-(void)method012
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
    NSDate *bDate = [formatter dateFromString:@"2012-08-15 00:01:00 +0900"];
    
    NSTimeInterval interval = [aDate timeIntervalSinceDate:bDate];
    NSLog(@"%s %f",__FUNCTION__,interval);
    
}

#pragma mark NSDate timeIntervalSinceDate:
-(void)method013
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
 
    NSTimeInterval interval = [aDate timeIntervalSinceNow];
    NSLog(@"%s %f",__FUNCTION__,interval);
    
}

#pragma mark NSDate timeIntervalSinceDate:
-(void)method014
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
    
    NSTimeInterval interval = [aDate timeIntervalSinceReferenceDate];
    NSLog(@"%s %f",__FUNCTION__,interval);
    
}

#pragma mark NSDate timeIntervalSinceDate:
-(void)method015
{

    NSTimeInterval interval = [NSDate timeIntervalSinceReferenceDate];
    NSLog(@"%s %f",__FUNCTION__,interval);
    
}
#pragma mark NSDate timeIntervalSinceDate:
-(void)method016
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate *aDate = [formatter dateFromString:@"2012-08-15 00:00:00 +0900"];
    
    NSTimeInterval interval = [aDate timeIntervalSince1970];
    NSLog(@"%s %f",__FUNCTION__,interval);
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    [self method003];
    [self method004];
    [self method005];
    
    [self method006];
    [self method007];
    [self method008];
    [self method009];
    [self method010];
    [self method011];
    [self method012];
    [self method013];
    [self method014];
    
    [self method015];
    [self method016];
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
