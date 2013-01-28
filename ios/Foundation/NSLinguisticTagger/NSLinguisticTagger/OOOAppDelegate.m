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
    //iOS 6.0 現在日本語は使えない
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
                          options:(NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation) 
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
    //=>
    
}

#pragma mark NSLinguisticTagger  initWithTagSchemes
-(void)method002
{
    NSString *aString = @"My name is OOMORI satoshi.";
    NSString *targetScheme = NSLinguisticTagSchemeLexicalClass;//品詞。英語のみ,Verb,Noun,SentenceTerminator
    
    
    NSArray *aScheme = [NSArray arrayWithObject:targetScheme];
    NSLinguisticTagger *aTagger = [[NSLinguisticTagger alloc] initWithTagSchemes:aScheme options:0];
    
    //ブロック内での結果を得るためにNSArrayを作っておく
    __block NSMutableArray *tagArray =  [NSMutableArray arrayWithCapacity:0];
    
    [aTagger setString:aString];
    [aTagger enumerateTagsInRange:NSMakeRange(0, [aString length])
                           scheme:targetScheme
                          options:(NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation)
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
    //=>
    
}

#pragma mark NSLinguisticTagger  initWithTagSchemes
-(void)method003
{
    NSString *aString = @"My name is OOMORI satoshi.";
    NSString *targetScheme = NSLinguisticTagSchemeTokenType;//品詞。英語のみ,Verb,Noun,SentenceTerminator

     
    NSArray *aScheme = [NSArray arrayWithObject:targetScheme];
    NSLinguisticTagger *aTagger = [[NSLinguisticTagger alloc] initWithTagSchemes:aScheme options:0];
    
    //ブロック内での結果を得るためにNSArrayを作っておく
    __block NSMutableArray *tagArray =  [NSMutableArray arrayWithCapacity:0];
    
    [aTagger setString:aString];
    [aTagger enumerateTagsInRange:NSMakeRange(0, [aString length])
                           scheme:targetScheme
                          options:(NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation)
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

    NSLog(@"%s %@", __FUNCTION__,[aTagger tagSchemes]);
    //=>LexicalClass
    NSLog(@"%s %@", __FUNCTION__,[NSLinguisticTagger availableTagSchemesForLanguage:@"en"]);
    //=>(TokenType,Language,Script,Lemma,LexicalClass,NameType,NameTypeOrLexicalClass)
    //enだと（TokenType,Language,Script,Lemma,LexicalClass,NameType,   NameTypeOrLexicalClass）
    //jaだと(TokenType,Language,Script)のみ iOS6.0現在
    //FRも(TokenType,Language,Script)のみiOS6.0現在
    NSLog(@"%s %@", __FUNCTION__,[aTagger string]);
}
#pragma mark NSLinguisticTagger  possibleTagsAtIndex:scheme:tokenRange:sentenceRange:scores:
-(void)method004
{
    NSMutableString *aString = [@"My name is OOMORI satoshi." mutableCopy];
    NSString *targetScheme = NSLinguisticTagSchemeNameTypeOrLexicalClass;
    
    
    NSArray *aScheme = [NSArray arrayWithObject:targetScheme];
    NSLinguisticTagger *aTagger = [[NSLinguisticTagger alloc] initWithTagSchemes:aScheme options:0];
    
    [aTagger setString:aString];
    
    NSInteger searchIndex = 0;
    while (searchIndex < [aString length]) {
     
    NSRange tokenRange;
    NSRange sentenceRange;
        NSArray *scoreArray;
    NSArray *anArray = [aTagger possibleTagsAtIndex:searchIndex
                          scheme:targetScheme
                      tokenRange:&tokenRange
                   sentenceRange:&sentenceRange
                          scores:&scoreArray];
        [aTagger stringEditedInRange:tokenRange changeInLength:0];
    for (NSString *tag in anArray) {
        NSLog(@"tag = %@",tag);
         
    }
    NSLog(@"(%u-%u)",tokenRange.location,tokenRange.length);
    NSLog(@"%@",[scoreArray description]);
        
        searchIndex +=tokenRange.length;
    }
    NSLog(@"%@",[aTagger string]);
}

#pragma mark NSLinguisticTagger  possibleTagsAtIndex:scheme:tokenRange:sentenceRange:scores:
-(void)method005
{
    NSMutableString *aString = [@"My name is OOMORI satoshi." mutableCopy];
    NSString *targetScheme = NSLinguisticTagSchemeNameTypeOrLexicalClass;
    
    
    NSArray *aScheme = [NSArray arrayWithObject:targetScheme];
    NSLinguisticTagger *aTagger = [[NSLinguisticTagger alloc] initWithTagSchemes:aScheme options:0];
    
    [aTagger setString:aString];
    
    NSInteger searchIndex = 0;
    while (searchIndex < [aString length]) {
        
        NSRange tokenRange;
        NSRange sentenceRange;
        NSArray *scoreArray;
        NSString *tag = [aTagger tagAtIndex:searchIndex
                                                 scheme:targetScheme
                                             tokenRange:&tokenRange
                                          sentenceRange:&sentenceRange
                                                 ];
        [aTagger stringEditedInRange:tokenRange changeInLength:0];
        
        NSLog(@"tag = %@",tag);
            
        
        NSLog(@"(%u-%u)",tokenRange.location,tokenRange.length);
        NSLog(@"%@",[scoreArray description]);
        
        searchIndex +=tokenRange.length;
    }
    NSLog(@"%@",[aTagger string]);
}
#pragma mark NSLinguisticTagger  possibleTagsAtIndex:scheme:tokenRange:sentenceRange:scores:
-(void)method006
{
    NSMutableString *aString = [@"My name is OOMORI satoshi." mutableCopy];
    NSString *targetScheme = NSLinguisticTagSchemeNameTypeOrLexicalClass;
    
    
    NSArray *aScheme = [NSArray arrayWithObject:targetScheme];
    NSLinguisticTagger *aTagger = [[NSLinguisticTagger alloc] initWithTagSchemes:aScheme options:0];
    
    [aTagger setString:aString];
    
        
        NSArray *tokenRange;
        NSArray *tagArray = [aTagger tagsInRange:NSMakeRange(0, 10)
                                     scheme:targetScheme
                                         options:0
                                 tokenRanges:&tokenRange
                         ];


        NSLog(@"tag = %@",[tagArray description]);
    NSRange sentenceRange = [aTagger sentenceRangeForRange:NSMakeRange(0, 3)];
    NSLog(@"sentenceRange = %d-%d",sentenceRange.location,sentenceRange.length);
    
}

#pragma mark NSLinguisticTagger
-(void)method007
{
    UTF32Char currentChar = 0x2060;
    NSString *astr = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
NSString *str = [NSString stringWithFormat:@"%@%@",@"My name is OOMORI satoshi.",astr ];

NSLinguisticTagger *tagger = [[NSLinguisticTagger alloc] initWithTagSchemes:[NSArray arrayWithObject:NSLinguisticTagSchemeLexicalClass] options:~NSLinguisticTaggerOmitWords];
[tagger setString:str];
[tagger enumerateTagsInRange:NSMakeRange(0, [str length])
                      scheme:NSLinguisticTagSchemeLexicalClass
                     options:0//~NSLinguisticTaggerOmitWords
                  usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
                      NSLog(@"found: %@ (%@)", [str substringWithRange:tokenRange], tag);
                  }];
}

#pragma mark NSLinguisticTagger
-(void)method008
{
    NSString *question = @"What is the weather in San Jose?";
    NSLinguisticTaggerOptions options = NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation | NSLinguisticTaggerJoinNames;
    NSLinguisticTagger *tagger = [[NSLinguisticTagger alloc] initWithTagSchemes: [NSLinguisticTagger availableTagSchemesForLanguage:@"en"] options:options];
    tagger.string = question;
    [tagger enumerateTagsInRange:NSMakeRange(0, [question length]) scheme:NSLinguisticTagSchemeNameTypeOrLexicalClass options:options usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
        NSString *token = [question substringWithRange:tokenRange];
        NSLog(@"found: %@ (%@)", token, tag);
    }];
    
    
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
    //[self method008];
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
