//
//  OOOViewController.m
//  NSFileHandle
//
//  Created by 大森 智史 on 2012/10/21.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark NSFileHandle
- (IBAction)method000:(id)sender {
//
    NSNotificationCenter *nCenter =[NSNotificationCenter defaultCenter];
//
    [nCenter addObserver:self
            selector:@selector(notifi:)
                name:@"NSFileHandleDataAvailableNotification"
              object:nil];
//
[nCenter addObserver:self
            selector:@selector(readComplete:)
                name:@"NSFileHandleReadCompletionNotification"
              object:nil];
//
[nCenter addObserver:self
            selector:@selector(readEnd:) name:@"NSFileHandleReadToEndOfFileCompletionNotification" object:nil];
}
//
#pragma mark NSFileHandle
- (IBAction)method001:(id)sender {
    NSData *data =[@"data" dataUsingEncoding:NSASCIIStringEncoding];
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile" ofType:@"plist"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:resourcePath]) {
        
        [fileManager createFileAtPath:resourcePath
                             contents:[NSData data]
                           attributes:nil];
    }
    
    NSFileHandle *handle1 = [NSFileHandle fileHandleForUpdatingAtPath:[resourcePath stringByExpandingTildeInPath]];
    
    [handle1 waitForDataInBackgroundAndNotify];//
    [handle1 waitForDataInBackgroundAndNotifyForModes:[NSArray arrayWithObject:NSDefaultRunLoopMode]];//
    
    [handle1 writeData:data];
    
    [handle1 synchronizeFile];
    
    NSLog(@"%@",[data description]);
    NSLog(@"fileDescriptor %d",[handle1 fileDescriptor]);
    NSLog(@"seekToEndOfFile %llu",[handle1 seekToEndOfFile]);
    NSLog(@"offsetInFile %llu",[handle1 offsetInFile]);
    
    /*
     for (NSString* row in CSVArray) {
     NSData* data = [row dataUsingEncoding:NSShiftJISStringEncoding];
     [fileHandle writeData:data];
     }
     */
    [handle1 closeFile];
}

#pragma mark NSFileHandle
- (IBAction)method002:(id)sender {
    NSData *data =[@"data" dataUsingEncoding:NSASCIIStringEncoding];
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile" ofType:@"plist"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:resourcePath]) {
        
        [fileManager createFileAtPath:resourcePath
                             contents:[NSData data]
                           attributes:nil];
    }
    NSError *anError= nil;
    NSURL *url = [NSURL fileURLWithPath:[resourcePath stringByExpandingTildeInPath]];
    NSFileHandle *handle1 = [NSFileHandle fileHandleForReadingFromURL:url error:&anError];
    
    //[handle1 waitForDataInBackgroundAndNotify];//
    //[handle1 waitForDataInBackgroundAndNotifyForModes:[NSArray arrayWithObject:NSDefaultRunLoopMode]];//
    
    //[handle1 writeData:data];
    
    //[handle1 synchronizeFile];
    
    NSLog(@"%@",[data description]);
    NSLog(@"fileDescriptor %d",[handle1 fileDescriptor]);
    NSLog(@"seekToEndOfFile %llu",[handle1 seekToEndOfFile]);
    NSLog(@"offsetInFile %llu",[handle1 offsetInFile]);

    [handle1 closeFile];

}

#pragma mark NSFileHandle
- (IBAction)method003:(id)sender {
}

#pragma mark NSFileHandle
- (IBAction)method004:(id)sender {
}

#pragma mark NSFileHandle
- (IBAction)method005:(id)sender {
}

- (void)readEnd:(NSNotification *)notification
{
    NSLog(@"readEnd");
}
- (void)readComplete:(NSNotification *)notification
{
    NSLog(@"readComplete");
}
- (void)notifi:(NSNotification *)notification
{
    NSLog(@"notifi %@",notification.name);
}
@end
