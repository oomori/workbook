//
//  OOOAppDelegate.m
//  NSArray
//
//  Created by 大森 智史 on 12/04/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark UTF8String

-(void)method001
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:@"aaa",@"bbb",@"ccc",nil];
    
    NSLog(@"001 %@",[anArray description]);
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self method001];
}

@end
