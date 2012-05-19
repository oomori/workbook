//
//  OOOAppDelegate.m
//  ModernMethods
//
//  Created by 大森 智史 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

#import "CustomClass.h"

@implementation OOOAppDelegate
@synthesize window = _window;

#pragma mark NSArray indexOfObjectPassingTest:
-(void)method001
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"aaa",@"bbb",@"ccc",
     @"aaa",@"bbb",@"ccc",
     @"aaa",@"bbb",@"ccc",nil];
    
    
    NSUInteger idx = [anArray indexOfObjectPassingTest:
                      ^ BOOL (id obj, NSUInteger idx, BOOL *stop)
                      {
                          if (idx > 6) {
                              *stop = YES;
                          }
                          
                          if ([obj isEqualToString:@"bbb"]) {
                              return YES;    
                          }else {
                              return NO;
                          }
                          
                      }];
    
    if (idx == NSNotFound) {
        NSLog(@"Not Found");
    }else {
        NSLog(@"%s index = %u",__FUNCTION__, idx);
    }
    //=>-[OOOAppDelegate method001] index = 1
}

#pragma mark NSArray enumerateObjectsUsingBlock:
-(void)method002
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"aaa",@"bbb",@"ccc",
     @"ddd",@"eee",@"fff",
     @"ggg",@"hhh",@"iii",nil];
    
    [anArray enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"002==>%@", [obj description]);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;   
        }
    }];
    //002==>aaa
    //002==>bbb
    //002==>ccc
    //002==>ddd
    //002==>eee
    //002==>fff
    //002==>ggg
    
}

