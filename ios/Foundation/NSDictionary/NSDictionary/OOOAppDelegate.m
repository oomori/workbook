//
//  OOOAppDelegate.m
//  NSDictionary
//
//  Created by 大森 智史 on 12/05/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"
#import <mach/mach_time.h>

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSDictionary dictionary
-(void)method001
{
    NSDictionary *aDictionary = [NSDictionary dictionary];
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary description]);
    
    NSDictionary *bDictionary = [[NSDictionary alloc] init];
    NSLog(@"%s %p %@",__FUNCTION__,bDictionary,[bDictionary description]);
    
    NSDictionary *cDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    NSLog(@"%s %p %@",__FUNCTION__,cDictionary,[cDictionary description]);
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary description]);
    NSLog(@"%s %p %@",__FUNCTION__,cDictionary,[cDictionary description]);
}

#pragma mark NSDictionary dictionaryWithContentsOfFile:
-(void)method002
{
    //書き込み用のNSDictionaryを作成
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    
    //メインバンドル内のResourceにplistfile2.plistファイルを作成
    NSFileManager *myFile = [ NSFileManager defaultManager];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSDate date],NSFileModificationDate,
                         @"owner",@"NSFileOwnerAccountName",
                         @"group",@"NSFileGroupOwnerAccountName",
                         nil,@"NSFilePosixPermissions",
                         [NSNumber numberWithBool:YES],@"NSFileExtensionHidden",
                         nil];
    
    NSMutableData *dat1 = [[NSMutableData alloc] initWithCapacity:1];
    
    [myFile changeCurrentDirectoryPath:[[[NSBundle mainBundle] resourcePath] stringByExpandingTildeInPath]];
    [myFile createFileAtPath:@"plistfile2.plist" contents:dat1 attributes:dic];
    NSLog(@"myFile path = %@",[myFile currentDirectoryPath]);
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile2" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    //書き込み
    [aDictionary writeToURL:url atomically:YES];
    
    //ファイルから読み込んで、NSDictionaryを作成
    NSDictionary *readDictionary = [NSDictionary dictionaryWithContentsOfFile:resourcePath];
    NSLog(@"%s %p = %@",__FUNCTION__,readDictionary,[readDictionary description]);
    
    //=>-[OOOAppDelegate method002] 0x6d653d0 = {key1 = aaa;key2 = bbb;key3 = ccc;}
}

#pragma mark NSDictionary dictionaryWithDictionary:
-(void)method003
{
    //元となるのNSDictionaryを作成
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary description]);
    
    //NSDictionaryを作成
    NSDictionary *newDictionary = [NSDictionary dictionaryWithDictionary:aDictionary];
    NSLog(@"%s newDictionary %p = %@",__FUNCTION__,newDictionary,[newDictionary description]);
    
    //=>-[OOOAppDelegate method003] aDictionary 0x6d3b450 = {key1 = aaa;key2 = bbb;key3 = ccc;}
    //=>-[OOOAppDelegate method003] newDictionary 0x6d3b480 = {key1 = aaa;key2 = bbb;key3 = ccc;}
    //0x6d3b450とか0x6d3b480の部分は毎回変わります。

}

#pragma mark NSDictionary TOOL FREE BRIDGE:
-(void)method004
{
    //元となるのNSDictionaryを作成
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary description]);
    
    CFDictionaryRef dict = (__bridge_retained  CFDictionaryRef)aDictionary;
    CFShow(dict);
    //=><CFBasicHash 0x6c161d0 [0x145eb48]>{type = immutable dict, count = 3,
    //entries =>
	//0 : <CFString 0x4620 [0x145eb48]>{contents = "key2"} = <CFString 0x4610 [0x145eb48]>{contents = "bbb"}
	//1 : <CFString 0x4600 [0x145eb48]>{contents = "key1"} = <CFString 0x45f0 [0x145eb48]>{contents = "aaa"}
	//2 : <CFString 0x4640 [0x145eb48]>{contents = "key3"} = <CFString 0x4630 [0x145eb48]>{contents = "ccc"}
    //}
    
    NSDictionary *newDictionary = (__bridge NSDictionary*)dict;
    
    NSLog(@"%s newDictionary %p = %@",__FUNCTION__,newDictionary,[newDictionary description]);
    //=>-[OOOAppDelegate method004] newDictionary 0x6c161d0 = {key1 = aaa;key2 = bbb;key3 = ccc;}
    //ポインタの部分は毎回変わります。
    
}

