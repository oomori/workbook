//
//  OOOAppDelegate.m
//  NSMutableData
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
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
}
#pragma mark NSData dataWithCapacity:
-(void)method002
{
    NSMutableData *aData = [NSMutableData dataWithCapacity:100];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
}

#pragma mark NSData dataWithLength:
-(void)method003
{
    NSMutableData *aData = [NSMutableData dataWithLength:20];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000>
}

#pragma mark NSData increaseLengthBy:
-(void)method004
{
    NSMutableData *aData = [NSMutableData dataWithLength:20];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000>
    [aData increaseLengthBy:10];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000>

}

#pragma mark NSData setLength:
-(void)method005
{
    NSMutableData *aData = [NSMutableData dataWithLength:20];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000>
    [aData setLength:10];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 0000>
    
}

#pragma mark NSData appendData
-(void)method006
{
    unsigned char *pngBytes = malloc(sizeof(unsigned char)*5);
    pngBytes[0] = 0x01;
    pngBytes[1] = 0x02;
    pngBytes[2] = 0x03;
    pngBytes[3] = 0x04;
    pngBytes[4] = 0x05;
    
    NSData *data1 = [NSData dataWithBytesNoCopy:pngBytes length:5 freeWhenDone:YES];
    
    NSMutableData *aData = [NSMutableData dataWithLength:20];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000>
    [aData appendData:data1];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000 01020304 05>
}

#pragma mark NSData appendData
-(void)method007
{
    unsigned char *pngBytes = malloc(sizeof(unsigned char)*5);
    pngBytes[0] = 0x01;
    pngBytes[1] = 0x02;
    pngBytes[2] = 0x03;
    pngBytes[3] = 0x04;
    pngBytes[4] = 0x05;
        
    NSMutableData *aData = [NSMutableData dataWithLength:20];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000>
    [aData appendBytes:pngBytes length:5];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000 01020304 05>
}

#pragma mark NSData replaceBytesInRange:withBytes:
-(void)method008
{
    unsigned char *pngBytes = malloc(sizeof(unsigned char)*5);
    pngBytes[0] = 0x01;
    pngBytes[1] = 0x02;
    pngBytes[2] = 0x03;
    pngBytes[3] = 0x04;
    pngBytes[4] = 0x05;
    
    NSMutableData *aData = [NSMutableData dataWithLength:20];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000>
    [aData replaceBytesInRange:NSMakeRange(3,5) withBytes:pngBytes];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000001 02030405 00000000 00000000 00000000>
}

#pragma mark NSData replaceBytesInRange:withBytes:length:
-(void)method009
{
    unsigned char *pngBytes = malloc(sizeof(unsigned char)*5);
    pngBytes[0] = 0x01;
    pngBytes[1] = 0x02;
    pngBytes[2] = 0x03;
    pngBytes[3] = 0x04;
    pngBytes[4] = 0x05;
    
    NSMutableData *aData = [NSMutableData dataWithLength:20];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000000 00000000 00000000 00000000 00000000>
    [aData replaceBytesInRange:NSMakeRange(3,5) withBytes:pngBytes length:3];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><00000001 0203 00000000 00000000 00000000>
}

#pragma mark NSData appendData
-(void)method010
{
    int elementCount = 20;
    unsigned char *pngBytes = malloc(sizeof(unsigned char)*elementCount);
    for (int i = 0; i < elementCount; i++) {
        pngBytes[i] = 0xFF;
    } 
    NSMutableData *aData = [NSMutableData data];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><>
    [aData appendBytes:pngBytes length:elementCount];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><ffffffff ffffffff ffffffff ffffffff ffffffff>

    [aData resetBytesInRange:NSMakeRange(5, 8)];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><ffffffff ff000000 00000000 00ffffff ffffffff>

}

#pragma mark NSData resetBytesInRange
-(void)method011
{
    int elementCount = 20;
    unsigned char *pngBytes = malloc(sizeof(unsigned char)*elementCount);
    for (int i = 0; i < elementCount; i++) {
        pngBytes[i] = 0xFF;
    }
    NSData *data1 = [NSData dataWithBytesNoCopy:pngBytes length:5 freeWhenDone:YES];
  
    
    NSMutableData *aData = [NSMutableData data];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><>
    [aData setData:data1];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><ffffffff ffffffff ffffffff ffffffff ffffffff>
    
    [aData resetBytesInRange:NSMakeRange(5, 8)];
    NSLog(@"%s %@",__FUNCTION__,[aData description]);
    //=><ffffffff ff000000 00000000 00ffffff ffffffff>
    
    void *dataPointer = [aData mutableBytes];
    NSLog(@"%s %p",__FUNCTION__,dataPointer);
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