#pragma mark NSArray sortedArrayUsingComparator:
-(void)method003
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"ccc",@"aaa",@"bbb",nil];    
    NSArray *sortedArray =[anArray sortedArrayUsingComparator:^(id obj1, id obj2) {
        return (NSComparisonResult)[obj1 compare:obj2];
    }
                           ];
    
    NSLog(@"%s : %@", __FUNCTION__,[sortedArray description]);
    //=>[OOOAppDelegate method026] : (aaa,bbb,ccc)
    
}
#pragma mark NSArray  sortedArrayWithOptions:usingComparator:
-(void)method004
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"bbb",@"ggg",@"jjj",
     @"eee",@"fff",@"iii",
     @"ddd",@"hhh",@"aaa",nil];
    
    NSLog(@"%s %@",__FUNCTION__,[anArray description]);
    
    NSArray *sortedArray = [anArray sortedArrayWithOptions:NSSortConcurrent//NSSortStable
                                           usingComparator:^(id obj1,id obj2){
                                               return [obj1 compare:obj2];
                                           }];
    //NSSortStableは元のソートが保持される
    //NSSortConcurrentは元のソートが保持されない代わりに高速
    NSLog(@"%s %@",__FUNCTION__, [sortedArray description]);
    //-[OOOAppDelegate method004] (aaa,bbb,ddd,eee,fff,ggg,hhh,iii,jjj)
    
}
#pragma mark NSArray indexOfObject:inSortedRange:options:usingComparator:
-(void)method005
{
    // テストデータの範囲
    NSUInteger amount = 900000;
    // 探すデータ
    NSNumber* number = [NSNumber numberWithInt:724242];
    
    // ダミー配列作る
    NSMutableArray* anArray = [NSMutableArray arrayWithCapacity:amount];
    for (NSUInteger i = 0; i < amount; ++i) {;
        [anArray addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
    
    //
    NSUInteger index1 = [anArray indexOfObject:number 
                                 inSortedRange:NSMakeRange(0, [anArray count]) 
                                       options:NSBinarySearchingFirstEqual 
                               usingComparator:^(id obj1,id obj2) {
                                   NSInteger iVal1 = [obj1 integerValue];
                                   NSInteger iVal2 = [obj2 integerValue];
                                   if (iVal1 < iVal2)
                                       return NSOrderedAscending;
                                   else if (iVal1 > iVal2)
                                       return NSOrderedDescending;
                                   else
                                       return NSOrderedSame;
                               }];
    NSLog(@"%s %d",__FUNCTION__ ,index1);
    //=>-[OOOAppDelegate method005] 724242
    
}
#pragma mark NSFileCoordinator coordinateReadingItemAtURL:
-(void)method006
{
    NSURL *url = [[NSBundle mainBundle] resourceURL];
    
    NSArray *anArray = [NSArray arrayWithContentsOfURL:url];
    NSLog(@"010 = %@",[anArray description]);
    
    NSFileCoordinator *coordinator = [[NSFileCoordinator alloc] init ];
    __block NSError *error = nil;
    __block NSArray  *fileURLs = nil;
    
    [coordinator coordinateReadingItemAtURL:url 
                                    options:0 
                                      error:&error
                                 byAccessor:^(NSURL *newURL){
                                     
                                     NSFileManager *fileManager = [[NSFileManager alloc] init];
                                     NSError *error = nil;
                                     fileURLs = [fileManager contentsOfDirectoryAtURL:url includingPropertiesForKeys:[NSArray arrayWithObject:NSURLIsDirectoryKey] options:0 error:&error];
                                     
                                     if (!fileURLs) {
                                         NSLog(@"Failed to scan documents.");
                                         //return;
                                     }
                                     
                                 }];
    
    
    NSLog(@"%s : %@", __FUNCTION__,[fileURLs description]);
    //=>
    
}

#pragma mark NSArray enumerateObjectsWithOptions:
-(void) testSelector007:(NSString *)string
{
    NSLog(@"...call %s %@",__FUNCTION__,string);
    
}
-(void)method007
{
    SEL aSelector  = @selector( testSelector007: );//セレクタをセット
    NSMethodSignature *aSignature = [ self methodSignatureForSelector:aSelector ];//セレクタのシグネチャをセット
	
    NSInvocation *aInvocation = [ NSInvocation invocationWithMethodSignature:aSignature ];//起動オブジェクトをセット
	
	//起動オブジェクトにターゲットと引数をセットする
    [ aInvocation setTarget: self ];//ターゲットはself
    [ aInvocation setSelector: aSelector ];//セレクタをセット
    
    
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"aaa",@"bbb",@"ccc",
     @"ddd",@"eee",@"fff",
     @"ggg",@"hhh",@"iii",nil];
    
    [anArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列 
     //NSEnumerationReverse  //逆向き
                              usingBlock:^(id s,NSUInteger idx,BOOL *stop){
                                  
                                  //起動
                                  //配列の要素を引数としてメソッドを起動する
                                  [ aInvocation setArgument:&s atIndex:2];
                                  //-(void) testSelector002:(NSString *)stringの引数
                                  //0 self  通常隠されている
                                  //1 _cmd  通常隠されている
                                  //2 (NSString *)string
                                  [ aInvocation invoke ];//起動する
                                  
                                  
                              }]; 
    //=>...call -[OOOAppDelegate testSelector002:] aaa
    //=>...call -[OOOAppDelegate testSelector002:] bbb
    //=>...call -[OOOAppDelegate testSelector002:] ccc
    //=>...call -[OOOAppDelegate testSelector002:] ddd
    //=>...call -[OOOAppDelegate testSelector002:] eee
    //=>...call -[OOOAppDelegate testSelector002:] fff
    //=>...call -[OOOAppDelegate testSelector002:] ggg
    //=>...call -[OOOAppDelegate testSelector002:] hhh
    //=>...call -[OOOAppDelegate testSelector002:] iii
    
}
#pragma mark NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:
-(void)method008
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
    
    
}

#pragma mark NSRegularExpression enumerateMatchesInString:options:range:usingBlock:
-(void)method009
{
    NSError *aError = nil;
	NSString *str = [NSString stringWithString:@"http://www.oomori.com?name=oomori&age=44" ];
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
}

#pragma mark NSMutableSet enumerateObjectsUsingBlock:
/*
 CustomClass.m
 -(NSMutableString *)appendSomeString
 {
 [customClassValue appendString:@"!"];
 return customClassValue;
 
 }
 */
