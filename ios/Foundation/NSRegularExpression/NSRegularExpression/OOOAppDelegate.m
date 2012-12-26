//
//  OOOAppDelegate.m
//  NSRegularExpression
//
//  Created by 大森 智史 on 12/05/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark -enumerateMatchesInString:options:range:usingBlock:
-(void)method001
{
    NSError *aError = nil;
	NSString *str = @"http://www.oomori.com?name=oomori&age=44";
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"([\\w]+)=([\\w]+)" 
                                                                            options:NSRegularExpressionCaseInsensitive
                                                                              error:&aError];
     __block NSMutableDictionary *muDic =  [NSMutableDictionary dictionaryWithCapacity:0];
    [regExp enumerateMatchesInString:str 
                             options:NSMatchingReportProgress 
                               range:NSMakeRange(0,[str length]) 
                          usingBlock:
     ^(NSTextCheckingResult *result ,NSMatchingFlags flags,BOOL *stop )
     {
         if (!(flags & NSMatchingProgress)) {
             NSString *aKey = [str substringWithRange:[result rangeAtIndex:1]];
             NSString *aValue = [str substringWithRange:[result rangeAtIndex:2]];
             [muDic setObject:aValue forKey:aKey];
         }
     }
     
     ];
    NSLog(@"%s%@",__FUNCTION__,[muDic description]);
    //=>-[OOOAppDelegate method001]{age = 44;name = oomori;}
    NSLog(@"%s%@",__FUNCTION__,regExp.pattern);

    
    switch (regExp.options) {
        case NSRegularExpressionCaseInsensitive: //大文字小文字無視
            NSLog(@"%s %@",__FUNCTION__,@"NSRegularExpressionCaseInsensitive");
            break;
        case NSRegularExpressionAllowCommentsAndWhitespace: //コメントと空白無視
            NSLog(@"%s %@",__FUNCTION__,@"NSRegularExpressionAllowCommentsAndWhitespace");
            break;
        case NSRegularExpressionIgnoreMetacharacters: //文字列リテラルとしてパターン全体を扱う
            NSLog(@"%s %@",__FUNCTION__,@"NSRegularExpressionIgnoreMetacharacters");
            break;
        case NSRegularExpressionDotMatchesLineSeparators: //改行記号を含むことができる
            NSLog(@"%s %@",__FUNCTION__,@"NSRegularExpressionDotMatchesLineSeparators");
            break;
        case NSRegularExpressionAnchorsMatchLines: //行の最初、最後
            NSLog(@"%s %@",__FUNCTION__,@"NSRegularExpressionAnchorsMatchLines");
            break;
        case NSRegularExpressionUseUnixLineSeparators: //UNIX行分割
            NSLog(@"%s %@",__FUNCTION__,@"NSRegularExpressionUseUnixLineSeparators");
            break;
        case NSRegularExpressionUseUnicodeWordBoundaries: //unicode 語区切り
            NSLog(@"%s %@",__FUNCTION__,@"NSRegularExpressionUseUnicodeWordBoundaries");
            break;
            
        default:
            break;
    }
    NSLog(@"%s%u",__FUNCTION__,regExp.numberOfCaptureGroups);
}
#pragma mark NSRegularExpression  regularExpressionWithPattern:
-(void)method002
{

	NSString *str = @"abcdefg555hijklmn8972opqrstu";
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"\\d+" options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger result = [regExp numberOfMatchesInString:str
                                    options:0
                                      range:NSMakeRange(0, [str length])];

    
    NSLog(@"%s %u",__FUNCTION__,result);
    //=>-[OOOAppDelegate method002] 2
    
}

#pragma mark NSRegularExpression  regularExpressionWithPattern:
-(void)method003
{
    
	NSString *str = @"abcdefg555hijklmn8972opqrstu";
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"\\d+" options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *resultArray = [regExp matchesInString:str
                                                options:0
                                                  range:NSMakeRange(0, [str length])];
    
    [resultArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列
                              usingBlock:^(id obj,NSUInteger idx,BOOL *stop){
                                  NSTextCheckingResult *tcResult = (NSTextCheckingResult *)obj;
                                  NSLog(@"%s %@ %u-%u",__FUNCTION__,tcResult.regularExpression,tcResult.range.location,tcResult.range.length );
                                  return;
                                  
                              }];
    //=><NSRegularExpression: 0x6d4e7c0> \d+ 0x1 7-3
    //=><NSRegularExpression: 0x6d4e7c0> \d+ 0x1 17-4
    
}

