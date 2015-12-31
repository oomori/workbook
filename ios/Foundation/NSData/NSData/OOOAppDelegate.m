//
//  OOOAppDelegate.m
//  NSData
//
//  Created by 大森 智史 on 2012/08/17.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate
#pragma mark NSData data
-(void)method001
{
    NSMutableData *aData = [NSMutableData data];
    NSLog(@"%@",[aData description]);
}

#pragma mark NSData dataWithContentsOfURL
-(void)method002
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *aUrl = [bundle resourceURL];
    NSString *filename = @"test.png";
    NSURL *newURL = [aUrl URLByAppendingPathComponent:filename];
    NSData *aData = [NSData dataWithContentsOfURL:newURL];
    
    NSLog(@"%lu bytes",(unsigned long)[aData length]);
}

#pragma mark NSData dataWithContentsOfURL:options:error
-(void)method003
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *aUrl = [bundle resourceURL];
    NSString *filename = @"test.png";
    NSURL *newURL = [aUrl URLByAppendingPathComponent:filename];
    NSError *anError = nil;
    NSData *aData = [NSData dataWithContentsOfURL:newURL
                                          options:NSDataReadingUncached
                                            error:&anError];
    
    NSLog(@"%lu bytes",(unsigned long)[aData length]);
}

#pragma mark NSData dataWithContentsOfFile
-(void)method004
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filename = @"test.png";
    NSString *bundlePath = [bundle resourcePath];
    NSString *filePath = [bundlePath stringByAppendingPathComponent:filename];
    
    NSData *aData = [NSData dataWithContentsOfFile:filePath];
    
    NSLog(@"%lu bytes",(unsigned long)[aData length]);
}
#pragma mark NSData dataWithContentsOfFile:options:error:
-(void)method005
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filename = @"test.png";
    NSString *bundlePath = [bundle resourcePath];
    NSString *filePath = [bundlePath stringByAppendingPathComponent:filename];
    NSError *anError = nil;
    NSData *aData = [NSData dataWithContentsOfFile:filePath
                                           options:NSDataReadingUncached
                                             error:&anError];
    
    NSLog(@"%s %lu bytes",__FUNCTION__,(unsigned long)[aData length]);
    //=>10796 bytes
}

#pragma mark NSData dataWithBytesNoCopy:
//変更ありiOS9.0
-(void)method006
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filename = @"test.png";
    NSString *bundlePath = [bundle resourcePath];
    NSString *filePath = [bundlePath stringByAppendingPathComponent:filename];
    NSError *anError = nil;
    NSData *aData = [NSData dataWithContentsOfFile:filePath
                                           options:NSDataReadingUncached
                                             error:&anError];
    NSUInteger pngLength = [aData length];
    unsigned char pngBytes[pngLength];
    [aData getBytes:pngBytes length:pngLength];
    
    //ここまでバイト列の準備
    
    NSData *data1 = [NSData dataWithBytesNoCopy:pngBytes length:pngLength freeWhenDone:NO];
    NSLog(@"%s %lu bytes",__FUNCTION__,(unsigned long)[data1 length]);
    NSLog(@"%s %p",__FUNCTION__,pngBytes);
    
    UIImage *image = [UIImage imageWithData:data1];
    NSLog(@"%s (%.1f,%.1f)",__FUNCTION__,[image size].width,[image size].height);

}

#pragma mark NSData dataWithBytesNoCopy:

-(void)method007
{
    unsigned char *pngBytes = malloc(sizeof(unsigned char)*5);
    pngBytes[0] = 0x0001;
    pngBytes[1] = 0x0002;
    pngBytes[2] = 0x0003;
    pngBytes[3] = 0x0004;
    pngBytes[4] = 0x0005;
    
    //コピーされないほう
    NSData *data1 = [NSData dataWithBytesNoCopy:pngBytes length:5 freeWhenDone:YES];
    //コピーされる方
    NSData *data2 = [NSData dataWithBytes:pngBytes length:5];
    
    unsigned char testByte1[5];
    unsigned char testByte2[5];

    [data1 getBytes:testByte1 length:5];
    [data2 getBytes:testByte2 length:5];
    NSLog(@"%s %u",__FUNCTION__,pngBytes[0]);
    NSLog(@"%s %u",__FUNCTION__,testByte1[0]);
    NSLog(@"%s %u",__FUNCTION__,testByte2[0]);

    //元のデータを変更してみる
    pngBytes[0] = 0x0009;
    [data1 getBytes:testByte1 length:5];
    [data2 getBytes:testByte2 length:5];
    
    NSLog(@"0 %s %u",__FUNCTION__,pngBytes[0]); //=>9　変更された！　当たり前
    NSLog(@"1 %s %u",__FUNCTION__,testByte1[0]);//=>9　変更された　元のデータを参照しているから
    NSLog(@"2 %s %u",__FUNCTION__,testByte2[0]);//=>1　変更されない（コピーしているから）
    

    unsigned char testByte3;
    [data1 getBytes:&testByte3 length:sizeof(unsigned char)];
    NSLog(@"3 %s %u",__FUNCTION__,testByte3);
    //=>9
    
    unsigned char testByte4;
    [data1 getBytes:&testByte4 range:NSMakeRange(1,1)];
    NSLog(@"4 %s %u",__FUNCTION__,testByte4);
    //=>2
    
    unsigned char testByte5;
    NSData *data5 = [data1 subdataWithRange:NSMakeRange(1,1)];
    [data5 getBytes:&testByte5 length:sizeof(testByte5)];
    NSLog(@"5 %s %u",__FUNCTION__,testByte5);
    //=>2
    
    unsigned char *findByte = malloc(sizeof(unsigned char)*1);
    
    *findByte = 0x0005;
    NSData *data6 = [NSData dataWithBytes:findByte length:1];
    
    NSRange findRange = [data1 rangeOfData:data6 options:0 range:NSMakeRange(0,5)];
    
    NSLog(@"%s %lu-%lu",__FUNCTION__,(unsigned long)findRange.location,(unsigned long)findRange.length);
    //=>
    
    free(findByte);
}

#pragma mark NSData dataWithContentsOfURL
-(void)method008
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *aUrl = [bundle resourceURL];
    NSString *filename = @"test.png";
    NSURL *newURL = [aUrl URLByAppendingPathComponent:filename];
    NSData *aData = [NSData dataWithContentsOfURL:newURL];
    
    const void *dataPointer = [aData bytes];
    NSLog(@"%s %p",__FUNCTION__,dataPointer);
}

#pragma mark NSData dataWithContentsOfURL
-(void)method009
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *aUrl = [bundle resourceURL];
    NSString *filename = @"test.png";
    NSURL *newURL = [aUrl URLByAppendingPathComponent:filename];
    NSData *aData = [NSData dataWithContentsOfURL:newURL];
    NSData *bData = [NSData dataWithContentsOfURL:newURL];
    
    NSLog(@"%s %@",__FUNCTION__,([aData isEqualToData:bData])?@"YES":@"NO");
}

#pragma mark NSData dataWithContentsOfURL
-(void)method010
{
    //バンドル内のリソースのtest.pngを読み込み
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *aUrl = [bundle resourceURL];
    NSString *filename = @"test.png";
    NSURL *newURL = [aUrl URLByAppendingPathComponent:filename];
    NSData *aData = [NSData dataWithContentsOfURL:newURL];
    
    //ユーザーのドキュメントフォルダにnew.pngとしてに書き込み
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
     NSString *writefilename = @"new.png";
     NSURL *bUrl = [NSURL fileURLWithPathComponents:@[documentsDirectory, writefilename]];
    [aData writeToURL:bUrl atomically:YES];
    
    //検証
    NSData *pngData = [NSData dataWithContentsOfURL:bUrl];
    
    NSLog(@"%lu bytes",(unsigned long)[pngData length]);
    //=>[OOOAppDelegate method010]　10796 bytes
}

#pragma mark NSData dataWithContentsOfFile:options:error:
-(void)method011
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filename = @"test.rtf";
    NSString *bundlePath = [bundle resourcePath];
    NSString *filePath = [bundlePath stringByAppendingPathComponent:filename];
    NSError *anError = nil;
    NSData *aData = [NSData dataWithContentsOfFile:filePath
                                           options:NSDataReadingMappedIfSafe
                                             error:&anError];
    NSUInteger readPointer = 0;
    
    while(readPointer < [aData length])
    {
        NSUInteger distanceToEndOfData = [aData length] - readPointer;
        
        NSString *newPortion =
        [[NSString alloc] initWithBytes:(uint8_t *)[aData bytes] + readPointer
                                 length:distanceToEndOfData > 16384 ? 16384 : distanceToEndOfData
                               encoding:NSUTF8StringEncoding];
        

        NSLog(@"%@",newPortion);

        readPointer += [newPortion lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
        
    }
    
    NSLog(@"%s %lu bytes",__FUNCTION__,(unsigned long)[aData length]);
    //=>10796 bytes
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