#pragma mark NSDictionary NSNull:
-(void)method005
{
    //元となるのNSDictionaryを作成
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSNull null],@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary description]);
    CFDictionaryRef dict = (__bridge_retained  CFDictionaryRef)aDictionary;
    CFShow(dict);
    //=>-[OOOAppDelegate method005] aDictionary 0x6b6bf70 = {key1 = "<null>";key2 = bbb;key3 = ccc;}
    //ポインタの部分は毎回変わります。
    //<CFBasicHash 0x686ef30 [0x145eb48]>{type = immutable dict, count = 3,
    //    entries =>
    //    0 : <CFString 0x463c [0x145eb48]>{contents = "key2"} = <CFString 0x462c [0x145eb48]>{contents = "bbb"}
    //    1 : <CFString 0x461c [0x145eb48]>{contents = "key1"} = <CFNull 0x145ece8 [0x145eb48]>
    //    2 : <CFString 0x465c [0x145eb48]>{contents = "key3"} = <CFString 0x464c [0x145eb48]>{contents = "ccc"}
    //}
    
}

#pragma mark NSDictionary dictionaryWithObject:forKey
-(void)method006
{
    //NSDictionaryを作成
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObject:@"aaa" forKey:@"key1"];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary description]);
    
    //=>-[OOOAppDelegate method006] aDictionary 0x6b90a10 = {key1 = aaa;}

}

#pragma mark NSDictionary key
-(void)method007
{
    //NSDictionaryを作成
    NSDictionary *keyDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSNull null],@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    NSString *str = [NSString stringWithString:@"aaa"];
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObject:str forKey:keyDictionary];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary description]);
    //=>-[OOOAppDelegate method007] aDictionary 0x6b574d0 = {{key1 = "<null>";key2 = bbb;key3 = ccc;} = aaa;}

    
    NSLog(@"%s str %p = %@",__FUNCTION__,str,str);
    NSLog(@"%s str %p = %@",__FUNCTION__,[aDictionary objectForKey:keyDictionary],[aDictionary objectForKey:keyDictionary]);
    //-[OOOAppDelegate method007] str 0x463c = aaa
    //-[OOOAppDelegate method007] str 0x463c = aaa
}

#pragma mark NSDictionary dictionaryWithObjects:forKeys:
-(void)method008
{
    //NSDictionaryを作成
    NSArray *objArr = [NSArray arrayWithObjects:@"iti", @"ni", @"san", nil];
    NSArray *keyArr = [NSArray arrayWithObjects:@"key1", @"key2", @"key3", nil];
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjects:objArr forKeys:keyArr];
    
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary description]);
    //=>aDictionary 0x6e34f10 = {key1 = iti;key2 = ni;key3 = san;}

}

#pragma mark NSDictionary dictionaryWithObjects:forKeys:count:
-(void)method009
{
    static const int theCount = 100;
    
    NSString *keyArr[theCount]; 
    NSNumber *valArr[theCount];
    int i;
    for (i = 0; i < theCount; i++) {
        
        keyArr[i] = [NSString stringWithFormat:@"key%d",i];
        valArr[i] = [NSNumber numberWithInt:(100-i)];
    }
	
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjects:(id *)valArr 
                                          forKeys:(id *)keyArr count:theCount];
    
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary description]);
    //=>-[OOOAppDelegate method009] aDictionary 0x6e1f4f0 = {key0 = 100;key1 = 99;key10 = 90;......key98 = 2;key99 = 1;}
    
}

#pragma mark NSDictionary dictionaryWithObjectsAndKeys:
-(void)method010
{
    NSDictionary *aDictionary = 
            [NSDictionary dictionaryWithObjectsAndKeys:
             @"value1",@"key1",
             @"value2",@"key2",
             @"value3",@"key3",nil];
    
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary description]);
    //=>-[OOOAppDelegate method010] aDictionary 0x6a92a30 = {key1 = value1;key2 = value2;key3 = value3;}

}

#pragma mark NSDictionary allKeys:
-(void)method011
{
    NSDictionary *aDictionary = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"value1",@"key1",
     @"value2",@"key2",
     @"value3",@"key3",nil];
    
    NSArray *anArray = [aDictionary allKeys];
    NSLog(@"%s anArray %p = %@",__FUNCTION__,anArray,[anArray description]);
    //=>-[OOOAppDelegate method011] anArray 0x6b422e0 = (key2,key1,key3)    
}

