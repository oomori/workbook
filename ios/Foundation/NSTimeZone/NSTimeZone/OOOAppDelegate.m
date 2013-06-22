//
//  OOOAppDelegate.m
//  NSTimeZone
//
//  Created by 大森 智史 on 2012/08/16.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate
#pragma mark NSTimeZone
-(void)method001
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSTimeZone *tZone = [NSTimeZone timeZoneWithAbbreviation:@"JST"];
    [formatter setTimeZone:tZone];
    
    NSDate * aDate = [formatter dateFromString:@"2012-08-15 01:01:45 +0000"];
    
    NSLog(@"%s %@",__FUNCTION__ ,[tZone name]);
    //=>-[OOOAppDelegate method001] Asia/Tokyo
    
    NSLog(@"%s %d",__FUNCTION__ ,[tZone secondsFromGMT]);
    //=>-[OOOAppDelegate method001] 32400
    
    NSLog(@"%s %d",__FUNCTION__ ,[tZone secondsFromGMTForDate:aDate]);
    //=>-[OOOAppDelegate method001] 32400
    
    NSLog(@"%s %@",__FUNCTION__ ,[tZone abbreviation]);
    //=>-[OOOAppDelegate method001] JST
    
    NSLog(@"%s %@",__FUNCTION__ ,[tZone abbreviationForDate:aDate]);
    //=>-[OOOAppDelegate method001] JST
    
    NSLog(@"%s %@",__FUNCTION__ ,[tZone data]);
    //=>-[OOOAppDelegate method001] <545a6966 00000000 ...
}

#pragma mark NSTimeZone
-(void)method002
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSTimeZone *tZone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:tZone];
    
    NSDate * aDate = [formatter dateFromString:@"2012-08-15 01:01:45 +0000"];
    
    NSLog(@"%s %@",__FUNCTION__ ,[tZone name]);
    //=>-[OOOAppDelegate method002] Asia/Tokyo
    
    NSLog(@"%s %d",__FUNCTION__ ,[tZone secondsFromGMT]);
    //=>-[OOOAppDelegate method002] 32400
    
    NSLog(@"%s %d",__FUNCTION__ ,[tZone secondsFromGMTForDate:aDate]);
    //=>-[OOOAppDelegate method002] 32400
    
    NSLog(@"%s %@",__FUNCTION__ ,[tZone abbreviation]);
    //=>-[OOOAppDelegate method002] JST
    
    NSLog(@"%s %@",__FUNCTION__ ,[tZone abbreviationForDate:aDate]);
    //=>-[OOOAppDelegate method002] JST
    
    NSLog(@"%s %@",__FUNCTION__ ,[tZone data]);
    //=>-[OOOAppDelegate method002] <545a6966 00000000 ...

}
#pragma mark NSTimeZone
-(void)method003
{

    NSLog(@"%s %@",__FUNCTION__ ,[[NSTimeZone localTimeZone] name]);
    //=>-[OOOAppDelegate method003] Asia/Tokyo

    NSLog(@"%s %@",__FUNCTION__ ,[[NSTimeZone defaultTimeZone]  name]);
    NSLog(@"%s %@",__FUNCTION__ ,[[NSTimeZone systemTimeZone]  name]);
    //=>-[OOOAppDelegate method003] Asia/Tokyo

    NSTimeZone *tZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [NSTimeZone setDefaultTimeZone:tZone];
    
    NSLog(@"%s %@",__FUNCTION__ ,[[NSTimeZone defaultTimeZone]  name]);
    NSLog(@"%s %@",__FUNCTION__ ,[[NSTimeZone systemTimeZone]  name]);
    //=>-[OOOAppDelegate method003] Asia/Tokyo
    
    [NSTimeZone resetSystemTimeZone];
    
    NSLog(@"%s %@",__FUNCTION__ ,[[NSTimeZone defaultTimeZone]  name]);
    NSLog(@"%s %@",__FUNCTION__ ,[[NSTimeZone systemTimeZone]  name]);
    //=>-[OOOAppDelegate method003] Asia/Tokyo
    
    NSLog(@"%s %@",__FUNCTION__ ,[NSTimeZone abbreviationDictionary]);
    
    NSDictionary *aDictionary = @{@"JST": @"Asia/Tokyo"};
    //NSLog(@"%s %@",__FUNCTION__ ,[NSTimeZone knownTimeZoneNames]);
    
    [NSTimeZone setAbbreviationDictionary:aDictionary];
    NSLog(@"%s %@",__FUNCTION__ ,[NSTimeZone abbreviationDictionary]);
}


#pragma mark NSTimeZone
-(void)method004
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSTimeZone *tZone = [NSTimeZone timeZoneWithAbbreviation:@"EDT"];
    [formatter setTimeZone:tZone];
    
    NSDate * aDate = [formatter dateFromString:@"2012-08-15 10:01:45 +0000"];
    
    
    NSLog(@"%s %@",__FUNCTION__ ,([tZone isDaylightSavingTime])?@"YES":@"NO");
    
    NSLog(@"%s %f",__FUNCTION__ ,[tZone daylightSavingTimeOffset]);

    NSLog(@"%s %@",__FUNCTION__ ,([tZone isDaylightSavingTimeForDate:aDate])?@"YES":@"NO");
    
    NSLog(@"%s %f",__FUNCTION__ ,[tZone daylightSavingTimeOffsetForDate:aDate]);
    
    NSDate *nextDate = [tZone nextDaylightSavingTimeTransition];
    NSLog(@"%s %@",__FUNCTION__ ,nextDate);
}

#pragma mark NSTimeZone
-(void)method005
{

    NSTimeZone *tZone = [NSTimeZone timeZoneWithAbbreviation:@"EDT"];
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"];
    NSLog(@"%s %@",__FUNCTION__ ,[tZone localizedName:NSTimeZoneNameStyleGeneric locale:jpLocale]);
    //=>アメリカ東部時間
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