#pragma mark NSRegularExpression  firstMatchInString:
-(void)method004
{
    
	NSString *str = @"abcdefg555hijklmn8972opqrstu";
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"\\d+" options:NSRegularExpressionCaseInsensitive error:nil];
    NSTextCheckingResult *resultTCResult = [regExp firstMatchInString:str
                                           options:0
                                             range:NSMakeRange(0, [str length])];
    

    NSLog(@"%s %@ %u-%u",__FUNCTION__,resultTCResult.regularExpression,resultTCResult.range.location,resultTCResult.range.length );
                                      
    //=><NSRegularExpression: 0x6836600> \d+ 0x1 7-3

    
}

#pragma mark NSRegularExpression  firstMatchInString:
-(void)method005
{
    
	NSString *str = @"1 12 123 1234 12345 123456";
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"\\d+" options:NSRegularExpressionCaseInsensitive error:nil];
    NSRange resultRange = [regExp rangeOfFirstMatchInString:str
                                                              options:0
                                                                range:NSMakeRange(0, [str length])];
    
    
    NSLog(@"%s %u-%u",__FUNCTION__,resultRange.location,resultRange.length );
    
    //=>
    
    
}
#pragma mark NSRegularExpression  firstMatchInString:
-(void)method006
{
    
	NSMutableString *str = [@"1 12 123 1234 12345 123456" mutableCopy];
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"\\b\\d{2,5}\\b" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *template =
    @"*$0*";
    
    NSUInteger result =  [regExp replaceMatchesInString:str
                                        options:0
                                          range:NSMakeRange(0, [str length])
                                            withTemplate:template
                           ];
    
    
    NSLog(@"%s %u",__FUNCTION__,result  );
    //=>4
    NSLog(@"%s %@",__FUNCTION__,str  );
    //=>1 *12* *123* *1234* *12345* 123456
}

#pragma mark NSRegularExpression  stringByReplacingMatchesInString:
-(void)method007
{
    
	NSString *str = @"1 12 123 1234 12345 123456" ;
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"\\b\\d{2,5}\\b" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *template =
    @"*$0*";
    
    NSString *resultSring =  [regExp stringByReplacingMatchesInString:str
                                                options:0
                                                  range:NSMakeRange(0, [str length])
                                           withTemplate:template
                          ];
    
    NSLog(@"%s %@",__FUNCTION__,resultSring  );
    //=>1 *12* *123* *1234* *12345* 123456
    
}

#pragma mark NSRegularExpression  escapedPatternForString:,escapedPatternForString:
-(void)method008
{
    
    NSString * patternstring = [NSRegularExpression escapedPatternForString:@"a*m"];
    NSLog(@"%s %@",__FUNCTION__,patternstring  );

    NSString * templatestring = [NSRegularExpression escapedPatternForString:@"a$m"];
    NSLog(@"%s %@",__FUNCTION__,templatestring  );


    
}

#pragma mark NSRegularExpression  stringByReplacingMatchesInString:
-(void)method009
{
    
	NSError* error = nil;
    NSRegularExpression* regularExpression = [NSRegularExpression
                                  regularExpressionWithPattern:@"\\b[1-3]\\b"
                                  options:NSRegularExpressionCaseInsensitive
                                  error:&error];

    NSString* aString = @"1  2  3";
    
    NSMutableString* mutableString = [aString mutableCopy];
    NSInteger offset = 0;
    
    for (NSTextCheckingResult* result in [regularExpression matchesInString:aString
                                                        options:0
                                                          range:NSMakeRange(0, [aString length])]) {
        
        NSRange resultRange = [result range];
        resultRange.location += offset; 
        NSString* match = [regularExpression replacementStringForResult:result
                                                   inString:mutableString
                                                     offset:offset
                                                   template:@"$0"];
        NSString* replacement;
        if ([match isEqualToString:@"1"]) {
            replacement = @"Jan";
        } else if ([match isEqualToString:@"2"]) {
            replacement = @"Feb";
        } else if ([match isEqualToString:@"3"]) {
            replacement = @"Mar";
        }
        
        [mutableString replaceCharactersInRange:resultRange withString:replacement];
        
        offset += ([replacement length] - resultRange.length);
    }
    
    NSLog(@"%s %@",__FUNCTION__,mutableString  );
    //=>
    
}