#pragma mark NSDictionary allKeysForObject:
-(void)method012
{
    NSDictionary *aDictionary = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"aaa",@"key1",
     @"bbb",@"key2",
     @"aaa",@"key3",
     @"a",@"key4",nil];
    
    NSArray *anArray = [aDictionary allKeysForObject:@"aaa"];
    NSLog(@"%s anArray %p = %@",__FUNCTION__,anArray,[anArray description]);
    //=>-[OOOAppDelegate method012] anArray 0x6e6b5a0 = (key3,key1)
   
}

#pragma mark NSDictionary allValues:
-(void)method013
{
    NSDictionary *aDictionary = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"value1",@"key1",
     @"value2",@"key2",
     @"value3",@"key3",nil];
    
    NSArray *anArray = [aDictionary allValues];
    NSLog(@"%s anArray %p = %@",__FUNCTION__,anArray,[anArray description]);
    //=>-[OOOAppDelegate method013] anArray 0x6870d50 = (value2,value1,value3)
 
}

#pragma mark NSDictionary count
-(void)method014
{
    NSDictionary *aDictionary = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"value1",@"key1",
     @"value2",@"key2",
     @"value3",@"key3",nil];
    
    NSLog(@"%s aDictionary = %d",__FUNCTION__,[aDictionary count]);
    //=>-[OOOAppDelegate method014] aDictionary = 3
    
}

#pragma mark NSDictionary description
-(void)method015
{
    //NSDictionaryを作成
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObject:@"aaa" forKey:@"key1"];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary description]);
    //=>-[OOOAppDelegate method015] aDictionary 0x682d150 = {key1 = aaa;}
}

#pragma mark NSDictionary descriptionInStringsFileFormat
-(void)method016
{
    //NSDictionaryを作成
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObject:@"aaa" forKey:@"key1"];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary descriptionInStringsFileFormat]);
    //=>-[OOOAppDelegate method016] aDictionary 0x6862fc0 = "key1" = "aaa";
}

#pragma mark NSDictionary descriptionInStringsFileFormat
//まだ途中
-(void)method017
{
    NSDictionary *localeDic= [[NSDictionary alloc] initWithObjectsAndKeys:
                        @",",@"NSDecimalSeparator",//小数点区切りフランスでは,が小数点らしい
                		nil];
    NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    NSLocale *gbLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    NSLocale *deLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];

    
    NSDictionary *aDictionary = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     [NSDate dateWithTimeIntervalSinceNow:1],@"key0",
     [NSNumber numberWithFloat:1233.333],@"key1",
     [NSNumber numberWithFloat:124.34],@"key2",
     [NSNumber numberWithFloat:1234.23],@"key3",nil];

    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary descriptionWithLocale:frLocale]);
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,aDictionary,[aDictionary descriptionWithLocale:[NSLocale currentLocale]]);
    //=>-[OOOAppDelegate method016] aDictionary 0x6862fc0 = "key1" = "aaa";
    
    NSString *frStr = [[NSString alloc] initWithFormat:@"  %.2f" locale:frLocale,1200.344,nil ];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,frStr,frStr);
}

#pragma mark NSDictionary valueForKey
-(void)method018
{
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary objectForKey:@"@count"]);
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@count"]);
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary objectForKey:@"@allKeys"]);
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allKeys"]);
}

#pragma mark enumerateKeysAndObjectsUsingBlock:
-(void)method019
{
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    [aDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj,BOOL *stop) {
        NSLog(@"%s %p %@=%@",__FUNCTION__,aDictionary,key,obj);

        if ([obj isEqualToString:@"ccc"]) {
            *stop = YES;   
        }
    }];
    
}

#pragma mark NSDictionary  enumerateKeysAndObjectsWithOptions:usingBlock:
-(void)method020
{
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    [aDictionary enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id key, id obj,BOOL *stop) {
        NSLog(@"%s %p %@=%@",__FUNCTION__,aDictionary,key,obj);
        
        if ([obj isEqualToString:@"ccc"]) {
            *stop = YES;   
        }
    }];
    //=> 0x6a4f7a0 key2=bbb
    //=> 0x6a4f7a0 key1=aaa
    //=> 0x6a4f7a0 key3=ccc
}



