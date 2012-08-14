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

#pragma mark bundleWithIdentifier:
-(void)method006
{
    NSBundle *bundle = [NSBundle bundleWithIdentifier:@"com.oomori.NSBundle" ];
    NSLog(@"%s : %@",__FUNCTION__ ,[bundle resourcePath]);
    //シミュレーターでの結果
    //=>-[OOOAppDelegate method006] : /Users/satoshi/Library/Application Support/iPhone Simulator/5.1/Applications/7E173DDA-3184-4272-A297-DD7F863C3938/NSBundle.app
}

#pragma mark mainBundle:
-(void)method007
{
    NSBundle *bundle = [NSBundle mainBundle];
    
    
    NSLog(@"%s : %@",__FUNCTION__ ,[bundle description]);
    //=>-[OOOAppDelegate method007] : NSBundle </Users/satoshi/Library/Application Support/iPhone Simulator/5.1/Applications/7E173DDA-3184-4272-A297-DD7F863C3938/NSBundle.app> (loaded)

}

#pragma mark NSBundle allBundles:
-(void)method008
{
    NSArray *bundle = [NSBundle allBundles];
    
    
    NSLog(@"%s : %@",__FUNCTION__ ,[bundle description]);
    //=>-[OOOAppDelegate method008] : ("NSBundle </Users/satoshi/Library/Application Support/iPhone Simulator/5.1/Applications/7E173DDA-3184-4272-A297-DD7F863C3938/NSBundle.app> (loaded)")

    
}

#pragma mark NSBundle allFrameworks:
-(void)method009
{
    NSArray *bundle = [NSBundle allFrameworks];
    
    
    NSLog(@"%s : %@",__FUNCTION__ ,[bundle description]);
    //=>
    
    
}

#pragma mark NSBundle classNamed:
-(void)method010
{
    NSBundle *bundle = [NSBundle mainBundle];
    Class c = [bundle classNamed:@"OOOAppDelegate"];
    NSLog(@"%s : %@",__FUNCTION__ ,[c description]);
    //=>
}

#pragma mark NSBundle principalClass
-(void)method011
{
    Class exampleClass;
    id newInstance;
    
    NSURL *bundleURL = [[NSBundle mainBundle] bundleURL];
    //NSBundle *bundleToLoad = [NSBundle bundleWithURL:[bundleURL URLByAppendingPathComponent:@"Settings.bundle"]];
    NSBundle *bundleToLoad = [NSBundle bundleWithURL:bundleURL];
    [bundleToLoad load];
    exampleClass = [bundleToLoad principalClass];
    
    if (exampleClass) {
        newInstance = [[exampleClass alloc] init];
        //[newInstance doSomething];
    }
    NSLog(@"%s : %@",__FUNCTION__ ,[exampleClass description]);
    //=>
}

#pragma mark NSBundle bundleIdentifier
-(void)method012
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSLog(@"%s : %@",__FUNCTION__ ,[bundle bundleIdentifier]);
    //=>
}

#pragma mark NSBundle bundleIdentifier
-(void)method013
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *infoDic = [bundle infoDictionary];
    NSLog(@"%s : %@",__FUNCTION__ ,[infoDic description]);
    //=>
}

#pragma mark NSBundle bundleIdentifier
-(void)method014
{
    NSBundle *bundle = [NSBundle mainBundle];
    id obj = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
    NSLog(@"%s : %@",__FUNCTION__ ,[obj description]);
    //=>
}

#pragma mark NSBundle builtInPlugInsPath
-(void)method015
{
    NSBundle *bundle = [NSBundle mainBundle];
    id obj = [bundle builtInPlugInsPath];
    NSLog(@"%s : %@",__FUNCTION__ ,[obj description]);
    //=>
}

#pragma mark NSBundle executableURL
-(void)method016
{
    NSBundle *bundle = [NSBundle mainBundle];
    id obj = [bundle executableURL];
    NSLog(@"%s : %@",__FUNCTION__ ,[obj description]);
    //=>
}


#pragma mark NSBundle URLForAuxiliaryExecutable:
-(void)method017
{
    NSBundle *bundle = [NSBundle mainBundle];
    id obj = [bundle URLForAuxiliaryExecutable:@"NSBundle"];
    NSLog(@"%s : %@",__FUNCTION__ ,[obj description]);
    //=>
}

#pragma mark NSBundle privateFrameworksURL
-(void)method018
{
    NSBundle *bundle = [NSBundle mainBundle];
    id obj = [bundle privateFrameworksURL];
    NSLog(@"%s : %@",__FUNCTION__ ,[obj description]);
    //=>
}

#pragma mark NSBundle sharedFrameworksURL
-(void)method019
{
    NSBundle *bundle = [NSBundle mainBundle];
    id obj = [bundle sharedFrameworksURL];
    NSLog(@"%s : %@",__FUNCTION__ ,[obj description]);
    //=>
}

#pragma mark NSBundle resourceURL
-(void)method020
{
    NSBundle *bundle = [NSBundle mainBundle];
    id obj = [bundle resourceURL];
    NSLog(@"%s : %@",__FUNCTION__ ,[obj description]);
    //=>
}

#pragma mark NSBundle bundleIdentifier
-(void)method021
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *infoDic = [bundle localizedInfoDictionary];
    NSLog(@"%s : %@",__FUNCTION__ ,[infoDic description]);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method022
{
    NSBundle *bundle = [NSBundle mainBundle];
    //NSURL *aURL = [bundle URLForResource:@"en" withExtension:@"lproj" subdirectory:nil];
    NSURL *aURL = [bundle URLForResource:@"MainStoryboard_iPad" withExtension:@"storyboardc" subdirectory:@"en.lproj"];
    NSLog(@"%s : %@",__FUNCTION__ ,[aURL description]);
    //=>
}

