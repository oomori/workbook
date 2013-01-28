//
//  OOOAppDelegate.m
//  NSURL
//
//  Created by 大森 智史 on 12/07/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSURL URLByStandardizingPath
- (NSData *)bookmarkFromURL:(NSURL *)url {
    NSData *bookmark = [url bookmarkDataWithOptions:NSURLBookmarkCreationMinimalBookmark
                     includingResourceValuesForKeys:NULL
                                      relativeToURL:NULL
                                              error:NULL];
    return bookmark;
}

- (NSURL *)urlFromBookmark:(NSData *)bookmark {
    NSURL *url = [NSURL URLByResolvingBookmarkData:bookmark
                                           options:NSURLBookmarkResolutionWithoutUI
                                     relativeToURL:NULL
                               bookmarkDataIsStale:NO
                                             error:NULL];
    return url;
}

-(void)method001
{
    //作成中
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:[NSArray arrayWithObjects:documentsDirectory, filename, nil]];
    
    NSString *testFileName = @"testfile.alias";
    NSURL *newURL = [NSURL fileURLWithPathComponents:[NSArray arrayWithObjects:documentsDirectory, testFileName, nil]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    NSData *bData = [self bookmarkFromURL:absoluteURL];
    NSError *anError = nil;
    
    NSLog(@"%s %@",__FUNCTION__,([NSURL writeBookmarkData:bData toURL:newURL options:NSURLBookmarkCreationMinimalBookmark error:&anError])?@"OK":@"NG");
    
    //NSLog(@"%s %@",__FUNCTION__,[bData description]);
    NSURL *cURL = [self urlFromBookmark:bData];
    NSLog(@"%s %@",__FUNCTION__,[cURL description]);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self method001];
}

@end
