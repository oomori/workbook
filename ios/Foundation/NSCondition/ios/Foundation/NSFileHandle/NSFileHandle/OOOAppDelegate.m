//
//  OOOAppDelegate.m
//  NSFileHandle
//
//  Created by 大森 智史 on 2012/10/21.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

-(void)method001
{

    /*

    NSString *str1 =[opanel filename];
    
    NSFileHandle *handle1;				//t@Cnh
    NSFileHandle *handle2;				//t@Cnh
    NSFileHandle *handle3;				//t@Cnh
    NSFileHandle *handle4;				//t@Cnh
    NSFileHandle *handle5;				//t@Cnh
    NSFileHandle *handle6;				//t@Cnh
    NSFileHandle *handle7;				//t@Cnh
    NSFileHandle *handle8;				//t@Cnh
    NSFileHandle *handle9;				//t@Cnh
    NSFileHandle *handle10;				//t@Cnh
    NSData *data ;					//t@Cf[^
    
    NSString *str2 = [NSString stringWithString:@"aiueo"];
    //t@CÌg
    //ftHgÌÊmZ^[ðnCenterÉ
    NSNotificationCenter *nCenter =[NSNotificationCenter defaultCenter];
    //nCenterÉIuU[o[ðÁ¦é
    [nCenter addObserver:self//±êðÄÑo·
                selector:@selector(notifi:) //ÄÑo³êé\bh
                    name:@"NSFileHandleDataAvailableNotification" //pÅ«éæ¤ÉÈÁ½ç
                  object:nil];
    //t@CÇÝIíè
    [nCenter addObserver:self//±êðÄÑo·
                selector:@selector(readComplete:) //ÄÑo³êé\bh
                    name:@"NSFileHandleReadCompletionNotification" //ÇÝIíÁ½ç
                  object:nil];
    //t@CÇÝIíè
    [nCenter addObserver:self//±êðÄÑo·
                selector:@selector(readEnd:) name:@"NSFileHandleReadToEndOfFileCompletionNotification" object:nil];
    
    data =[str2 dataUsingEncoding:NSASCIIStringEncoding];
    
     
     
     
     
    //«Ý
    handle2 = [NSFileHandle fileHandleForWritingAtPath:[str1 stringByExpandingTildeInPath]];
    //ÇÝ«
    handle3 = [NSFileHandle fileHandleForUpdatingAtPath:[str1 stringByExpandingTildeInPath]];
    //WG[oÍ
    handle4 = [NSFileHandle fileHandleWithStandardError];
    //WüÍ
    handle5 = [NSFileHandle fileHandleWithStandardInput];
    //WoÍ
    handle6 = [NSFileHandle fileHandleWithStandardOutput];
    //óÌfoCX
    handle7 = [NSFileHandle fileHandleWithNullDevice];
    
    NSLog([NSString stringWithFormat:@"%d",[handle1 fileDescriptor]]);
    //t@CfXNv^
    handle8 = [[NSFileHandle alloc] initWithFileDescriptor:1];
    handle9 = [[NSFileHandle alloc] initWithFileDescriptor:1 closeOnDealloc:YES];
    
    handle10 = [[NSFileHandle alloc] initWithFileDescriptor:1 closeOnDealloc:YES];
    
    [handle10  acceptConnectionInBackgroundAndNotify];
    
    [handle10  acceptConnectionInBackgroundAndNotifyForModes:[NSArray arrayWithObject:NSEventTrackingRunLoopMode]];
    //ÅãÜÅÇÞ
    NSLog([[NSString alloc] initWithData:[handle3 readDataToEndOfFile]
                                encoding:NSShiftJISStringEncoding
           ]);
    
    //t@CÇÝÝ|C^ðßµÄÇÝÝ
    [handle3 seekToFileOffset:0];
    NSLog([[handle3 readDataOfLength:10] description]);
    
    //¯ÍÊÚ
    
    
    
    
    NSLog([[handle3 availableData] description]);
    
    //[handle3 truncateFileAtOffset:1000];
    [handle3 closeFile];
     
     */
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
