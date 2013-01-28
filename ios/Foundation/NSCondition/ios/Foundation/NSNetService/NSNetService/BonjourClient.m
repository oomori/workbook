
#import "BonjourClient.h"
#include <arpa/inet.h>

@implementation BonjourClient

-(void)openStreams {
	_inStream.delegate = self;
	[_inStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[_inStream open];
	_outStream.delegate = self;
	[_outStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[_outStream open];
}

-(id)init {
    service = [[NSNetService alloc] initWithDomain:@"local." type:@"_ipp._tcp." name:@"haurus"];
    [service setDelegate:self];
    [service resolveWithTimeout:5.0];
    return self;
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)streamEvent {
    NSLog(@"handleEvent: %d",streamEvent);
    NSInputStream * istream;
    switch(streamEvent) {
        case NSStreamEventHasBytesAvailable:;
            NSLog(@"NSStreamEventHasBytesAvailable");
            uint8_t oneByte;
            int actuallyRead = 0;
            istream = (NSInputStream *)stream;
            if (!dataBuffer) {
                dataBuffer = [[NSMutableData alloc] initWithCapacity:2048];
            }
            actuallyRead = [istream read:&oneByte maxLength:1];
            if (actuallyRead == 1) {
                [dataBuffer appendBytes:&oneByte length:1];
            }
            if (oneByte == '\n') {
                // We've got the carriage return at the end of the echo. Let's set the string.
                NSString * string = [[NSString alloc] initWithData:dataBuffer encoding:NSUTF8StringEncoding];
                NSLog(@"%@",string);
                dataBuffer = nil;
            }
            break;
        case NSStreamEventEndEncountered:
            NSLog(@"NSStreamEventEndEncountered");
            //[self closeStreams];
            break;
        case NSStreamEventHasSpaceAvailable:
            NSLog(@"NSStreamEventHasSpaceAvailable");
            break;
        case NSStreamEventErrorOccurred:
            NSLog(@"NSStreamEventErrorOccurred");
            break;
        case NSStreamEventOpenCompleted:
            NSLog(@"NSStreamEventOpenCompleted");
            break;
        case NSStreamEventNone:
            NSLog(@"NSStreamEventNone");
        default:
            break;
    }
}

#pragma mark - NSNetServiceDelegate Methods

- (void)netServiceWillResolve:(NSNetService *)sender {
    NSLog(@"netServiceWillResolve");
    
    serviceBrowser = [[NSNetServiceBrowser alloc] init];
	if(!serviceBrowser) {
        NSLog(@"The NSNetServiceBrowser couldn't be allocated and initialized.");
	}
	serviceBrowser.delegate = self;
	//[serviceBrowser searchForServicesOfType:@"_ipp._tcp." inDomain:@"local."];
    [serviceBrowser searchForServicesOfType:@"_http._tcp." inDomain:@"local."];
}

- (void)netServiceWillPublish:(NSNetService *)netService
{
    NSLog(@"netServiceWillPublish");
    [services addObject:netService];
}

- (void)netServiceDidPublish:(NSNetService *)sender {
    NSLog(@"netServiceDidPublish");
}

- (void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict {
    NSLog(@"didNotPublish");
}

- (void)netServiceDidResolveAddress:(NSNetService *)netService {
    NSLog(@"netServiceDidResolveAddress");
    NSString *name = nil;
    NSData *address = nil;
    struct sockaddr_in *socketAddress = nil;
    NSString *ipString = nil;
    int port;
    name = [netService name];
    address = [[netService addresses] objectAtIndex: 0];
    socketAddress = (struct sockaddr_in *) [address bytes];
    ipString = [NSString stringWithFormat: @"%s",inet_ntoa(socketAddress->sin_addr)];
    port = socketAddress->sin_port;
    // This will print the IP and port for you to connect to.
    NSLog(@"%@", [NSString stringWithFormat:@"Resolved:%@-->%@:%u\n", [service hostName], ipString, port]);
    [self openStreams];
}

- (void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict {
    NSLog(@"didNotResolve: %@",errorDict);
}

- (void)netService:(NSNetService *)sender didUpdateTXTRecordData:(NSData *)data {
    NSLog(@"didUpdateTXTRecordData");
}

- (void)netServiceDidStop:(NSNetService *)netService {
    NSLog(@"netServiceDidStop");
    [services removeObject:netService];
}

#pragma mark - NSNetServiceBrowserDelegate Methods

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindDomain:(NSString *)domainName moreComing:(BOOL)moreDomainsComing {
    NSLog(@"didFindDomain");
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didRemoveDomain:(NSString *)domainName moreComing:(BOOL)moreDomainsComing {
    NSLog(@"didRemoveDomain");
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing {
    NSLog(@"didFindService: %@  lenght:%d %@",netService.name,[netService.name length],[[netService addresses] description]);
    if ([@"Canon MG3100 series" isEqualToString:netService.name]) {
        NSLog(@"didFindService: %@",netService.addresses);
        NSInputStream		*inStream;
        NSOutputStream		*outStream;
        if (![netService getInputStream:&inStream outputStream:&outStream]) {
            NSLog(@"Failed connecting to server");
            return;
        }
        _inStream=inStream;
        _outStream=outStream;
    }
    
    
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didRemoveService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing {
    NSLog(@"didRemoveService");
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didNotSearch:(NSDictionary *)errorInfo {
    NSLog(@"didNotSearch");
}

- (void)netServiceBrowserWillSearch:(NSNetServiceBrowser *)netServiceBrowser {
    NSLog(@"netServiceBrowserWillSearch");
}

- (void)netServiceBrowserDidStopSearch:(NSNetServiceBrowser *)netServiceBrowser {
    NSLog(@"netServiceBrowserDidStopSearch");
}

@end