#pragma mark NSBundle – localizedStringForKey:value:table:
-(void)method023
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *retStr = [bundle localizedStringForKey:@"cancel" value:@"Don't find" table:nil];
    //table nilならLocalizable.stringsを使う
    NSLog(@"%s : %@",__FUNCTION__ ,retStr);
    
    NSString *buttonStr = [bundle localizedStringForKey:@"Button1" value:@"Don't find" table:@"Button"];
    //table @"Button"ならButton.stringsを使う
    NSLog(@"%s : %@",__FUNCTION__ ,buttonStr);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method024
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *aURL = [bundle URLForResource:@"MainStoryboard_iPad" withExtension:@"storyboardc"];
    NSLog(@"%s : %@",__FUNCTION__ ,[aURL description]);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method025
{
    NSBundle *bundle = [NSBundle mainBundle];
    //NSURL *aURL = [bundle URLForResource:@"en" withExtension:@"lproj" subdirectory:nil];
    NSURL *aURL = [bundle URLForResource:@"MainStoryboard_iPad" withExtension:@"storyboardc" subdirectory:nil localization:@"ja"];
    NSLog(@"%s : %@",__FUNCTION__ ,[aURL description]);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method026
{
    NSURL *bundleURL = [[NSBundle mainBundle] bundleURL];
    NSURL *bURL = [NSBundle URLForResource:@"MainStoryboard_iPad"
                             withExtension:@"storyboardc" 
                              subdirectory:nil
                           inBundleWithURL:bundleURL];
    NSLog(@"%s : %@",__FUNCTION__ ,[bURL description]);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method027
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *anArray1 = [bundle URLsForResourcesWithExtension:@"storyboardc" subdirectory:nil localization:@"ja"];
    NSLog(@"%s : %@",__FUNCTION__ ,[anArray1 description]);
    NSArray *anArray2 = [bundle URLsForResourcesWithExtension:@"storyboardc" subdirectory:nil];
    NSLog(@"%s : %@",__FUNCTION__ ,[anArray2 description]);
    //=>
}


#pragma mark NSBundle URLForResource
-(void)method028
{
    NSArray *array = [NSBundle  preferredLocalizationsFromArray:[[NSBundle mainBundle]  localizations]];

    NSLog(@"%s : %@",__FUNCTION__ ,[array description]);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method029
{
    NSArray *array = [[NSBundle mainBundle]  localizations];
    
    NSLog(@"%s : %@",__FUNCTION__ ,[array description]);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method030
{
    NSArray *array = [[NSBundle mainBundle]  preferredLocalizations];
    
    NSLog(@"%s : %@",__FUNCTION__ ,[array description]);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method031
{
    NSString *string = [[NSBundle mainBundle]  developmentLocalization];
    
    NSLog(@"%s : %@",__FUNCTION__ ,[string description]);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method032
{
    NSDictionary *aDictionary = [[NSBundle mainBundle]  localizedInfoDictionary];
    
    NSLog(@"%s : %@",__FUNCTION__ ,[aDictionary description]);
    //=>
}
#pragma mark NSBundle principalClass
-(void)method033
{
    Class exampleClass;
    id newInstance;
    
    NSURL *bundleURL = [[NSBundle mainBundle] bundleURL];
    //NSBundle *bundleToLoad = [NSBundle bundleWithURL:[bundleURL URLByAppendingPathComponent:@"Settings.bundle"]];
    NSBundle *bundleToLoad = [NSBundle bundleWithURL:bundleURL];
    NSError *error = nil;
    [bundleToLoad loadAndReturnError:&error];
    exampleClass = [bundleToLoad principalClass];
    
    if (exampleClass) {
        newInstance = [[exampleClass alloc] init];
        //[newInstance doSomething];
    }
    NSLog(@"%s : %@",__FUNCTION__ ,[error description]);
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method034
{
    NSLog(@"%s : %@",__FUNCTION__ ,([[NSBundle mainBundle] isLoaded])?@"YES":@"NO");
    //=>
}

#pragma mark NSBundle principalClass
-(void)method035
{
    Class exampleClass;
    id newInstance;
    
    NSURL *bundleURL = [[NSBundle mainBundle] bundleURL];
    //NSBundle *bundleToLoad = [NSBundle bundleWithURL:[bundleURL URLByAppendingPathComponent:@"Settings.bundle"]];
    NSBundle *bundleToLoad = [NSBundle bundleWithURL:bundleURL];
    NSError *error = nil;
    [bundleToLoad loadAndReturnError:&error];
    exampleClass = [bundleToLoad principalClass];
    
    if (exampleClass) {
        newInstance = [[exampleClass alloc] init];
        //[newInstance doSomething];
    }
    NSLog(@"%s : %@",__FUNCTION__ ,([bundleToLoad isLoaded])?@"YES":@"NO");
    [bundleToLoad unload];
    NSLog(@"%s : %@",__FUNCTION__ ,([bundleToLoad isLoaded])?@"YES":@"NO");
    
    
    //=>
}

#pragma mark NSBundle URLForResource
-(void)method036
{
    NSError *error = nil;
    NSLog(@"%s : %@",__FUNCTION__ ,([[NSBundle mainBundle]  preflightAndReturnError:&error])?@"YES":@"NO");
    
    //=>
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
    [self method016];    
    [self method017];
    [self method018];    
    [self method019];
    [self method020];    
    [self method021];
    [self method022];
    [self method023];    
    [self method024];
    [self method025];    
    [self method026];
    [self method027];    
    [self method028];
    [self method029];
    [self method030];
    [self method031];
    [self method032];
    [self method033];
    [self method034];
    [self method035];
    [self method036];
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
