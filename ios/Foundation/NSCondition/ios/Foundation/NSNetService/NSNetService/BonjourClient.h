
#import <Foundation/Foundation.h>
#import <netinet/in.h>
#import <sys/socket.h>

@interface BonjourClient : NSObject <NSNetServiceDelegate,NSNetServiceBrowserDelegate,NSStreamDelegate> {
    NSMutableArray *services;
    NSNetServiceBrowser *serviceBrowser;
    NSNetService *service;
      
    BOOL searching;
    
    NSInputStream		*_inStream;
	NSOutputStream		*_outStream;
	BOOL				inReady;
	BOOL				outReady;
    
    NSMutableData * dataBuffer;
}

-(void)openStreams;

@end
