//
//  OOOViewController.m
//  NSCharacterSet
//
//  Created by 大森 智史 on 12/05/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

@synthesize textView;

#pragma mark alphanumericCharacterSet:
-(void)method001
{
    
    
    NSString *scanString;
    NSString *sepaString;
    
    NSString *string = @"12=3  ,abc , def,ghi,jkl,mno";
    
    NSCharacterSet *chSet = [NSCharacterSet alphanumericCharacterSet];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    
    [scanner setCharactersToBeSkipped:[NSCharacterSet whitespaceCharacterSet] ];
    while(![scanner isAtEnd]) {
        if([scanner scanUpToCharactersFromSet:chSet intoString:&scanString]) {
            NSLog(@"-%@-",scanString);
        }
        [scanner scanCharactersFromSet:chSet intoString:&sepaString];
        //NSLog(@"%@ <0x%08x>",sepaString,(NSUInteger)sepaString);
    }

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self method001];
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

@end
