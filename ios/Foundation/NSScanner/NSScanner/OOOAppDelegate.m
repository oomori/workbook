//
//  OOOAppDelegate.m
//  NSScanner
//
//  Created by 大森 智史 on 12/07/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;
#pragma mark NSScanner scannerWithString:
-(void)method001
{
    NSCharacterSet* chSet = [NSCharacterSet characterSetWithCharactersInString:@","];
    NSString* aString= @"56.0,67.1,76.8,54,89.0";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:[NSNumber numberWithFloat:[retStr floatValue]]];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
}

#pragma mark NSScanner scannerWithString:
-(void)method002
{
    NSString *aString= @"http://www.oomori.com/test.php?name=oomori&id=1234";
    NSString *retStr;
    NSScanner *aScanner = [NSScanner scannerWithString:aString];
    while(![aScanner isAtEnd]) {
        [aScanner scanUpToString:@"?" intoString:&retStr];
        
        NSString *str = @"name=";
        if([aScanner scanUpToString:str intoString:&retStr]) {
            [aScanner setScanLocation: [aScanner scanLocation]+[str length] ];
            [aScanner scanUpToString:@"&" intoString:&retStr ];
            NSLog(@"%s %@",__FUNCTION__,retStr);
        }
    }
}
//=>-[OOOAppDelegate method002] oomori
#pragma mark NSScanner :
-(void)method003
{
    NSString* HEXString = @"0x1A57FE3C";
    NSScanner* aScanner = [NSScanner scannerWithString: HEXString];
    
    unsigned int uiValue;
    [aScanner scanHexInt: &uiValue];
    NSLog(@"%s %u",__FUNCTION__,uiValue);
    
}

#pragma mark NSScanner scannerWithString:
-(void)method004
{
    NSString *aString= @"あいうえおかきくけこさしすせそ";
    NSString *retStr;
    NSScanner *aScanner = [NSScanner localizedScannerWithString:aString];
    while(![aScanner isAtEnd]) {
        [aScanner scanUpToString:@"き" intoString:&retStr];
        NSLog(@"%s %@",__FUNCTION__,retStr);
        [aScanner scanString:@"き" intoString:NULL];
        NSLog(@"%s %@",__FUNCTION__, retStr);
        
        NSLog(@"%s location = %d ",__FUNCTION__,[aScanner scanLocation]);
        
        
    }

    
}

#pragma mark NSScanner scannerWithString:
-(void)method005
{
    NSString *string = @"name: YAMADA Taro; weight: 59.98\n\
    name: TANAMA Jiro; weight: 62.75 \n\
    name: SUZUKI Saburo; weight: 80.27\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *aName = @"name:";
    NSString *aWeight = @"weight:";
    
    NSString *retName;
    float retValue;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    
    while (![theScanner isAtEnd]){
        if ([theScanner scanString:aName intoString:NULL] &&
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&retName] &&
            [theScanner scanString:@";" intoString:NULL] &&
            [theScanner scanString:aWeight intoString:NULL] &&
            [theScanner scanFloat:&retValue])
        {
             NSLog(@"%s %@,%.2f",__FUNCTION__, retName,retValue );
        }
    }
}

//フランス語
#pragma mark NSScanner localizedScannerWithString:
-(void)method006
{
    NSString *string = @"name: YAMADA Taro; weight: 59,98\n\
    name: TANAMA Jiro; weight: 62,75 \n\
    name: SUZUKI Saburo; weight: 80,27\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *aName = @"name:";
    NSString *aWeight = @"weight:";
    
    NSString *retName;
    float retValue;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    [theScanner setLocale:frLocale];
    
    while (![theScanner isAtEnd]){
        if ([theScanner scanString:aName intoString:NULL] &&
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&retName] &&
            [theScanner scanString:@";" intoString:NULL] &&
            [theScanner scanString:aWeight intoString:NULL] &&
            [theScanner scanFloat:&retValue])
        {
            NSLog(@"%s %@,%.2f",__FUNCTION__, retName,retValue );
        }
    }
}

#pragma mark NSScanner localizedScannerWithString:
//一般>言語環境>書式>フランス語>フランスで正常動作
-(void)method007
{
    NSString *string = @"name: YAMADA Taro; weight: 59,98\n\
    name: TANAMA Jiro; weight: 62,75 \n\
    name: SUZUKI Saburo; weight: 80,27\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *aName = @"name:";
    NSString *aWeight = @"weight:";
    
    NSString *retName;
    float retValue;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner localizedScannerWithString:string];
    //localizedScannerWithStringで作成しているので下記は不要
    //NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    //[theScanner setLocale:frLocale];

    while (![theScanner isAtEnd]){
        if ([theScanner scanString:aName intoString:NULL] &&
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&retName] &&
            [theScanner scanString:@";" intoString:NULL] &&
            [theScanner scanString:aWeight intoString:NULL] &&
            [theScanner scanFloat:&retValue])
        {
            NSLog(@"%s %@,%.2f",__FUNCTION__, retName,retValue );
        }
    }
    

}

#pragma mark NSScanner string
-(void)method008
{
    NSString *string = @"name: YAMADA Taro; weight: 59.98\n\
    name: TANAMA Jiro; weight: 62.75 \n\
    name: SUZUKI Saburo; weight: 80.27\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *aName = @"name:";
    NSString *aWeight = @"weight:";
    
    NSString *retName;
    float retValue;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    
    while (![theScanner isAtEnd]){
        if ([theScanner scanString:aName intoString:NULL] &&
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&retName] &&
            [theScanner scanString:@";" intoString:NULL] &&
            [theScanner scanString:aWeight intoString:NULL] &&
            [theScanner scanFloat:&retValue])
        {
            NSLog(@"%s %@",__FUNCTION__, [theScanner string] );
        }
    }
}

