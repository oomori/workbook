//
//  main.m
//  NSException
//
//  Created by 大森 智史 on 2012/09/17.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OOOAppDelegate.h"

int main(int argc, char *argv[])
{    
    @try {
        @autoreleasepool {
                return UIApplicationMain(argc, argv, nil, NSStringFromClass([OOOAppDelegate class]));
            
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%s %@", __FUNCTION__, exception);
        NSLog(@"%s %@", __FUNCTION__, [exception callStackReturnAddresses]);
        NSLog(@"%s %@", __FUNCTION__, [exception callStackSymbols]);
        
    }
    @finally {
        NSLog(@"main  finally");
    }
}
