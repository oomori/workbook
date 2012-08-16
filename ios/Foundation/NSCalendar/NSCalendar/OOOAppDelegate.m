//
//  OOOAppDelegate.m
//  NSCalendar
//
//  Created by 大森 智史 on 2012/08/15.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate
#pragma mark NSCalendar  initWithCalendarIdentifier:
-(void)method001
{
    NSCalendar *aCalendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    NSLog(@"%@",[aCalendar description]);
}

#pragma mark NSCalendar  initWithCalendarIdentifier:
-(void)method002
{
    NSCalendar *aCalendar = [NSCalendar currentCalendar];
    NSLog(@"%@",[aCalendar calendarIdentifier]);
}

#pragma mark NSCalendar  autoupdatingCurrentCalendar:
-(void)method003
{
    //OOOViewのサンプルを見た方がわかりやすい
    NSCalendar *aCalendar = [NSCalendar autoupdatingCurrentCalendar];
    NSLog(@"%@",[aCalendar calendarIdentifier]);
}

#pragma mark NSCalendar  autoupdatingCurrentCalendar:
-(void)method004
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSLog(@"%s %@",__FUNCTION__,[aCalendar calendarIdentifier]);
    NSLog(@"%s %d",__FUNCTION__,[aCalendar firstWeekday]);
    [aCalendar setFirstWeekday:2];//Monday
    NSLog(@"%s %d",__FUNCTION__,[aCalendar firstWeekday]);


}

#pragma mark NSCalendar  setLocale: / locale
-(void)method005
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"];
    [aCalendar setLocale:jpLocale];
    
    NSLocale *locale = [aCalendar locale];
    NSLog(@"%s %@",__FUNCTION__,[locale objectForKey:NSLocaleLanguageCode]);
 
    
}

#pragma mark NSCalendar  autoupdatingCurrentCalendar:
-(void)method006
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [aCalendar setFirstWeekday:2];//月曜始まりにした
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:2012];
    [comps setMonth:1];
    [comps setDay:2];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    //2012年1月2日は月曜日
    NSDate *date = [aCalendar dateFromComponents:comps];
    
    NSDateComponents *dComps = [aCalendar components:NSWeekCalendarUnit fromDate:date];
    NSLog(@"%s week : %d",__FUNCTION__ ,[dComps week]);
    //=>月曜始まりのカレンダーだと2012年1月2日は第2週になる
    
}

#pragma mark NSCalendar  setTimeZone: / timeZone
-(void)method007
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"JST"];
    [aCalendar setTimeZone:sourceTimeZone];
    
    NSTimeZone *zone = [aCalendar timeZone];
    NSLog(@"%s %@",__FUNCTION__,[zone abbreviation]);
    
    
}

#pragma mark NSCalendar  setTimeZone: / timeZone
-(void)method008
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSLog(@"%s 01 %d",__FUNCTION__,[gregorianCalendar minimumDaysInFirstWeek]);
    
    NSCalendar *buddhistCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSBuddhistCalendar];
    NSLog(@"%s 02 %d",__FUNCTION__,[buddhistCalendar minimumDaysInFirstWeek]);
    
    NSCalendar *chineseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    NSLog(@"%s 03 %d",__FUNCTION__,[chineseCalendar minimumDaysInFirstWeek]);
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];
    NSLog(@"%s 04 %d",__FUNCTION__,[hebrewCalendar minimumDaysInFirstWeek]);
    
    NSCalendar *islamicCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSIslamicCalendar];
    NSLog(@"%s 05 %d",__FUNCTION__,[islamicCalendar minimumDaysInFirstWeek]);
    
    NSCalendar *islamicCivilCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSIslamicCivilCalendar];
    NSLog(@"%s 06 %d",__FUNCTION__,[islamicCivilCalendar minimumDaysInFirstWeek]);

    NSCalendar *japaneseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSJapaneseCalendar];
    NSLog(@"%s 07 %d",__FUNCTION__,[japaneseCalendar minimumDaysInFirstWeek]);
    //=>1
    NSCalendar *republicOfChinaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSRepublicOfChinaCalendar];
    NSLog(@"%s 08 %d",__FUNCTION__,[republicOfChinaCalendar minimumDaysInFirstWeek]);
    //=>1
    NSCalendar *persianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSPersianCalendar];
    NSLog(@"%s 09 %d",__FUNCTION__,[persianCalendar minimumDaysInFirstWeek]);
    //=>1
    NSCalendar *indianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSIndianCalendar];
    NSLog(@"%s 10 %d",__FUNCTION__,[indianCalendar minimumDaysInFirstWeek]);
    //=>1
    NSCalendar *ISO8601Calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSISO8601Calendar];
    NSLog(@"%s 11 %d",__FUNCTION__,[ISO8601Calendar minimumDaysInFirstWeek]);
    //=>0
    
}
#pragma mark NSCalendar  setTimeZone: / timeZone
-(void)method009
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSRange unitRange = [aCalendar maximumRangeOfUnit:NSDayCalendarUnit];
    NSLog(@"%s %u,%u",__FUNCTION__,unitRange.location,unitRange.length);
    
    NSRange miniUnitRange = [aCalendar minimumRangeOfUnit:NSDayCalendarUnit];
    NSLog(@"%s %u,%u",__FUNCTION__,miniUnitRange.location,miniUnitRange.length);
}

