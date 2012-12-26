//
//  OOOViewController.m
//  NSFileWrapper
//
//  Created by 大森 智史 on 2012/09/23.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController
@synthesize method002;

#pragma mark NSFileWrapper initDirectoryWithFileWrappers:
- (IBAction)method001:(id)sender {
    //ファイルラッパー
    NSFileWrapper *theWrapper = [[NSFileWrapper alloc] initDirectoryWithFileWrappers:nil];
    
    [theWrapper setPreferredFilename:@"name1"];
    NSLog(@"%@",[[theWrapper fileWrappers] description]);
}


#pragma mark NSFileWrapper initRegularFileWithContents:
- (IBAction)method002:(id)sender {
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    NSError *error = nil;
    NSFileWrapper *theWrapper = [[NSFileWrapper alloc] initWithURL:url
                                                                options:NSFileWrapperReadingWithoutMapping
                                                                  error:&error];
   
    
    NSLog(@"%@,%@",[theWrapper preferredFilename],[theWrapper filename]);
    [theWrapper setFilename:@"newname.plist"];
    NSLog(@"%@,%@",[theWrapper preferredFilename],[theWrapper filename]);
    [theWrapper setFilename:@"3rdname.plist"];
    NSLog(@"%@,%@",[theWrapper preferredFilename],[theWrapper filename]);
    
    NSLog(@"%@",[theWrapper fileAttributes]);
    
    NSLog(@"%@",[theWrapper regularFileContents]);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMethod002:nil];
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


@end