-(void)method010
{
    CustomClass *customClass1 = [[CustomClass alloc] init];
    NSMutableString *muStr1 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr1 appendString:@"aaa"];
    [customClass1 setCustomClassValue:muStr1];
    CustomClass *customClass2 = [[CustomClass alloc] init];
    NSMutableString *muStr2 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr2 appendString:@"bbb"];
    [customClass2 setCustomClassValue:muStr2];
    CustomClass *customClass3 = [[CustomClass alloc] init];
    NSMutableString *muStr3 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr3 appendString:@"ccc"];
    [customClass3 setCustomClassValue:muStr3];
    
    NSMutableSet *muSet = [NSMutableSet setWithObjects:customClass1,
                           customClass2,
                           customClass3,
                           nil];
    
    NSLog(@"%s %@",__FUNCTION__, [muSet description]);
    [muSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        //appendSomeStringは末尾に ! を付けるだけのメソッド
        [obj appendSomeString];
        //if ([obj isEqualToString:@"bbb"]) {
        //*stop = YES;   
        //}
    }];
    
    NSLog(@"%s %@",__FUNCTION__, [muSet description]);
    //=>-[OOOAppDelegate method001] {(bbb,ccc,aaa)}
    //=>-[OOOAppDelegate method001] {(bbb!,ccc!,aaa!)}
    
}

#pragma mark NSArray  sortedArrayUsingDescriptors:
//NSDictionaryをソートする
-(void)method011
{
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    
    NSMutableDictionary *dic1 = 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa4",@"key1",@"bbb1",@"key2",@"ccc1",@"key3",nil];
    NSMutableDictionary *dic2 = 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa2",@"key1",@"bbb2",@"key2",@"ccc2",@"key3",nil];
    NSMutableDictionary *dic3 = 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa1",@"key1",@"bbb3",@"key2",@"ccc3",@"key3",nil];
    NSMutableDictionary *dic4 = 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa3",@"key1",@"bbb4",@"key2",@"ccc4",@"key3",nil];
    
    [arr addObject: dic1 ];
    [arr addObject: dic2 ];
    [arr addObject: dic3 ];
    [arr addObject: dic4 ];
    
    NSSortDescriptor *descriptor=[[NSSortDescriptor alloc] initWithKey:@"key1" 
                                                             ascending:YES];
    
    NSArray *sortedArray = [arr sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]] ;
    
    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,[[arr objectAtIndex:0] objectForKey:@"key1"],
          [[arr objectAtIndex:1] objectForKey:@"key1"],
          [[arr objectAtIndex:2] objectForKey:@"key1"],
          [[arr objectAtIndex:3] objectForKey:@"key1"]);
    //=>-[OOOAppDelegate method001] aaa4,aaa2,aaa1,aaa3
    
    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,[[sortedArray objectAtIndex:0] objectForKey:@"key1"],
          [[sortedArray objectAtIndex:1] objectForKey:@"key1"],
          [[sortedArray objectAtIndex:2] objectForKey:@"key1"],
          [[sortedArray objectAtIndex:3] objectForKey:@"key1"]);
    
    //=>-[OOOAppDelegate method001] aaa1,aaa2,aaa3,aaa4
    
}

#pragma mark NSBlockOperation addOperation:
-(void)method012
{
    NSMutableString *muStr = [NSMutableString stringWithCapacity:0];
    [muStr appendString:@"string"];
    
    //一つ目の処理
    NSBlockOperation* operation = [NSBlockOperation blockOperationWithBlock: ^{
        for (NSInteger i=0; i < 10; i++) {
            [muStr performSelectorInBackground:@selector(appendString:)
                                    withObject:@"+"];
            NSLog(@"muStr %@ ", muStr);
            [NSThread sleepForTimeInterval:1.0];
        }
    }];
    
    //2つめの処理を追加
    [operation addExecutionBlock:^{
        NSLog(@"NSThread: %p", [NSThread currentThread]);
        for (NSInteger i=0; i < 5; i++) {
            NSLog(@"muStr %d", i);
            [NSThread sleepForTimeInterval:1.5];
        }
    }];
    
    // 終了時処理
    [operation setCompletionBlock:^{
        NSLog(@"end");
    }];
    
    //実行
    [operation start];
    
    
    
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // [self method001];
    // [self method002];
    // [self method003];
    // [self method004];
    // [self method005];
    // [self method006];
    // [self method007];
    
    // [self method008];
    
    // [self method009];
    // [self method010];
    
    // [self method011];
    // [self method012];
    
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
