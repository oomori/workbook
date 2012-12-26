//
//  OOOAppDelegate.h
//  NSNetService
//
//  Created by 大森 智史 on 2012/09/10.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "TCPServer.h"
//#import "Picker.h"

@interface OOOAppDelegate : UIResponder <UIApplicationDelegate,NSNetServiceDelegate,NSNetServiceBrowserDelegate>
{
    UIWindow			*_window;
	//Picker				*_picker;
	//TCPServer			*_server;
	NSInputStream		*_inStream;
	NSOutputStream		*_outStream;
	BOOL				_inReady;
	BOOL				_outReady;
    
    NSNetService *_netService;
    NSNetServiceBrowser *_netServiceBrowser;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSNetService *netService;
@property (strong, nonatomic) NSNetServiceBrowser *netServiceBrowser;


@end
