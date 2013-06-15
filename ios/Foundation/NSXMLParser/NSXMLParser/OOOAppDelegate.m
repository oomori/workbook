//
//  OOOAppDelegate.m
//  NSXMLParser
//
//  Created by 大森 智史 on 2012/09/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"
#import "MyXMLParser.h"
#import "ITunesXMLParser.h"

#import "NSStream+WithoutNSHost.h"

@implementation OOOAppDelegate

@synthesize inputStream;
@synthesize outputStream;


#pragma mark 
-(void)method001
{
    NSString *thePath = [[NSBundle mainBundle] pathForResource : @"test2" ofType:@"xml"];
    NSData *aData = [ NSData dataWithContentsOfFile : thePath ] ;
    MyXMLParser   *parser = [ [ MyXMLParser alloc ] initWithData: aData  ];
    
    BOOL        result = NO;
    if ( parser ) {
        //
        [ parser setShouldProcessNamespaces:YES ];
        [ parser setShouldReportNamespacePrefixes:YES ];
        [ parser setShouldResolveExternalEntities:YES ];
        ([parser  shouldProcessNamespaces]) ? NSLog(@"shouldProcessNamespaces YES") : NSLog(@" NO") ;
        ([parser  shouldReportNamespacePrefixes]) ? NSLog(@"shouldReportNamespacePrefixes YES") : NSLog(@" NO") ;
        ([parser  shouldResolveExternalEntities]) ? NSLog(@"shouldResolveExternalEntities YES") : NSLog(@" NO") ;
        
        result = [ parser parse ];
        NSLog( @"columnNumber = %d", [ parser columnNumber ] );
        NSLog( @"lineNumber : %d", [ parser lineNumber ] );
        NSLog( @"publicID : %@", [ parser publicID ] );
        NSLog( @"systemID : %@", [ parser systemID ] );
        
        
        NSLog( @"result = %d", result );
        
        //
        if ( result == NO ) {
            //
            NSError     *theErr = [ parser parserError ];
            if ( [ theErr code ] != 0 ) {
                NSLog(@"%@",[ theErr localizedDescription ] );
            }
        } else {
  
            NSMutableString *str = [ NSMutableString string ];
           
            NSArray		*items = [ parser newsItems ];
            int		i = 0, cnt = [ items count ];
            
            for ( i = 0; i < cnt; i++ ) {
                NSDictionary    *itemDict = items[i];
                id		    itemElem;
                itemElem = itemDict[@"title"];
                if ( itemElem ) {
                    [ str appendString: itemElem ];
                    [ str appendString: @"\r" ];
                }
                itemElem = itemDict[@"link"];
                if ( itemElem ) {
                    [ str appendString: itemElem ];
                    [ str appendString: @"\r" ];
                }
                itemElem = itemDict[@"description"];
                if ( itemElem ) {
                    [ str appendString: itemElem ];
                    [ str appendString: @"\r" ];
                }
                [ str appendString: @"\r" ];
            }
            
            NSLog(@"----- %@",str);
            
        }
    }

}
#pragma mark initWithContentsOfURL
-(void)method002
{
    NSURL *aURL = [NSURL URLWithString:@"http://itunes.apple.com/jp/rss/topalbums/limit=10/explicit=true/xml"];
    ITunesXMLParser   *parser = [ [ ITunesXMLParser alloc ] initWithContentsOfURL:aURL];
    
    BOOL        result = NO;
    if ( parser ) {
        //
        [ parser setShouldProcessNamespaces:YES ];
        [ parser setShouldReportNamespacePrefixes:YES ];
        [ parser setShouldResolveExternalEntities:YES ];
        ([parser  shouldProcessNamespaces]) ? NSLog(@"shouldProcessNamespaces YES") : NSLog(@" NO") ;
        ([parser  shouldReportNamespacePrefixes]) ? NSLog(@"shouldReportNamespacePrefixes YES") : NSLog(@" NO") ;
        ([parser  shouldResolveExternalEntities]) ? NSLog(@"shouldResolveExternalEntities YES") : NSLog(@" NO") ;
        
        result = [ parser parse ];

        NSLog( @"columnNumber = %d", [ parser columnNumber ] );
        NSLog( @"lineNumber : %d", [ parser lineNumber ] );
        NSLog( @"publicID : %@", [ parser publicID ] );
        NSLog( @"systemID : %@", [ parser systemID ] );
        
        
        NSLog( @"result = %d", result );
        
        if ( result == NO ) {
            NSError     *theErr = [ parser parserError ];
            if ( [ theErr code ] != 0 ) {
                NSLog(@"%@",[ theErr localizedDescription ] );
            }
        } else {

            NSMutableString *str = [ NSMutableString string ];
      
            NSArray		*items = [ parser newsItems ];
            int		i = 0, cnt = [ items count ];
            NSLog(@"--------- %d",cnt);
            
            for ( i = 0; i < cnt; i++ ) {
                
                NSDictionary    *itemDict = items[i];
                id		    itemElem;
                NSLog(@"!--------- %@",
                      itemDict[@"elementName"]);
                
                 itemElem = itemDict[@"elementName"];
                if ( [ itemElem isEqual:@"title" ] ) {
                    
                    NSString *retString = [itemDict[@"contents"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    
                    NSLog(@"---------- %@",retString);
                    [ str appendString: retString ];
                    [ str appendString: @"\r" ];
                }

            }
            
            NSLog(@"----- %@",str);
            
        }

    }
}

#pragma mark
//テスト中
-(void)method003
{
    NSUInteger portNo = 80;
    CFStringRef hostName = CFSTR("http://itunes.apple.com/jp/rss/topalbums/limit=10/explicit=true/xml");
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    CFStreamCreatePairWithSocketToHost(NULL, hostName, portNo, &readStream, &writeStream);
    
    assert(CFGetRetainCount(readStream) == 1L);
    assert(CFGetRetainCount(writeStream) == 1L);
    
    self.inputStream = (__bridge_transfer NSInputStream*) readStream;
    self.outputStream = (__bridge_transfer NSOutputStream*) writeStream;
    
    [inputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream setDelegate:self];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];
    
    const char *request = "GET / HTTP/1.0\r\n\r\n";
    
    [outputStream write:(const uint8_t*)request maxLength:strlen(request)];

    
    
    
    MyXMLParser   *parser = [ [ MyXMLParser alloc ] initWithStream:inputStream];
    
    BOOL        result = NO;
    if ( parser ) {
        //
        [ parser setShouldProcessNamespaces:YES ];
        [ parser setShouldReportNamespacePrefixes:YES ];
        [ parser setShouldResolveExternalEntities:YES ];
        ([parser  shouldProcessNamespaces]) ? NSLog(@"shouldProcessNamespaces YES") : NSLog(@" NO") ;
        ([parser  shouldReportNamespacePrefixes]) ? NSLog(@"shouldReportNamespacePrefixes YES") : NSLog(@" NO") ;
        ([parser  shouldResolveExternalEntities]) ? NSLog(@"shouldResolveExternalEntities YES") : NSLog(@" NO") ;
        
        result = [ parser parse ];
        NSLog( @"columnNumber = %d", [ parser columnNumber ] );
        NSLog( @"lineNumber : %d", [ parser lineNumber ] );
        NSLog( @"publicID : %@", [ parser publicID ] );
        NSLog( @"systemID : %@", [ parser systemID ] );
        
        
        NSLog( @"result = %d", result );
        
        if ( result == NO ) {
            NSError     *theErr = [ parser parserError ];
            if ( [ theErr code ] != 0 ) {
                NSLog(@"%@",[ theErr localizedDescription ] );
            }
        } else {
            
            NSMutableString *str = [ NSMutableString string ];
            NSArray		*items = [ parser newsItems ];
            int		i = 0, cnt = [ items count ];
            
            for ( i = 0; i < cnt; i++ ) {
                
                NSDictionary    *itemDict = items[i];
                id		    itemElem;
                itemElem = itemDict[@"title"];
                if ( itemElem ) {
                    [ str appendString: itemElem ];
                    [ str appendString: @"\r" ];
                }
                itemElem = itemDict[@"link"];
                if ( itemElem ) {
                    [ str appendString: itemElem ];
                    [ str appendString: @"\r" ];
                }
                itemElem = itemDict[@"description"];
                if ( itemElem ) {
                    [ str appendString: itemElem ];
                    [ str appendString: @"\r" ];
                }
                [ str appendString: @"\r" ];
            }
            
            NSLog(@"----- %@",str);
            
        }
        
    }
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    //[self method003];

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
#pragma mark -
#pragma mark == Delegate ==
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog( @"parserDidStartDocument" );

	
    NSLog( @"columnNumber : %d", [ parser columnNumber ] );
    NSLog( @"lineNumber : %d", [ parser lineNumber ] );
    
}

//
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog( @"parserDidEndDocument" );

}

