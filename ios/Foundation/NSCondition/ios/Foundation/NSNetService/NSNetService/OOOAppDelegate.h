//
//  OOOAppDelegate.h
//  NSNetService
//
//  Created by 大森 智史 on 2012/09/10.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <netinet/in.h>
#import <sys/socket.h>

//#import "TCPServer.h"
//#import "Picker.h"

@interface OOOAppDelegate : UIResponder <UIApplicationDelegate,NSNetServiceDelegate,NSNetServiceBrowserDelegate,NSStreamDelegate>
{
    UIWindow			*_window;
	//Picker				*_picker;
	//TCPServer			*_server;
	NSInputStream		*_inStream;
	NSOutputStream		*_outStream;
	BOOL				_inReady;
	BOOL				_outReady;
    
    NSMutableArray *services;
    //NSNetService *_netService;
    NSNetServiceBrowser *_netServiceBrowser;
    
    NSNetService *_service;
    
    BOOL searching;
    
    
    NSMutableData * dataBuffer;




}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSNetService *netService;
@property (strong, nonatomic) NSNetServiceBrowser *netServiceBrowser;


-(void)openStreams;

@end
