//
//  OOOViewController.m
//  NSURLConnection
//
//  Created by 大森 智史 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

@synthesize receivedData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark NSURLConnection initWithRequest:delegate:
- (IBAction)button001:(id)sender {

        NSURL *theURL = [NSURL URLWithString:@"http://www.apple.com/"];
        NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
        
        NSLog(([NSURLConnection canHandleRequest:theRequest])?@"YES":@"NO");
        
        NSURLConnection *theConnection=[[NSURLConnection alloc]
                                        initWithRequest:theRequest delegate:self];
        if (theConnection) {
            NSLog(@"start loading");
            receivedData = [NSMutableData data] ;
        }
    
    NSLog(@"%s timeoutInterval: %f",__FUNCTION__ ,[theRequest timeoutInterval]);
    NSLog(@"%s mainDocumentURL: %@",__FUNCTION__ ,[theRequest mainDocumentURL]);
    NSLog(@"%s HTTPShouldUsePipelining: %@",__FUNCTION__ ,([theRequest HTTPShouldUsePipelining])?@"YES":@"NO");
    
    NSLog(@"%s allHTTPHeaderFields: %@",__FUNCTION__ ,[theRequest allHTTPHeaderFields]);

    
}

#pragma mark NSURLConnection connectionWithRequest:delegate:
- (IBAction)button002:(id)sender {

    NSURL *theURL = [NSURL URLWithString:@"http://www.apple.com/"];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
    
    NSLog(([NSURLConnection canHandleRequest:theRequest])?@"YES":@"NO");
    
    NSURLConnection *theConnection=[NSURLConnection
                                    connectionWithRequest:theRequest delegate:self];
    if (theConnection) {
        NSLog(@"start loading");
        receivedData = [NSMutableData data] ;
    }
    
    NSLog(@"%s timeoutInterval: %f",__FUNCTION__ ,[theRequest timeoutInterval]);
    NSLog(@"%s mainDocumentURL: %@",__FUNCTION__ ,[theRequest mainDocumentURL]);
    NSLog(@"%s HTTPShouldUsePipelining: %@",__FUNCTION__ ,([theRequest HTTPShouldUsePipelining])?@"YES":@"NO");
    
    NSLog(@"%s allHTTPHeaderFields: %@",__FUNCTION__ ,[theRequest allHTTPHeaderFields]);
    
}


#pragma mark NSURLConnection initWithRequest:delegate:startImmediately
- (IBAction)button003:(id)sender {

    NSURL *theURL = [NSURL URLWithString:@"http://www.apple.com/"];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
    
    NSLog(([NSURLConnection canHandleRequest:theRequest])?@"YES":@"NO");
    
    globalConnection=[[NSURLConnection alloc]
                                    initWithRequest:theRequest delegate:self startImmediately:NO];
    if (globalConnection) {
        NSLog(@"通信準備完了。ボタン004を押して下さい");
        receivedData = [NSMutableData data] ;
    }
    
}
#pragma mark NSURLConnection start
- (IBAction)button004:(id)sender {
    if (globalConnection) {
        NSLog(@"start loading");
        [globalConnection start];
    }else{
       NSLog(@"通信準備ができていません。先にボタン003を押して下さい。"); 
    }
    
    
}
#pragma mark NSURLConnection sendAsynchronousRequest:queue:completionHandler:

- (IBAction)button005:(id)sender {
    NSURL *theURL = [NSURL URLWithString:@"http://www.apple.com/"];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSLog(([NSURLConnection canHandleRequest:theRequest])?@"YES":@"NO");
    
    
    [NSURLConnection sendAsynchronousRequest:theRequest
                        queue:queue
                        completionHandler:^(NSURLResponse *r, NSData *d, NSError *e) {
                                      NSLog(@"%@", r);
                            if (!e) {
                                receivedData = [d mutableCopy] ;
                                NSLog(@"%@", [[NSString alloc]initWithData:receivedData
                                                                  encoding:NSUTF8StringEncoding]);
                                }
                            }];
}
#pragma mark NSURLConnection cancel
- (IBAction)method006:(id)sender {
    [globalConnection cancel];
}

#pragma mark NSURLConnection
- (IBAction)method007:(id)sender {
    @autoreleasepool {
        NSURL *theURL = [NSURL URLWithString:@"http://www.apple.com/"];
        NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
        
        NSLog(([NSURLConnection canHandleRequest:theRequest])?@"YES":@"NO");

        NSURLResponse* theResponse = nil;
        NSError* error = nil;
        NSData* data = [NSURLConnection
                        sendSynchronousRequest:theRequest
                        returningResponse:&theResponse
                        error:&error];
        NSString* result = [[NSString alloc]
                            initWithData:data
                            encoding:NSUTF8StringEncoding];
        NSLog(@"%@",result);
    }
}

#pragma mark NSURLConnection
- (IBAction)method008:(id)sender {
    
    NSURL *theURL = [NSURL URLWithString:@"http://www.apple.com/"];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
    
    NSLog(([NSURLConnection canHandleRequest:theRequest])?@"YES":@"NO");
    
    globalConnection=[[NSURLConnection alloc]
                      initWithRequest:theRequest delegate:self startImmediately:NO];
    if (globalConnection) {
        
        receivedData = [NSMutableData data] ;
        [globalConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        //[globalConnection unscheduleFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //[globalConnection setDelegateQueue:queue];
        
        
        [globalConnection start];
        
        NSLog(@"%s timeoutInterval: %f",__FUNCTION__ ,[theRequest timeoutInterval]);
        NSLog(@"%s mainDocumentURL: %@",__FUNCTION__ ,[theRequest mainDocumentURL]);
        NSLog(@"%s HTTPShouldUsePipelining: %@",__FUNCTION__ ,([theRequest HTTPShouldUsePipelining])?@"YES":@"NO");
        
        NSLog(@"%s allHTTPHeaderFields: %@",__FUNCTION__ ,[theRequest allHTTPHeaderFields]);
    }
     
}

#pragma mark NSURLConnection
- (IBAction)method009:(id)sender {
}

#pragma mark NSURLConnection
- (IBAction)method010:(id)sender {
}

#pragma mark
- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"didReceiveResponse");
 
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSLog(@"didReceiveData");
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError Error - %@ %@",
          [error localizedDescription],
          [error userInfo][NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoading Received %d bytes of data",[receivedData length]);
    NSLog(@"%@", [[NSString alloc]initWithData:receivedData
                                      encoding:NSUTF8StringEncoding]);
    
}

@end