#pragma mark NSRegularExpression  stringByReplacingMatchesInString:
-(void)method010
{
    
	NSString *str = @"yen bin yin yes" ;
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"\\by(e|i)(s|n)\\b" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *template =
    @"*$0*";
    
    NSString *resultSring =  [regExp stringByReplacingMatchesInString:str
                                                              options:0
                                                                range:NSMakeRange(0, [str length])
                                                         withTemplate:template
                              ];
    
    NSLog(@"%s %@",__FUNCTION__,resultSring  );
    //=>*yen* bin *yin* *yes*
    
}

#pragma mark NSRegularExpression  stringByReplacingMatchesInString:
-(void)method011
{
    
	NSString *str = @"こんにちは ken key こんにちは hen\nこんにちは ken" ;
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"^こんにちは\\b" options:(NSRegularExpressionCaseInsensitive | NSRegularExpressionAnchorsMatchLines) error:nil];
    NSString *template =
    @"*$0*";
    
    NSString *resultSring =  [regExp stringByReplacingMatchesInString:str
                                                              options:0
                                                                range:NSMakeRange(0, [str length])
                                                         withTemplate:template
                              ];
    
    NSLog(@"%s %@",__FUNCTION__,resultSring  );
    //=>-[OOOAppDelegate method011] *こんにちは* ken key こんにちは hen *こんにちは* ken
    
    NSRegularExpression *regExp2 = [NSRegularExpression regularExpressionWithPattern:@"^こんにちは\\b" options:(NSRegularExpressionCaseInsensitive ) error:nil];

    
    NSString *resultSring2 =  [regExp2 stringByReplacingMatchesInString:str
                                                              options:0
                                                                range:NSMakeRange(0, [str length])
                                                         withTemplate:template
                              ];
    
    NSLog(@"%s %@",__FUNCTION__,resultSring2  );
    //=>-[OOOAppDelegate method011] *こんにちは* ken key こんにちは hen こんにちは ken
    
}
#pragma mark -enumerateMatchesInString:options:range:usingBlock:
-(void)method012
{
    NSError *aError = nil;
	NSString *str = @"http://www.oomori.com?name=oomori&age=44";
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"([\\w]+)=([\\w]+)"
                                                                            options:NSRegularExpressionCaseInsensitive
                                                                              error:&aError];
    __block NSMutableDictionary *muDic =  [NSMutableDictionary dictionaryWithCapacity:0];
    [regExp enumerateMatchesInString:str
                             options:NSMatchingReportProgress
                               range:NSMakeRange(0,[str length])
                          usingBlock:
     ^(NSTextCheckingResult *result ,NSMatchingFlags flags,BOOL *stop )
     {
         if (!(flags & NSMatchingProgress)) {
             NSString *aKey = [str substringWithRange:[result rangeAtIndex:1]];
             NSString *aValue = [str substringWithRange:[result rangeAtIndex:2]];
             [muDic setObject:aValue forKey:aKey];
             NSLog(@"%s %@,%@",__FUNCTION__,@"NSMatchingProgress",aKey);
         
             if (!(flags & NSMatchingCompleted)) {
                 NSLog(@"%s %@%@",__FUNCTION__,@"NSMatchingCompleted",aKey);
             }
             if (!(flags & NSMatchingHitEnd)) {
                 NSLog(@"%s %@%@",__FUNCTION__,@"NSMatchingHitEnd",aKey);
             }
             if (!(flags & NSMatchingRequiredEnd)) {
                 NSLog(@"%s %@%@",__FUNCTION__,@"NSMatchingRequiredEnd",aKey);
             }
             if (!(flags & NSMatchingInternalError)) {
                 NSLog(@"%s %@%@",__FUNCTION__,@"NSMatchingInternalError",aKey);
             }
            }
     }
     
     ];
    NSLog(@"%s%@",__FUNCTION__,[muDic description]);
    //=>-[OOOAppDelegate method001]{age = 44;name = oomori;}
}