#pragma mark NSScanner setCaseSensitive:
-(void)method009
{
    NSString *string = @"name: YAMADA Taro; weight: 59.98\n\
    name: TANAMA Jiro; weight: 62.75 \n\
    name: SUZUKI Saburo; WEIGHT: 80.27\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *aName = @"name:";
    NSString *aWeight = @"weight:";
    
    NSString *retName;
    float retValue;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    [theScanner setCaseSensitive:YES];
    while (![theScanner isAtEnd]){
        if ([theScanner scanString:aName intoString:NULL] &&
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&retName] &&
            [theScanner scanString:@";" intoString:NULL] &&
            [theScanner scanString:aWeight intoString:NULL] &&
            [theScanner scanFloat:&retValue])
        {
            NSLog(@"%s %@,%.2f",__FUNCTION__, retName,retValue );
        }else {
            [theScanner setScanLocation:[[theScanner string] length]];
        }
    }
}

#pragma mark NSScanner scannerWithString:
-(void)method010
{
    NSString *str = @"Tokyo Tower is the height of 333m. Tokyo Sky Tree height is 634m.";
    NSScanner *scanner = [NSScanner scannerWithString:str];
    [scanner setCharactersToBeSkipped:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
    
    NSInteger intValue;
    while ([scanner scanInteger:&intValue])
    {
        NSLog(@"%s %i",__FUNCTION__, intValue );
    }
}

#pragma mark NSScanner setCaseSensitive:
-(void)method011
{
    NSString *string = @"name: YAMADA Taro; weight: 59.98\n\
    name: TANAMA Jiro; weight: 62.75 \n\
    name: SUZUKI Saburo; WEIGHT: 80.27\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *aName = @"name:";
    NSString *aWeight = @"weight:";
    
    NSString *retName;
    float retValue;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    while (![theScanner isAtEnd]){
        if ([theScanner scanString:aName intoString:NULL] &&
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&retName] &&
            [theScanner scanString:@";" intoString:NULL] &&
            [theScanner scanString:aWeight intoString:NULL] &&
            [theScanner scanFloat:&retValue])
        {
            NSLog(@"%s %@,%.2f",__FUNCTION__, retName,retValue );
        }else {
            [theScanner setScanLocation:[[theScanner string] length]];
        }
    }
}

#pragma mark NSScanner scanInt:
-(void)method012
{
    NSString *string = @"name: YAMADA Taro; weight: 59\n\
    name: TANAMA Jiro; weight: 62 \n\
    name: SUZUKI Saburo; WEIGHT: 80\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *aName = @"name:";
    NSString *aWeight = @"weight:";
    
    NSString *retName;
    int retValue;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    while (![theScanner isAtEnd]){
        if ([theScanner scanString:aName intoString:NULL] &&
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&retName] &&
            [theScanner scanString:@";" intoString:NULL] &&
            [theScanner scanString:aWeight intoString:NULL] &&
            [theScanner scanInt:&retValue])
        {
            NSLog(@"%s %@,%d",__FUNCTION__, retName,retValue );
        }else {
            [theScanner setScanLocation:[[theScanner string] length]];
        }
    }
}

#pragma mark NSScanner scanInt:
-(void)method013
{
    NSString *string = @"name: YAMADA Taro; weight: 59\n\
    name: TANAMA Jiro; weight: 62 \n\
    name: SUZUKI Saburo; WEIGHT: 80\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *aName = @"name:";
    NSString *aWeight = @"weight:";
    
    NSString *retName;
    NSInteger retValue;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    while (![theScanner isAtEnd]){
        if ([theScanner scanString:aName intoString:NULL] &&
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&retName] &&
            [theScanner scanString:@";" intoString:NULL] &&
            [theScanner scanString:aWeight intoString:NULL] &&
            [theScanner scanInteger:&retValue])
        {
            NSLog(@"%s %@,%d",__FUNCTION__, retName,retValue );
        }else {
            [theScanner setScanLocation:[[theScanner string] length]];
        }
    }
}

#pragma mark NSScanner scanInt:
-(void)method014
{
    NSString *string = @"name: YAMADA Taro; weight: 786543129\n\
    name: TANAMA Jiro; weight: 987654321 \n\
    name: SUZUKI Saburo; WEIGHT: 1234567890\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *aName = @"name:";
    NSString *aWeight = @"weight:";
    
    NSString *retName;
    long long retValue;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    while (![theScanner isAtEnd]){
        if ([theScanner scanString:aName intoString:NULL] &&
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&retName] &&
            [theScanner scanString:@";" intoString:NULL] &&
            [theScanner scanString:aWeight intoString:NULL] &&
            [theScanner scanLongLong:&retValue])
        {
            NSLog(@"%s %@,%lld",__FUNCTION__, retName,retValue );
        }else {
            [theScanner setScanLocation:[[theScanner string] length]];
        }
    }
}

#pragma mark NSScanner :
-(void)method015
{
    NSString* HEXString = @"0xC";
    NSScanner* aScanner = [NSScanner scannerWithString: HEXString];
    
    float aValue;
    [aScanner scanHexFloat: &aValue];
    NSLog(@"%s %f",__FUNCTION__,aValue);
    
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