#pragma mark NSCalendar  ordinalityOfUnit:
-(void)method010
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate * aDate = [formatter dateFromString:@"2012-08-15 01:23:45 +0900"];
    NSDate * bDate = [formatter dateFromString:@"2012-08-15 01:23:26 +0900"];
    
    NSUInteger aOrdinal =
    [aCalendar ordinalityOfUnit:NSSecondCalendarUnit
                                            inUnit:NSMonthCalendarUnit
                                           forDate:aDate];
    
    NSUInteger bOrdinal =
    [aCalendar ordinalityOfUnit:NSSecondCalendarUnit
                                            inUnit:NSMonthCalendarUnit
                                           forDate:bDate];
    
    NSLog(@"%s %d",__FUNCTION__, (aOrdinal - bOrdinal));
}

#pragma mark NSCalendar  ordinalityOfUnit:
-(void)method011
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate * aDate = [formatter dateFromString:@"2012-08-15 01:23:45 +0900"];
    
    NSRange aRange =
    [aCalendar rangeOfUnit:NSSecondCalendarUnit
                         inUnit:NSMonthCalendarUnit
                        forDate:aDate];
    NSLog(@"%s %u-%u",__FUNCTION__, aRange.location,aRange.length);
    //=>0-60
    NSRange bRange =
    [aCalendar rangeOfUnit:NSHourCalendarUnit
                    inUnit:NSMonthCalendarUnit
                   forDate:aDate];
    NSLog(@"%s %u-%u",__FUNCTION__, bRange.location,bRange.length);
    //=>0-24
    NSRange cRange =
    [aCalendar rangeOfUnit:NSDayCalendarUnit
                    inUnit:NSMonthCalendarUnit
                   forDate:aDate];
    NSLog(@"%s %u-%u",__FUNCTION__, cRange.location,cRange.length);
    //=>1-31
}

#pragma mark NSCalendar  rangeOfUnit:
-(void)method012
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate * aDate = [formatter dateFromString:@"2012-08-15 01:23:45 +0000"];
    

    NSDate *bDate ;
    NSTimeInterval bInt ;
    BOOL result = 
    [aCalendar rangeOfUnit:NSHourCalendarUnit
                 startDate:&bDate
                  interval:&bInt
                   forDate:aDate];
    if (result) {
        NSLog(@"%s %@ %f",__FUNCTION__, [bDate description],bInt);
    }else{
        NSLog(@"%s %@",__FUNCTION__,@"false");
    }
    //=>2012-08-15 01:00:00 +0000 3600.000000
}

#pragma mark NSCalendar  dateFromComponents:
-(void)method013
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [aCalendar setFirstWeekday:2];//月曜始まりにした
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:2012];
    [comps setMonth:1];
    [comps setDay:2];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    //2012年1月2日は月曜日
    NSDate *date = [aCalendar dateFromComponents:comps];
    
    NSDateComponents *dComps = [aCalendar components:NSWeekCalendarUnit fromDate:date];
    NSLog(@"%s week : %d",__FUNCTION__ ,[dComps week]);
    //=>月曜始まりのカレンダーだと2012年1月2日は第2週になる
    
}

#pragma mark NSCalendar  dateFromComponents:
-(void)method014
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate * aDate = [formatter dateFromString:@"2012-08-15 01:23:45 +0000"];
    
    NSDateComponents *comps =
    [aCalendar components:NSWeekCalendarUnit fromDate:aDate];

    NSLog(@"%s week : %d",__FUNCTION__ ,[comps week]);
    //=>34
    
}

#pragma mark NSCalendar  dateFromComponents:
-(void)method015
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate * aDate = [formatter dateFromString:@"2012-08-15 01:23:45 +0000"];
    NSDate * bDate = [formatter dateFromString:@"2012-08-15 03:23:45 +0000"];
    
    NSDateComponents *comps =
    [aCalendar components:NSMinuteCalendarUnit
                 fromDate:aDate
                   toDate:bDate
                  options:NSWrapCalendarComponents
     ];
    
    NSLog(@"%s week : %d",__FUNCTION__ ,[comps minute]);
    //=>120
    
}

#pragma mark NSCalendar  dateByAddingComponents:toDate:options:
-(void)method016
{
    NSCalendar *aCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    NSDate * aDate = [formatter dateFromString:@"2012-08-15 01:01:45 +0000"];
    NSDate * bDate = [formatter dateFromString:@"2012-08-15 03:23:45 +0000"];
    
    NSDateComponents *aComps =
    [aCalendar components:NSMinuteCalendarUnit fromDate:aDate];
    NSDate *cDate =
    [aCalendar dateByAddingComponents:aComps
                               toDate:bDate
                              options:0];
    
    NSLog(@"%s %@",__FUNCTION__ ,[cDate description]);
    //=>2012-08-15 03:23:45 +0000
    
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
