//
//  OOOAppDelegate.m
//  NSOrthography
//
//  Created by 大森 智史 on 2012/08/14.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

#pragma mark NSOrthography orthographyWithDominantScript:
-(void)method001
{
    
    NSString *textToAnalyse = @"That Japanese restaurant has a really authentic atmosphere.";
    
    //パースしたときの文字の要素の範囲
    NSRange stringRange = NSMakeRange(0, textToAnalyse.length);
    
    // 言語マップの辞書
    NSArray *language = [NSArray arrayWithObjects:@"en",@"de",@"fr",nil];
    NSDictionary* languageMap = [NSDictionary dictionaryWithObject:language forKey:@"Latn"];
    
    NSOrthography *orthography = [NSOrthography orthographyWithDominantScript:@"Latn" languageMap:languageMap];
    [textToAnalyse enumerateLinguisticTagsInRange:stringRange
                                           scheme:NSLinguisticTagSchemeLexicalClass
                                          options:(NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation)
                                      orthography:orthography
                                       usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
                                           NSLog(@"\"%@\" is a %@, tokenRange (%d,%d), sentenceRange (%d-%d)",[textToAnalyse substringWithRange:tokenRange] ,tag,tokenRange.location,tokenRange.length, sentenceRange.location, sentenceRange.length);
                                       }];
    
    //=>"That" is a Determiner, tokenRange (0,4), sentenceRange (0-59)
    //=>"Japanese" is a Adjective, tokenRange (5,8), sentenceRange (0-59)
    //=>"restaurant" is a Noun, tokenRange (14,10), sentenceRange (0-59)
    // ...
}

#pragma mark NSOrthography property
-(void)method002
{
    NSString *aString = @"This is iOS code. これは日本語です。";
    
    NSRange aRange = NSMakeRange (1, [aString length]-1);
    
    NSString *tagScheme = NSLinguisticTagSchemeNameType;
    
    NSLinguisticTaggerOptions opts = NSLinguisticTaggerOmitPunctuation;
    
    NSArray *supportedLanguage = [NSLinguisticTagger   availableTagSchemesForLanguage:@"en"];
    
    NSLinguisticTagger *t = [[NSLinguisticTagger alloc]  initWithTagSchemes:supportedLanguage options: NSLinguisticTaggerOmitPunctuation] ;
    
    [t setString:aString];
    
    
    [t enumerateTagsInRange: aRange
                     scheme: tagScheme
                    options:(NSLinguisticTaggerOptions)opts
                 usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange,  BOOL *stop)
     
     {
         
         NSLog(@"%@", tag);
         
         
     }];
    
    [t enumerateTagsInRange: aRange scheme: NSLinguisticTagSchemeNameTypeOrLexicalClass options:(NSLinguisticTaggerOptions) opts usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange,  BOOL *stop)
     
     {
         
         NSLog(@"%@", tag);
         
     }];
    NSRange effectiveRange;
    NSOrthography *orthography = [t orthographyAtIndex:aRange.location effectiveRange:&effectiveRange];
    NSLog(@"%u,%u,%@",effectiveRange.location,effectiveRange.length,orthography.allLanguages);
    NSLog(@"%u,%u,%@",effectiveRange.location,effectiveRange.length,orthography.allScripts);
    NSLog(@"%u,%u,%@",effectiveRange.location,effectiveRange.length,orthography.dominantLanguage);
    NSLog(@"%u,%u,%@",effectiveRange.location,effectiveRange.length,orthography.dominantScript);
    NSLog(@"%u,%u,%@",effectiveRange.location,effectiveRange.length,orthography.languageMap);
    
    NSLog(@"%s %@",__FUNCTION__,[orthography languagesForScript:@"Jpan"]);
    NSLog(@"%s %@",__FUNCTION__,[orthography dominantLanguageForScript:@"Jpan"]);

}

#pragma mark NSOrthography orthographyWithDominantScript:
-(void)method003
{
    
    NSString *textToAnalyse = @"皆さんお元気ですか。私は元気です。";
    
    //パースしたときの文字の要素の範囲
    NSRange stringRange = NSMakeRange(0, textToAnalyse.length);
    
    // 言語マップの辞書
    NSArray *language = [NSArray arrayWithObjects:@"ja",@"fr",nil];
    NSDictionary* languageMap = [NSDictionary dictionaryWithObject:language forKey:@"Jpan"];
    
    NSOrthography *orthography = [NSOrthography orthographyWithDominantScript:@"Jpan" languageMap:languageMap];
    [textToAnalyse enumerateLinguisticTagsInRange:stringRange
                                           scheme:NSLinguisticTagSchemeLexicalClass
                                          options:(NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation)
                                      orthography:orthography
                                       usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
                                           NSLog(@"\"%@\" is a %@, tokenRange (%d,%d), sentenceRange (%d-%d)",[textToAnalyse substringWithRange:tokenRange] ,tag,tokenRange.location,tokenRange.length, sentenceRange.location, sentenceRange.length);
                                       }];
    
    //=>"That" is a Determiner, tokenRange (0,4), sentenceRange (0-59)
    //=>"Japanese" is a Adjective, tokenRange (5,8), sentenceRange (0-59)
    //=>"restaurant" is a Noun, tokenRange (14,10), sentenceRange (0-59)
    // ...
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    [self method003];
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
