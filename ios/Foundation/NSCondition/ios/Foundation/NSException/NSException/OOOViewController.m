//
//  OOOViewController.m
//  NSException
//
//  Created by 大森 智史 on 2012/09/17.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController
@synthesize method001;
@synthesize button002;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMethod001:nil];
    [self setButton002:nil];
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

#pragma mark
- (IBAction)button001:(id)sender {

    NSException *exception = [NSException exceptionWithName:@"An Exception"
                                                     reason:@"reason"
                                                   userInfo:nil];
     
    [exception raise];
}

#pragma mark
- (IBAction)button002:(id)sender {

    [NSException raise:@"exception name" format:@"format %@",@"aaa", nil];
}

#pragma mark

va_list dynamicArgument(int arg_num , ...) {
	va_list args;
	int p , count;
	if (arg_num < 1) return nil;
	va_start(args , arg_num);
    
    printf("項目数 = %d\n" , arg_num);
	for (count = 0 ; count < arg_num ; count++) {
		p = (int)va_arg(args , int *);
		printf("第%d引数 = %d\n" , count + 2 , p);
        
	}
    
	va_end(args);
	return args;
}
- (IBAction)button003:(id)sender {
    va_list vList;
    vList = dynamicArgument(5 , 10 , 20 , 30 , 40,100);
    [NSException raise:@"errName" format:@"%d,%d,%d,%d,%d" arguments:vList];
}

@end