//
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName //ÉGÉåÉÅÉìÉgñº
  namespaceURI:(NSString *)namespaceURI //ñºëOãÛä‘
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict
{
    NSLog( @"didStartElement : %@, %@, %@, %@", elementName, namespaceURI, qName, [ attributeDict description ] );
    
    
    
    
}
//
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    

    NSLog( @"didEndElement : %@, %@, %@", elementName, namespaceURI, qName );
    
}

//
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //NSLog( @"foundCharacters : %@", string );

}

//
-(void)parser:(NSXMLParser *)parser didEndMappingPrefix:(NSString *)prefix
{
    NSLog( @"didEndMappingPrefix : %@", prefix );
}

//
-(void)parser:(NSXMLParser *)parser didStartMappingPrefix:(NSString *)prefix toURI:(NSString *)namespaceURI
{
    NSLog( @"didEndMappingPrefix : %@ %@ ", prefix , namespaceURI );
}

//
-(void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue
{
    NSLog( @"foundAttributeDeclarationWithName : %@ %@ ", attributeName , elementName );
}

//
-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    NSLog( @"foundCDATA : %@  ", [CDATABlock description] );
}
-(void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName model:(NSString *)model
{
    NSLog( @"foundElementDeclarationWithName : %@ %@ ", elementName , model );
}

//
-(void)parser:(NSXMLParser *)parser foundExternalEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
{
    NSLog( @"foundExternalEntityDeclarationWithName : %@ %@ %@", name , publicID ,  systemID);
}

-(void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString
{
    NSLog( @"foundIgnorableWhitespace : %@ ", whitespaceString);
}


//
-(void)parser:(NSXMLParser *)parser foundInternalEntityDeclarationWithName:(NSString *)name value:(NSString *)value
{
    NSLog( @"foundInternalEntityDeclarationWithName : %@ %@", name , value);
}

//
-(void)parser:(NSXMLParser *)parser foundNotationDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
{
    NSLog( @"foundNotationDeclarationWithName : %@ %@ %@", name , publicID ,  systemID);
}

//
-(void)parser:(NSXMLParser *)parser foundProcessingInstructionWithTarget:(NSString *)name data:(NSString *)data
{
    NSLog( @"foundProcessingInstructionWithTarget : %@ %@", name , data);
}

//
-(void)parser:(NSXMLParser *)parser foundUnparsedEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID notationName:(NSString *)notationName
{
    NSLog( @"foundUnparsedEntityDeclarationWithName : %@ %@ %@ %@", name , publicID ,  systemID,notationName);
}

//ÉRÉÅÉìÉgÇî≠å©
- (void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment
{
    NSLog( @"foundComment : %@  ", comment );
    //[parser abortParsing];
}
//
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError*)parseError
{
    NSLog( @"parseErrorOccurred : %@  ", [parseError description] );
    
}
//
-(NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID
{
    NSLog( @"resolveExternalEntityName : %@ %@", name , systemID);
    return nil;
}





- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
    
    switch (eventCode) {
        case NSStreamEventHasBytesAvailable: {
            
            unsigned char buf[1024];
            //NSUInteger len = [(NSInputStream*)aStream read:buf maxLength:1024];
            NSString *str = [[NSString alloc] initWithBytes:buf length:1024 encoding:NSUTF8StringEncoding];
            NSLog(@"%@", str);
        }
            break;
            
        default:
            break;
    }
}
@end