#pragma mark NSDictionary  keysSortedByValueUsingComparator
-(void)method021
{
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"bbb",@"key2",@"ccc",@"key3",@"aaa",@"key1", nil];
    NSArray *sortedKeyArray = [aDictionary keysSortedByValueUsingComparator:^(id obj1,id obj2){
                                return [obj1 compare:obj2];
                            }];
    
    NSLog(@"%s %p %@",__FUNCTION__,sortedKeyArray,[sortedKeyArray description]);
    //=>-[OOOAppDelegate method021] 0x6a3a1e0 (key1,key2,key3)
    
}

#pragma mark sortedArrayWithOptions:usingComparator:
-(void)method022
{
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"bbb",@"key2",@"ccc",@"key3",@"aaa",@"key1", nil];
    NSArray *sortedKeyArray = [aDictionary keysSortedByValueWithOptions:NSEnumerationConcurrent usingComparator:^(id obj1,id obj2){
        return [obj1 compare:obj2];
    }];
    
    NSLog(@"%s %p %@",__FUNCTION__,sortedKeyArray,[sortedKeyArray description]);
    //=>-[OOOAppDelegate method021] 0x6a3a1e0 (key1,key2,key3)
    
}


#pragma mark indexOfObjectPassingTest:
-(void)method023
{
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"obj",@"key2",@"obj",@"key3",@"aaa",@"key1", nil];
    
    NSSet *aSet = [aDictionary keysOfEntriesPassingTest:^ BOOL (id key ,id obj,  BOOL *stop)
                      {
                         
                          if ([obj isEqualToString:@"obj"]) {
                              return YES;    
                          }else {
                              return NO;
                          }
                          
                      }];
    NSLog(@"%s %p %@",__FUNCTION__,aSet,[aSet description]);
    
}
#pragma mark NSDictionary key part2
-(void)method024
{
    //
    static const int theCount = 50000;
    
    NSString *keyArr[theCount]; 
    NSNumber *valArr[theCount];
    NSNumber *valKeyArr[theCount];
    int i;
    for (i = 0; i < theCount; i++) {
        
        keyArr[i] = [NSString stringWithFormat:@"key%d",i];
        valArr[i] = [NSNumber numberWithInt:(theCount-i)];
        valKeyArr[i] = [NSNumber numberWithInt:(theCount-i)];
    }
	
    //NSDictionaryを作成
    //キーがNSString
    NSDictionary *aDictionary = [NSDictionary dictionaryWithObjects:(id *)valArr 
                                                        forKeys:(id *)keyArr count:theCount];
    //キーがNSNumber
    NSDictionary *bDictionary = [NSDictionary dictionaryWithObjects:(id *)valArr 
                                                            forKeys:(id *)valKeyArr count:theCount];

    //NSLog(@"%s str %p = %@",__FUNCTION__,[aDictionary objectForKey:@"key49999"],[aDictionary objectForKey:@"key49999"]);
    //ナノ秒レベルの時間計測
    //<mach/mach_time.h>が必要
    //Saki さん Thanks!
    //http://blog.livedoor.jp/yousuke_saki/archives/51494672.html
    uint64_t start, elapsed;
    start = mach_absolute_time();
    //↓計測対象
    id aObj = [aDictionary objectForKey:@"key49999"];
	//↑計測対象
    elapsed = mach_absolute_time() - start;
    mach_timebase_info_data_t base;
    mach_timebase_info(&base);
    uint64_t nsec1 = elapsed * base.numer / base.denom;
    NSLog(@"%llu nano second",nsec1);
    //時間計測終了
    
	
    start = mach_absolute_time();
    //↓計測対象
    id bObj = [aDictionary objectForKey:[NSNumber numberWithInt:49999]];    
    //↑計測対象
    elapsed = mach_absolute_time() - start;
    //mach_timebase_info_data_t base;
    mach_timebase_info(&base);
    uint64_t nsec2 = elapsed * base.numer / base.denom;
    NSLog(@"%llu nano second",nsec2);
    
    NSLog(@"%.2f %%",(((float)nsec2/(float)nsec1))*100);
    //時間計測終了

}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    //[self method002];
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
    [self method017];
    [self method018];
    [self method019];
    
    [self method020];
    [self method021];
    
    [self method022];
    [self method023];
    [self method024];
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
