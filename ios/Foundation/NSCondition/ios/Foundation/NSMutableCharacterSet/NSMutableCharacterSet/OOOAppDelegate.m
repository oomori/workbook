//
//  OOOAppDelegate.m
//  NSMutableCharacterSet
//
//  Created by 大森 智史 on 2012/08/14.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate
#pragma mark NSMutableCharacterSet addCharactersInRange:
-(void)method001
{
    NSString *scanString;
    NSString *sepaString;
    
    NSString *string = @"12=3  ,abc , def,ghi,jkl,mno";
    
    NSMutableCharacterSet *chSet = [NSMutableCharacterSet alphanumericCharacterSet];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    
    [scanner setCharactersToBeSkipped:[NSCharacterSet whitespaceCharacterSet] ];
    NSCharacterSet *newCharacterSet1 = [chSet copy];
    while(![scanner isAtEnd]) {
        if([scanner scanUpToCharactersFromSet:chSet intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'=',scanString);
        }
        [scanner scanCharactersFromSet:newCharacterSet1 intoString:&sepaString];
    }
    [chSet addCharactersInRange:NSMakeRange(0x3D, 1)];
     NSLog(@"%s -add characterset -",__FUNCTION__);
    NSScanner *scanner2 = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet2 = [chSet copy];
    while(![scanner2 isAtEnd]) {
        if([scanner2 scanUpToCharactersFromSet:newCharacterSet2 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'=',scanString);
        }
        [scanner2 scanCharactersFromSet:newCharacterSet2 intoString:&sepaString];
    }
    
}
#pragma mark NSMutableCharacterSet alphanumericCharacterSet:
-(void)method002
{
    NSString *scanString;
    NSString *sepaString;
    
    NSString *string = @"12=3  ,abc , def,ghi,jkl,mno";
    
    NSMutableCharacterSet *chSet = [NSMutableCharacterSet alphanumericCharacterSet];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet1 = [chSet copy];
    [scanner setCharactersToBeSkipped:[NSCharacterSet whitespaceCharacterSet] ];
    while(![scanner isAtEnd]) {
        if([scanner scanUpToCharactersFromSet:newCharacterSet1 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'=',scanString);
        }
        [scanner scanCharactersFromSet:newCharacterSet1 intoString:&sepaString];
    }
    [chSet removeCharactersInRange:NSMakeRange(0x30, 10)];
    NSLog(@"%s -remove characterset -",__FUNCTION__);
    NSScanner *scanner2 = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet2 = [chSet copy];
    while(![scanner2 isAtEnd]) {
        if([scanner2 scanUpToCharactersFromSet:newCharacterSet2 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'9',scanString);
        }
        [scanner2 scanCharactersFromSet:newCharacterSet2 intoString:&sepaString];
    }
    
}
#pragma mark NSMutableCharacterSet addCharactersInString:
-(void)method003
{
    NSString *scanString;
    NSString *sepaString;
    
    NSString *string = @"12=3  ,abc , def,ghi,jkl,mno";
    
    NSMutableCharacterSet *chSet = [NSMutableCharacterSet alphanumericCharacterSet];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet1 = [chSet copy];
    [scanner setCharactersToBeSkipped:[NSCharacterSet whitespaceCharacterSet] ];
    while(![scanner isAtEnd]) {
        if([scanner scanUpToCharactersFromSet:newCharacterSet1 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'=',scanString);
        }
        [scanner scanCharactersFromSet:newCharacterSet1 intoString:&sepaString];
    }
    [chSet addCharactersInString:@"="];
    NSLog(@"%s -add characterset -",__FUNCTION__);
    NSScanner *scanner2 = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet2 = [chSet copy];
    while(![scanner2 isAtEnd]) {
        if([scanner2 scanUpToCharactersFromSet:newCharacterSet2 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'=',scanString);
        }
        [scanner2 scanCharactersFromSet:newCharacterSet2 intoString:&sepaString];
    }
    
}
#pragma mark NSMutableCharacterSet removeCharactersInString:
-(void)method004
{
    NSString *scanString;
    NSString *sepaString;
    
    NSString *string = @"12=3  ,9abc , def,ghi,jkl,mno";
    
    NSMutableCharacterSet *chSet = [NSMutableCharacterSet alphanumericCharacterSet];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet1 = [chSet copy];
    [scanner setCharactersToBeSkipped:[NSCharacterSet whitespaceCharacterSet] ];
    while(![scanner isAtEnd]) {
        if([scanner scanUpToCharactersFromSet:newCharacterSet1 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
        }
        [scanner scanCharactersFromSet:newCharacterSet1 intoString:&sepaString];
    }
    
    for (int i = 0x30; i <= 0x39; i++) {
        UTF32Char currentChar = (UTF32Char)i;
        NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
        [chSet removeCharactersInString:str];
        }
    NSLog(@"%s -remove characterset -",__FUNCTION__);
    NSScanner *scanner2 = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet2 = [chSet copy];
    while(![scanner2 isAtEnd]) {
        if([scanner2 scanUpToCharactersFromSet:newCharacterSet2 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
        }
        [scanner2 scanCharactersFromSet:newCharacterSet2 intoString:&sepaString];
    }
    
}

#pragma mark NSMutableCharacterSet formIntersectionWithCharacterSet:
-(void)method005
{
    NSString *scanString;
    NSString *sepaString;
    
    NSString *string = @"12=3  ,9abc , def,ghi,jkl,mno";
    
    NSMutableCharacterSet *chSet = [NSMutableCharacterSet alphanumericCharacterSet];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet1 = [chSet copy];
    [scanner setCharactersToBeSkipped:[NSCharacterSet whitespaceCharacterSet] ];
    while(![scanner isAtEnd]) {
        if([scanner scanUpToCharactersFromSet:newCharacterSet1 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
        }
        [scanner scanCharactersFromSet:newCharacterSet1 intoString:&sepaString];
    }
    
    [chSet formIntersectionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    
    
    NSLog(@"%s -formIntersectionWithCharacterSet -",__FUNCTION__);
    NSScanner *scanner2 = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet2 = [chSet copy];
    while(![scanner2 isAtEnd]) {
        if([scanner2 scanUpToCharactersFromSet:newCharacterSet2 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
        }
        [scanner2 scanCharactersFromSet:newCharacterSet2 intoString:&sepaString];
    }
    
}

#pragma mark NSMutableCharacterSet formUnionWithCharacterSet:
-(void)method006
{
    NSString *scanString;
    NSString *sepaString;
    
    NSString *string = @"12=3  ,9AbC , dEF,ghi,jKl,MNO";
    
    NSMutableCharacterSet *chSet = [NSMutableCharacterSet lowercaseLetterCharacterSet];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet1 = [chSet copy];
    [scanner setCharactersToBeSkipped:[NSCharacterSet whitespaceCharacterSet] ];
    while(![scanner isAtEnd]) {
        if([scanner scanUpToCharactersFromSet:newCharacterSet1 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'=',scanString);
        }
        [scanner scanCharactersFromSet:newCharacterSet1 intoString:&sepaString];
    }
    
    [chSet formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    
    
    NSLog(@"%s -formUnionWithCharacterSet -",__FUNCTION__);
    NSScanner *scanner2 = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet2 = [chSet copy];
    while(![scanner2 isAtEnd]) {
        if([scanner2 scanUpToCharactersFromSet:newCharacterSet2 intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'9',scanString);
        }
        [scanner2 scanCharactersFromSet:newCharacterSet2 intoString:&sepaString];
    }
    
}
#pragma mark NSMutableCharacterSet invert:
-(void)method007
{
    NSString *scanString;
    NSString *sepaString;
    
    NSString *string = @"12=3  ,9AbC , dEF,ghi,jKl,MNO";
    
    NSMutableCharacterSet *chSet = [NSMutableCharacterSet lowercaseLetterCharacterSet];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet1 = [chSet copy];
    [scanner setCharactersToBeSkipped:[NSCharacterSet whitespaceCharacterSet] ];
    while(![scanner isAtEnd]) {
        if([scanner scanUpToCharactersFromSet:chSet intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'=',scanString);
        }
        [scanner scanCharactersFromSet:newCharacterSet1 intoString:&sepaString];
    }
    
    [chSet formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    [chSet invert];
    
    NSLog(@"%s -formUnionWithCharacterSet invert -",__FUNCTION__);
    NSScanner *scanner2 = [NSScanner scannerWithString:string];
    NSCharacterSet *newCharacterSet2 = [chSet copy];
    while(![scanner2 isAtEnd]) {
        if([scanner2 scanUpToCharactersFromSet:chSet intoString:&scanString]) {
            NSLog(@"%s -%@-",__FUNCTION__,scanString);
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,(UTF32Char)'9',scanString);
        }
        [scanner2 scanCharactersFromSet:newCharacterSet2 intoString:&sepaString];
    }
    
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
