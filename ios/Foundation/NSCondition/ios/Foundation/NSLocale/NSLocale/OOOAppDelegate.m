//
//  OOOAppDelegate.m
//  NSLocale
//
//  Created by 大森 智史 on 2012/08/17.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate
#pragma mark NSLocale initWithLocaleIdentifier:

-(void)method001
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
#pragma mark NSLocale 
-(void)method002
{
    NSArray *anArray = [NSLocale availableLocaleIdentifiers];
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"];
    __block NSMutableArray *bArray = [NSMutableArray array];
    [anArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列
            usingBlock:^(id obj,NSUInteger idx,BOOL *stop){
                                  
                NSLocale *elementLocale = [[NSLocale alloc] initWithLocaleIdentifier:obj];
                
                NSDictionary *elementDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[jpLocale displayNameForKey:NSLocaleIdentifier value:obj],@"displayname", nil];
                  
                  
            if ([elementLocale objectForKey:NSLocaleCurrencyCode]) {
                    
                //if (![[elementLocale objectForKey:NSLocaleDecimalSeparator] isEqual:@","]) {
                [bArray addObject:elementDictionary];
                  NSLog(@"%s \n %@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@", __FUNCTION__,
                        obj,
                        [jpLocale displayNameForKey:NSLocaleIdentifier value:obj],
                        [jpLocale displayNameForKey:NSLocaleLanguageCode value:obj],
                        [jpLocale displayNameForKey:NSLocaleCountryCode value:obj],
                        [elementLocale objectForKey:NSLocaleIdentifier],
                        [elementLocale objectForKey:NSLocaleLanguageCode],
                        [elementLocale objectForKey:NSLocaleCountryCode],
                        [elementLocale objectForKey:NSLocaleScriptCode],
                        [elementLocale objectForKey:NSLocaleVariantCode],
                        [elementLocale objectForKey:NSLocaleExemplarCharacterSet],
                        [[elementLocale objectForKey:NSLocaleCalendar] calendarIdentifier],
                        [elementLocale objectForKey:NSLocaleCollationIdentifier],
                        [elementLocale objectForKey:NSLocaleUsesMetricSystem],
                        [elementLocale objectForKey:NSLocaleMeasurementSystem],
                        
                        [elementLocale objectForKey:NSLocaleDecimalSeparator],
                        [elementLocale objectForKey:NSLocaleGroupingSeparator],
                        [elementLocale objectForKey:NSLocaleCurrencySymbol],
                        [elementLocale objectForKey:NSLocaleCurrencyCode],
                        [elementLocale objectForKey:NSLocaleCollatorIdentifier],
                        [elementLocale objectForKey:NSLocaleQuotationBeginDelimiterKey],
                        
                        [elementLocale objectForKey:NSLocaleQuotationBeginDelimiterKey],
                        [elementLocale objectForKey:NSLocaleQuotationEndDelimiterKey],
                        [elementLocale objectForKey:NSLocaleAlternateQuotationBeginDelimiterKey],
                        [elementLocale objectForKey:NSLocaleAlternateQuotationEndDelimiterKey]
                        
                   

                        );
            //}
            }
                
                              }];
     NSLog(@"%s : %d", __FUNCTION__,[bArray count]);
    
    
}

#pragma mark NSLocale initWithLocaleIdentifier:
-(void)method003
{
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"];
    NSLog(@"%s %@",__FUNCTION__,[jpLocale localeIdentifier]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleIdentifier]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleLanguageCode]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleCountryCode]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleScriptCode]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleVariantCode]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleExemplarCharacterSet]);
    
    
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [jpLocale objectForKey:NSLocaleExemplarCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    NSLog(@"%s %@",__FUNCTION__,mString);
    
    NSLog(@"%s %@",__FUNCTION__,[[jpLocale objectForKey:NSLocaleCalendar] calendarIdentifier]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleCollationIdentifier]);
    
    NSLog(@"%s メートル法　%@",__FUNCTION__,([jpLocale objectForKey:NSLocaleUsesMetricSystem])?@"YES":@"NO");
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleDecimalSeparator]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleGroupingSeparator]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleCurrencySymbol]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleCurrencyCode]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleCollatorIdentifier]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleQuotationBeginDelimiterKey]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleQuotationEndDelimiterKey]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleAlternateQuotationBeginDelimiterKey]);
    NSLog(@"%s %@",__FUNCTION__,[jpLocale objectForKey:NSLocaleAlternateQuotationEndDelimiterKey]);
    
    
    //=>
}
#pragma mark NSLocale 
-(void)method004
{
    NSLog(@"%s %@",__FUNCTION__,[NSLocale availableLocaleIdentifiers]);
    NSLog(@"%s %@",__FUNCTION__,[NSLocale ISOCountryCodes]);
    NSLog(@"%s %@",__FUNCTION__,[NSLocale ISOLanguageCodes]);
    NSLog(@"%s %@",__FUNCTION__,[NSLocale commonISOCurrencyCodes]);
   
    switch ([NSLocale characterDirectionForLanguage:@"ja-JP"]) {
        case NSLocaleLanguageDirectionUnknown:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionUnknown");
            break;
        case NSLocaleLanguageDirectionLeftToRight:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionLeftToRight");
            break;
        case NSLocaleLanguageDirectionRightToLeft:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionRightToLeft");
            break;
        case NSLocaleLanguageDirectionTopToBottom:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionTopToBottom");
            break;
        case NSLocaleLanguageDirectionBottomToTop:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionBottomToTop");
            break;
            
        default:
            break;
    }
    switch ([NSLocale lineDirectionForLanguage:@"ja-JP"]) {
        case NSLocaleLanguageDirectionUnknown:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionUnknown");
            break;
        case NSLocaleLanguageDirectionLeftToRight:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionLeftToRight");
            break;
        case NSLocaleLanguageDirectionRightToLeft:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionRightToLeft");
            break;
        case NSLocaleLanguageDirectionTopToBottom:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionTopToBottom");
            break;
        case NSLocaleLanguageDirectionBottomToTop:
            NSLog(@"%s %@",__FUNCTION__,@"NSLocaleLanguageDirectionBottomToTop");
            break;
            
        default:
            break;
    }

    NSLog(@"%s %@",__FUNCTION__,[NSLocale preferredLanguages]);
    
    NSLog(@"%s canonicalLanguageIdentifierFromString %@",__FUNCTION__,[NSLocale canonicalLanguageIdentifierFromString:@"JA-JP"]);
    NSLog(@"%s %@",__FUNCTION__,[NSLocale canonicalLocaleIdentifierFromString:@"ja-JP"]);
    NSLog(@"%s componentsFromLocaleIdentifier %@",__FUNCTION__,[NSLocale componentsFromLocaleIdentifier:@"ja-JP"]);
    
    NSDictionary *idDic = [NSDictionary dictionaryWithObjectsAndKeys:@"JP",NSLocaleCountryCode,@"ja",NSLocaleLanguageCode, nil];
    NSLog(@"%s %@",__FUNCTION__,[NSLocale localeIdentifierFromComponents:idDic]);
    NSLog(@"%s canonicalLanguageIdentifierFromString %@",__FUNCTION__,[NSLocale canonicalLanguageIdentifierFromString:@"ja-jp"]);
    NSLog(@"%s %@",__FUNCTION__,[NSLocale localeIdentifierFromWindowsLocaleCode:17]);
    NSLog(@"%s %u",__FUNCTION__,[NSLocale windowsLocaleCodeFromLocaleIdentifier:@"ja-JP"]);
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    //[self method002];
    
    [self method003];
    [self method004];
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
