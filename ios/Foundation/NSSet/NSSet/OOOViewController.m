//
//  OOOViewController.m
//  NSSet
//
//  Created by 大森 智史 on 12/05/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"OOOViewController !!touchesBegan");
    //どの指かタッチしたら
    NSSet *aSet = [event allTouches];
    
    NSLog(@"%d",[aSet count]);
    
    [aSet enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {
         NSLog(@"%@",[obj description]);
         
     }];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"OOOViewController !!touchesMoved");
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}





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

@end