#pragma mark 定数NSMatchingAnchored
-(void)method013
{
    NSString *str = @"こんにちは ken key こんにちは hen\nこんにちは ken" ;
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"^こんにちは\\b" options:(NSRegularExpressionCaseInsensitive | NSRegularExpressionAnchorsMatchLines) error:nil];
    NSString *template =
    @"*$0*";
    
    NSString *resultSring =  [regExp stringByReplacingMatchesInString:str
                                                              options:0
                                                                range:NSMakeRange(0, [str length])
                                                         withTemplate:template
                              ];
    
    NSLog(@"%s %@",__FUNCTION__,resultSring  );
    //=>-[OOOAppDelegate method013] *こんにちは* ken key こんにちは hen*こんにちは* ken
    
    NSRegularExpression *regExp2 = [NSRegularExpression regularExpressionWithPattern:@"^こんにちは\\b" options:(NSRegularExpressionCaseInsensitive | NSRegularExpressionAnchorsMatchLines) error:nil];
    
    
    NSString *resultSring2 =  [regExp2 stringByReplacingMatchesInString:str
                                                                options:NSMatchingAnchored
                                                                  range:NSMakeRange(0, [str length])
                                                           withTemplate:template
                               ];
    
    NSLog(@"%s %@",__FUNCTION__,resultSring2  );
    //=>-[OOOAppDelegate method013] *こんにちは* ken key こんにちは henこんにちは ken
}
#pragma mark 定数NSMatchingWithoutAnchoringBounds
-(void)method014
{
    NSString *str = @"こんにちは ken key こんにちは hen\nこんにちは\n ken こんにちは\n   " ;
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"^こんにちは\\b" options:(NSRegularExpressionCaseInsensitive | NSRegularExpressionAnchorsMatchLines) error:nil];
    NSString *template =
    @"*$0*";
    
    NSString *resultSring =  [regExp stringByReplacingMatchesInString:str
                                                              options:0
                                                                range:NSMakeRange(0, [str length]-2)
                                                         withTemplate:template
                              ];
    
    NSLog(@"%s %@",__FUNCTION__,resultSring  );
    //=>*こんにちは* ken key こんにちは hen*こんにちは* ken
    
    NSRegularExpression *regExp2 = [NSRegularExpression regularExpressionWithPattern:@"^こんにちは\\b" options:(NSRegularExpressionCaseInsensitive | NSRegularExpressionAnchorsMatchLines) error:nil];
    
    
    NSString *resultSring2 =  [regExp2 stringByReplacingMatchesInString:str
                                                                options:NSMatchingWithTransparentBounds
                                                                  range:NSMakeRange(0, [str length]-2)
                                                           withTemplate:template
                               ];
    
    NSLog(@"%s %@",__FUNCTION__,resultSring2  );
    //=>*こんにちは* ken key こんにちは henこんにちは ken
}

#pragma mark 定数NSMatchingWithoutAnchoringBounds
-(void)method015
{
    NSString *str = @"これはURLのサンプルです。http://www.oomori.comです。" ;
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"http://" options:(NSRegularExpressionCaseInsensitive | NSRegularExpressionAnchorsMatchLines) error:nil];
    NSString *template =
    @"---";
    
    NSString *resultSring =  [regExp stringByReplacingMatchesInString:str
                                                              options:NSMatchingWithTransparentBounds
                                                                range:NSMakeRange(0, [str length]-1)
                                                         withTemplate:template
                              ];
    
    NSLog(@"%s %@",__FUNCTION__,resultSring  );
    //=>-[OOOAppDelegate method013] *こんにちは* ken key こんにちは hen*こんにちは* ken
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
