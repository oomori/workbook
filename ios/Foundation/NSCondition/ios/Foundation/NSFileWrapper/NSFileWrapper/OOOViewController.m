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
    //ファイルラッパーの作成
    NSFileWrapper *theWrapper = [[NSFileWrapper alloc] initDirectoryWithFileWrappers:nil];
    
    [theWrapper setPreferredFilename:@"name1"];
    NSLog(@"%@",[[theWrapper fileWrappers] description]);
}


#pragma mark NSFileWrapper initRegularFileWithContents:
- (IBAction)method002:(id)sender {
    //リソースのパスを取得
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    NSLog(@"resourcePath:%@",resourcePath);
    NSError *error = nil;
    
    //ファイルラッパーを作成
    NSFileWrapper *theWrapper = [[NSFileWrapper alloc] initWithURL:url
                                                                options:NSFileWrapperReadingWithoutMapping
                                                                  error:&error];
   
    //ファイル名を変更
    NSLog(@"%@,%@",[theWrapper preferredFilename],[theWrapper filename]);
    [theWrapper setFilename:@"newname.plist"];
    NSLog(@"%@,%@",[theWrapper preferredFilename],[theWrapper filename]);
    [theWrapper setFilename:@"3rdname.plist"];
    NSLog(@"%@,%@",[theWrapper preferredFilename],[theWrapper filename]);
    
    //ファイル属性
    NSLog(@"%@",[theWrapper fileAttributes]);
    
    NSLog(@"%@",[theWrapper regularFileContents]);
    
    //ファイルラッパーはディレクトリか
    NSLog(@"%@",([theWrapper isDirectory])?@"YES":@"NO");
    
}

- (IBAction)method003:(id)sender {
    //リソースのパスを取得
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    NSLog(@"resourcePath:%@",resourcePath);
    NSError *error = nil;
    
    //ファイルラッパーを作成
    NSFileWrapper *theWrapper = [[NSFileWrapper alloc] initWithURL:url
                                                           options:NSFileWrapperReadingWithoutMapping
                                                             error:&error];
    //ファイル属性
    NSLog(@"%@",[theWrapper fileAttributes]);
    
    //ファイルラッパーは正規ファイルか
    NSLog(@"%@",([theWrapper isRegularFile])?@"YES":@"NO");
    //ファイルラッパーはディレクトリか
    NSLog(@"%@",([theWrapper isDirectory])?@"YES":@"NO");
    //ファイルラッパーはシンボリックリンクか
    NSLog(@"%@",([theWrapper isSymbolicLink])?@"YES":@"NO");
    
    //ファイルラッパが含むファイルラッパー
    for (id obj in [theWrapper fileWrappers]) {
        NSLog(@"%@",[obj class]);
    }
    
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
