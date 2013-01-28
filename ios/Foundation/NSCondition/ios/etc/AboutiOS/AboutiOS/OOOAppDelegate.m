//
//  OOOAppDelegate.m
//  AboutiOS
//
//  Created by 大森 智史 on 2012/11/18.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate


#pragma mark iOS NSString pathComponents

-(void)method001
{
    int countNumber = 0;
    _aNumber = 10;
    NSLog(@"%d",_aNumber);
    
    NSString *aString = [[NSString alloc] initWithString:@"the string"];
    
    int intNumber = 3;
    float floatNumber = 0.5;
    float resultNumber;
    
    resultNumber =    intNumber * floatNumber ;
    
    NSLog(@"%d",(int)resultNumber);
    
    /*
    NSArray *anArray = [NSArray arrayWithObjects:[NSNumber numberWithInteger:3],@"intValue",[NSNumber numberWithFloat:4.5],@"floatValue", nil];
*/
    NSArray *anArray = @[@3,@4.1f];
     NSLog(@"%@",anArray);
    
    
    //int intNumber = 3;
    //float floatNumber = 0.5;
    NSString *str1 = [[NSString alloc] initWithFormat:@"int%d",10];
    NSLog(@"%d,%d,%d,%d",intNumber,++intNumber, intNumber++,intNumber);

    int counter = 1;
    if (counter > 0) {
        NSLog(@"カウンターは0より大きいです。");
    }else{
        NSLog(@"カウンターは0です。");
    }

    int i = 5;
    while (--i>0) {
        NSLog(@"i = %d",i);
        
    }
    
    int u = 5;
    do {
        NSLog(@"u = %d",u);
    } while (--u>0);
    
    
    int uu = 5;
    do {
        if (uu % 2 !=0) continue;
        NSLog(@"uu = %d",uu);
    } while (--uu>0);
    
    for (int ii = 0; ii < 5 ; ii++) {
        NSLog(@"ii = %d",ii);
    }
    
    NSArray *bArray = @[@"aaa",@"bbb",@"ccc"];
    for (id obj in bArray) {
        NSLog(@"%@",obj);
    }
    
    for (int uu1 = 1; uu1 < 10 ; uu1++) {
        for (int uu2 = 1; uu2 < 10 ; uu2++) {
            NSLog(@"%d × %d = %d",uu1,uu2,uu1 * uu2);
        }
    }
    
    int cNumber = 4;
    
    NSLog(@"!!! %f",(float)cNumber);
    
    NSStringEncoding encoding = NSASCIIStringEncoding;
    switch (encoding) {
        case NSASCIIStringEncoding:
            NSLog(@"NSASCIIStringEncoding");
            break;
        case NSJapaneseEUCStringEncoding:
            NSLog(@"NSJapaneseEUCStringEncoding");
            break;
        case NSUTF8StringEncoding:
            NSLog(@"NSUTF8StringEncoding");
            break;
        default:
            NSLog(@"default");
    }
    
    
   
    
    #pragma mark-
    #pragma mark　コメント
    #pragma mark　
    
    
    //TODO:コメント
    //FIXME:コメント
    //!!!:コメント
    //???:コメント
    //MARK:コメント
    
   
    

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
