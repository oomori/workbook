//
//  OOOAppDelegate.m
//  NSUserDefaults
//
//  Created by 大森 智史 on 2012/09/04.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate
#pragma mark
-(void)method001
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:@"NSString" forKey:@"KEY1"];
 
    
    NSLog(@"%@",([defaults synchronize])?@"OK":@"NG");
    
    NSLog(@"%@ %@",[defaults description],[defaults objectForKey:@"KEY1"]);
    [NSUserDefaults resetStandardUserDefaults];
    NSLog(@"%@ %@",[defaults description],[defaults objectForKey:@"KEY1"]);
    
    NSUserDefaults* defaults2 = [NSUserDefaults standardUserDefaults];
    [defaults2 setObject:@"NSString" forKey:@"KEY2"];
    
    NSLog(@"%@",([defaults synchronize])?@"OK":@"NG");
    
    NSLog(@"%@ %@",[defaults2 description],[defaults2 objectForKey:@"KEY1"]);
    [NSUserDefaults resetStandardUserDefaults];
    NSLog(@"%@ %@",[defaults2 description],[defaults2 objectForKey:@"KEY1"]);
    
}

#pragma mark
-(void)method002
{
    NSUserDefaults* defaults = [[NSUserDefaults alloc] init];
    
    [defaults setObject:@"NSString" forKey:@"KEY1"];
    
    
    NSLog(@"%@",([defaults synchronize])?@"OK":@"NG");
}

#pragma mark
NSDictionary *userDefaultsForUser(int uid, NSString *domain) {
    NSDictionary *result;
    
    [NSUserDefaults resetStandardUserDefaults];
    seteuid(uid);
    
    result=[[NSUserDefaults standardUserDefaults] persistentDomainForName:
            domain];
    [NSUserDefaults resetStandardUserDefaults];
    seteuid(0);
    
    return result;
}
-(void)method003
{
    uid_t userid = getuid();
    NSDictionary *dic =  userDefaultsForUser(userid,NSGlobalDomain);
    NSLog(@"%@",[dic description]);
}

-(void)method004
{
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:@"string" forKey:@"KEY1"];
    
    NSLog(@"synchronize %@",([defaults synchronize])?@"OK":@"NG");
    NSLog(@"%s %@",__FUNCTION__,[defaults description]);
    NSLog(@"%s %@",__FUNCTION__,[defaults objectForKey:@"KEY0"]);
    NSLog(@"%s %@",__FUNCTION__,[defaults objectForKey:@"KEY1"]);
    
    [defaults setBool:YES forKey:@"boolKey"];
    [defaults setFloat:10.2f forKey:@"floatKey"];
    [defaults setInteger:10 forKey:@"integerKey"];
    [defaults setDouble:9000000000 forKey:@"doubleKey"];
    [defaults setURL:[NSURL URLWithString:@"http://www.apple.com"] forKey:@"urlKey"];
    NSArray *array = [NSArray arrayWithObjects:@"aaa",@"bbb",[NSNumber numberWithInt:3], nil ];
    [defaults setObject:array forKey:@"arrayKey"];
    
    NSDictionary *aDic = [NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"key1",@"bbb",@"key2",@"ccc",@"key3", nil];
    [defaults setObject:aDic forKey:@"dictionaryKey"];
    
    BOOL boolValue = [defaults boolForKey:@"boolKey"];
    NSLog(@"%s %@",__FUNCTION__,(boolValue)?@"YES":@"NO");
    
    float floatValue = [defaults floatForKey:@"floatKey"];
    NSLog(@"%s %f",__FUNCTION__,floatValue);
    
    NSInteger integerValue = [defaults integerForKey:@"integerKey"];
    NSLog(@"%s %d",__FUNCTION__,integerValue);
    
    double doubleValue = [defaults doubleForKey:@"doubleKey"];
    NSLog(@"%s %f",__FUNCTION__,doubleValue);
    
    NSURL *bURL = [defaults URLForKey:@"urlKey"];
    NSLog(@"%s %@",__FUNCTION__,[bURL host]);
    
    NSArray *bArray = [defaults arrayForKey:@"arrayKey"];
    NSLog(@"%s %@",__FUNCTION__,bArray);
    
    NSDictionary *bDic = [defaults dictionaryForKey:@"dictionaryKey"];
    NSLog(@"%s %@",__FUNCTION__,bDic);
    
}

-(void)method005
{
    NSUserDefaults* defaults = [[NSUserDefaults alloc] init];
    
    NSArray *array = [NSArray arrayWithObjects:@"aaa",@"bbb",[NSNumber numberWithInt:3], nil ];
    [defaults setObject:array forKey:@"arrayKey"];
    NSArray *bArray = [defaults arrayForKey:@"arrayKey"];
    NSLog(@"%s %@",__FUNCTION__,bArray);
    //=>(aaa,bbb,3)
    
    [defaults removeObjectForKey:@"arrayKey"];
    
    NSArray *cArray = [defaults arrayForKey:@"arrayKey"];
    NSLog(@"%s %@",__FUNCTION__,cArray);
    //=>(null)

}

//TEST
-(void)method006
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setPersistentDomain:[NSDictionary dictionaryWithObject:@"value1" forKey:@"key1"] forName:@"com.oomori.DefaultsTest"];
    [defaults synchronize];
    
    NSLog(@"%s %@",__FUNCTION__,[defaults persistentDomainNames]);
    
    NSDictionary *dic = [defaults persistentDomainForName:@"com.oomori.DefaultsTest"];
    
    NSLog(@"%s %@",__FUNCTION__,[dic description]);
    
    NSMutableDictionary   *aDict = [[defaults persistentDomainForName:@"com.oomori.DefaultsTest"] mutableCopy];
    
    [aDict setValue:@"value2" forKey:@"key2"];
    
    [defaults setPersistentDomain:aDict forName:@"com.oomori.DefaultsTest"];
    
    NSLog(@"%s %@",__FUNCTION__,[defaults persistentDomainNames]);
    
    NSLog(@"%s %@",__FUNCTION__,[defaults volatileDomainNames]);
    
    
    
    NSArray *array = [NSArray arrayWithObjects:@"aaa",@"bbb",[NSNumber numberWithInt:3], nil ];
    [defaults setObject:array forKey:@"arrayKey"];
    NSArray *bArray = [defaults arrayForKey:@"arrayKey"];
    NSLog(@"%s %@",__FUNCTION__,bArray);
    //=>(aaa,bbb,3)
    
    [defaults addSuiteNamed:@"Suite name"];
    
    NSArray *cArray = [defaults arrayForKey:@"arrayKey"];
    NSLog(@"%s %@",__FUNCTION__,cArray);
    //=>(null)
    
}
+ (void)initialize{
 
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 NSDictionary *appDefaults = [NSDictionary
                              dictionaryWithObject:@"default value" forKey:@"KEY0"];
 
 [defaults registerDefaults:appDefaults];
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
