//
//  OOOAppDelegate.m
//  NSLinguisticTagger
//
//  Created by 大森 智史 on 12/05/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark enumerateTagsInRange:scheme:options:usingBlock:
-(void)method001
{
    NSString *aString = @"My name is OOMORI satoshi.";
    //iOS 5.1 現在実機では日本語は使えない
    //NSString *targetScheme = NSLinguisticTagSchemeTokenType;//種類Word,Whitespace,Punctuationなど
    NSString *targetScheme = NSLinguisticTagSchemeLexicalClass;//品詞。英語のみ,Verb,Noun,SentenceTerminator
    
    
    NSArray *aScheme = [NSArray arrayWithObject:targetScheme];
    /*NSArray *aScheme = [NSArray arrayWithObjects: 
                             NSLinguisticTagSchemeLexicalClass,
                             NSLinguisticTagSchemeNameType,
                             nil];
    */
     NSLinguisticTagger *aTagger = [[NSLinguisticTagger alloc] initWithTagSchemes:aScheme options:0];
    
    //ブロック内での結果を得るためにNSArrayを作っておく
    __block NSMutableArray *tagArray =  [NSMutableArray arrayWithCapacity:0];
    
    [aTagger setString:aString];
    [aTagger enumerateTagsInRange:NSMakeRange(0, [aString length]) 
                           scheme:targetScheme
                          options:0 
                       usingBlock: ^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
                           NSString *token = [aString substringWithRange:tokenRange];
                           NSString *sentence = [aString substringWithRange:sentenceRange];
                           //あとで使うためにNSDictionaryにいれて
                           NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                                        tag,@"tag",
                                                        token,@"token",
                                                        sentence,@"sentence",
                                                        nil];
                           //aDictionaryをNSArrayに入れる
                           [tagArray addObject:aDictionary];
                          
                       }
     ];
    
     
    NSLog(@"%s", __FUNCTION__);
    for (NSDictionary *tempDic in tagArray) {
        NSLog(@"tag = %@,token = %@,sentence = %@",[tempDic objectForKey:@"tag"],
                                                    [tempDic objectForKey:@"token"],
                                                    [tempDic objectForKey:@"sentence"]);
    }
    //=>[OOOAppDelegate method027] : (1,345,567,912,1233)
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
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
