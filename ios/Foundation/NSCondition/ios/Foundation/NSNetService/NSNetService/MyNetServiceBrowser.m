//
//  MyNetServiceBrowser.m
//  NSNetService
//
//  Created by 大森 智史 on 2012/09/10.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "MyNetServiceBrowser.h"

@implementation MyNetServiceBrowser

-(void)netServiceBrowser:(NSNetServiceBrowser *) didNotSearch:(NSDictionary *)errorDict
{
    NSLog(@"!!!");
}

-(void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser
           didFindDomain:(NSString *)domainString
              moreComing:(BOOL)moreComing
{
    NSLog(@"%@",domainString);
}

-(void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser
          didFindService:(NSNetService *)aNetService
              moreComing:(BOOL)moreComing

{
    NSLog(@"!!!");
}

@end
