//
//  OOOAppDelegate.m
//  NSValue
//
//  Created by 大森 智史 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSValue @encode(NSRange)
-(void)method001
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    [aDictionary setValue:@"ddd" forKey:@"stringKey"];
    
    NSRange aRange = NSMakeRange(0, 10);
    aDictionary[@"rangeKey"] = [NSValue valueWithRange:aRange];
    
    
    aDictionary[@"objcKey"] = [NSValue value:&aRange withObjCType:@encode(NSRange)];
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allValues"]);
    //=>-[OOOAppDelegate method001] 0x6a2ac10 (ddd,"NSRange: {0, 10}","NSRange: {0, 10}")
}


#pragma mark NSValue @encode(myStruct)
typedef struct {	
    NSUInteger point;
    NSUInteger length;
} MYStruct;
-(void)method002
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    [aDictionary setValue:@"ddd" forKey:@"key4"];
    
    NSRange aRange = NSMakeRange(0, 10);
    aDictionary[@"keyNSRange"] = [NSValue valueWithRange:aRange];
    
    MYStruct myStruct;
    myStruct.point = 0;
    myStruct.length = 10;
    
    
    aDictionary[@"keyMYStruct"] = [NSValue value:&myStruct withObjCType:@encode(MYStruct)];
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allValues"]);
    
    NSValue *structValue = aDictionary[@"keyMYStruct"];
    MYStruct myStruct2;
	
    [structValue getValue:&myStruct2];
    
    NSLog(@"%s %p %d",__FUNCTION__,aDictionary,myStruct2.length);
    //=>10
    
}
#pragma mark NSValue valueWithRange
-(void)method003
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [aDictionary setValue:@"ddd" forKey:@"stringKey"];
    
    NSRange aRange = NSMakeRange(0, 10);
    aDictionary[@"rangeKey"] = [NSValue valueWithRange:aRange];
    
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allValues"]);
    //=>-[OOOAppDelegate method003] 0x6a2ac10 (ddd,"NSRange: {0, 10}")
}
#pragma mark NSValue @encode(CGPoint)
-(void)method004
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    [aDictionary setValue:@"ddd" forKey:@"stringKey"];
    
    CGPoint aPoint = CGPointMake(0, 200);
    
    aDictionary[@"objcKey"] = [NSValue value:&aPoint withObjCType:@encode(CGPoint)];
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allValues"]);
    //=>-[OOOAppDelegate method001] 0x6a2ac10 (ddd,"NSPoint: {0, 200}")
    
}

#pragma mark NSValue objCType
-(void)method005
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    [aDictionary setValue:@"ddd" forKey:@"stringKey"];
    
    CGPoint aPoint = CGPointMake(0, 200);
    NSValue *aValue = [NSValue value:&aPoint withObjCType:@encode(CGPoint)];
    aDictionary[@"objcKey"] = aValue;
    
    NSLog(@"%s %s",__FUNCTION__,[aValue objCType]);
    //=>-[OOOAppDelegate method001] 0x6a2ac10 (ddd,"NSPoint: {0, 200}")
    
}

#pragma mark NSValue objCType
-(void)method006
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    char *cString = "My name is OOMORI.";
    NSValue *aValue = [NSValue value:cString withObjCType:@encode(char *)];
    aDictionary[@"objcKey"] = aValue;
    
    NSLog(@"%s %s",__FUNCTION__,[aValue objCType]);
    NSLog(@"%s %@",__FUNCTION__,[aDictionary description]);
    //=>-[OOOAppDelegate method001] 0x6a2ac10 (ddd,"NSPoint: {0, 200}")
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"objcKey"]);
    
    
    
}

#pragma mark NSValue objCType
-(void)method007
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    char *cString = "My name is OOMORI.";
    NSValue *aValue = [NSValue valueWithBytes:cString objCType:@encode(char *) ];
                       
    aDictionary[@"objcKey"] = aValue;
    
    NSLog(@"%s %s",__FUNCTION__,[aValue objCType]);
    NSLog(@"%s %@",__FUNCTION__,[aDictionary description]);
    //=>-[OOOAppDelegate method001] 0x6a2ac10 (ddd,"NSPoint: {0, 200}")
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"objcKey"]);
    
    //単にポインタを渡す場合
	id anObject = @"Obj-C string";
	NSValue *theValueOfPointer = [NSValue valueWithBytes:&anObject objCType:@encode(void *)];
	id theObjPointer;
	[theValueOfPointer getValue:&theObjPointer];
	NSLog(@"---%@",theObjPointer);
}

#pragma mark NSValue objCType
-(void)method008
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    NSValue *aValue = [NSValue valueWithNonretainedObject:@"TEST" ];
    
    aDictionary[@"objcKey"] = aValue;
    
    NSLog(@"%s %s",__FUNCTION__,[aValue objCType]);
    NSLog(@"%s %@",__FUNCTION__,[aDictionary description]);
    //=>
    NSString *string = [[aDictionary valueForKey:@"objcKey"] nonretainedObjectValue];
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,string);
}

#pragma mark NSValue valueWithPointer
-(void)method009
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    char *localString = "My name is OOMORI.";
	NSValue *theValue = [NSValue valueWithPointer: localString ];
	aDictionary[@"objcKey"] = theValue;
    
    char *theCString;
    theCString = [[aDictionary valueForKey:@"objcKey"] pointerValue];
    
	NSLog(@"%s %s",__FUNCTION__,theCString);
    
    NSLog(@"%s %s",__FUNCTION__,[theValue objCType]);
}

#pragma mark NSValue isEqualToValue
-(void)method010
{
    CGPoint aPoint = CGPointMake(0, 200);
    NSValue *aValue = [NSValue value:&aPoint withObjCType:@encode(CGPoint)];

    CGPoint bPoint = CGPointMake(0, 200);
    NSValue *bValue = [NSValue value:&bPoint withObjCType:@encode(CGPoint)];
    
    CGPoint cPoint = CGPointMake(200, 200);
    NSValue *cValue = [NSValue value:&cPoint withObjCType:@encode(CGPoint)];

    NSLog(@"a vs b %@",([aValue isEqualToValue:bValue]?@"YES":@"NO"));
    NSLog(@"a vs c %@",([aValue isEqualToValue:cValue]?@"YES":@"NO"));

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
