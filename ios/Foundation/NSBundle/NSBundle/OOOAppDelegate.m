//
//  OOOAppDelegate.m
//  NSBundle
//
//  Created by 大森 智史 on 12/05/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark -allBundles:
-(void)method001
{
    NSArray *array = [NSBundle allBundles];
    NSLog(@"%s : %@",__FUNCTION__ ,[array description]);
    //=>-[OOOAppDelegate method001] : ("NSBundle </var/mobile/Applications/9793115E-D175-4AD8-89A1-F6D558587AB3/NSBundle.app> (loaded)"

    
}

#pragma mark -allFrameworks:
-(void)method002
{
    NSArray *array = [NSBundle allFrameworks];
    NSLog(@"%s : %@",__FUNCTION__ ,[array description]);
    //=>[OOOAppDelegate method002] : (
    //=>["NSBundle </System/Library/PrivateFrameworks/DataAccessExpress.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/SpringBoardServices.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/GeoServices.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/PersistentConnection.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/Foundation.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/MobileCoreServices.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/AccountSettings.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/AddressBook.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/WebCore.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/ManagedConfiguration.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/AssetsLibraryServices.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/AggregateDictionary.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/UIKit.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/CoreText.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/CoreTelephony.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/CoreLocation.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/AppSupport.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/FaceCoreLight.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/WebKit.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/CoreImage.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/CoreFoundation.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/JavaScriptCore.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/CoreTime.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/DataMigration.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/QuartzCore.framework> (loaded)",
    //=>["NSBundle </usr/lib> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/ProofReader.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/OpenGLES.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/ProtocolBuffer.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/PrintKit.framework> (loaded)",
    //=>["NSBundle </System/Library/PrivateFrameworks/OpenCL.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/CoreVideo.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/CFNetwork.framework> (loaded)",
    //=>["NSBundle </System/Library/Frameworks/CoreMedia.framework> (loaded)"
    //=>[)
    
    
}

#pragma mark bundleForClass:
-(void)method003
{
    NSBundle *bundle = [NSBundle bundleForClass: [self class ] ];
    NSLog(@"%s : %@",__FUNCTION__ ,[bundle resourcePath]);
    //テスト機での結果
    //=>-[OOOAppDelegate method003] : /var/mobile/Applications/9793115E-D175-4AD8-89A1-F6D558587AB3/NSBundle.app
    
}

#pragma mark bundleWithPath:
-(void)method004
{
    
    NSBundle *bundle = [NSBundle bundleWithPath: @"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.1.sdk/System/Library/PrivateFrameworks/BluetoothManager.framework" ];
    NSLog(@"%s : %@",__FUNCTION__ ,[bundle resourcePath]);
    //シミュレータでの結果
    //=>-[OOOAppDelegate method004] : /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.1.sdk/System/Library/PrivateFrameworks/BluetoothManager.framework
    
}

#pragma mark executableArchitectures:
-(void)method005
{
    NSArray *thisArch = [[NSBundle mainBundle] executableArchitectures];
    
    for (NSNumber *obj in thisArch) {
        
        switch ([obj integerValue] ) {
            case NSBundleExecutableArchitectureI386:
                NSLog(@"NSBundleExecutableArchitectureI386");
                break;
            case NSBundleExecutableArchitecturePPC:
                NSLog(@"NSBundleExecutableArchitecturePPC");
                break;
            case NSBundleExecutableArchitectureX86_64:
                NSLog(@"NSBundleExecutableArchitectureX86_64");
                break;
            case NSBundleExecutableArchitecturePPC64:
                NSLog(@"NSBundleExecutableArchitecturePPC64");
                break;    
            default:
                break;
        }
    }
    NSLog(@"%s : %@",__FUNCTION__ ,[thisArch description]);
    //=>-[OOOAppDelegate method005] : (7)

    
}

#pragma mark bundleForClass:
-(void)method006
{

    
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
