//
//  OOOViewController.m
//  NSAttributedString
//
//  Created by 大森 智史 on 12/05/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOViewController.h"
#import <CoreText/CoreText.h>
@interface OOOViewController ()

@end

@implementation OOOViewController

#pragma mark initWithString:
-(void)method001
{
    
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"string"];
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    
}

#pragma mark boldSystemFontOfSize
-(void)method002
{

    CTFontRef aFont2 = CTFontCreateWithName(CFSTR("HiraMinProN-W6"), 18, NULL);
    CGColorRef darkGrayColor = [[UIColor darkGrayColor] CGColor];
    //段落スタイル
    float_t lineHeight = 20.0;
    id paragraphStyleAttr = ((^ {
        
        CTParagraphStyleSetting paragraphStyles[] = (CTParagraphStyleSetting[]){
            (CTParagraphStyleSetting)
            { kCTParagraphStyleSpecifierLineHeightMultiple, sizeof(float_t), (float_t[]){ 0.01f } },
            (CTParagraphStyleSetting)
            { kCTParagraphStyleSpecifierMinimumLineHeight, sizeof(float_t), (float_t[]){lineHeight } },
            (CTParagraphStyleSetting)
            { kCTParagraphStyleSpecifierMaximumLineHeight, sizeof(float_t), (float_t[]){lineHeight } },
            (CTParagraphStyleSetting)
            { kCTParagraphStyleSpecifierLineSpacing, sizeof(float_t), (float_t[]){ 0.0f } },
            (CTParagraphStyleSetting)
            { kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(float_t), (float_t[]){ 0.0f } },
            (CTParagraphStyleSetting)
            { kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(float_t), (float_t[]){ 0.0f } }
            
        };
        
        CTParagraphStyleRef paragraphStyleRef = CTParagraphStyleCreate(paragraphStyles, sizeof(paragraphStyles) / sizeof(CTParagraphStyleSetting));
        return (__bridge_transfer id)paragraphStyleRef;
        
    })());
    NSDictionary *fontAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                     (__bridge id)aFont2, @"NSFont",
                                     (__bridge id)darkGrayColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                     nil];
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"string"  attributes:fontAttributes];
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    NSLog(@"%s %@",__FUNCTION__,[aString string]);
    
    
}
#pragma mark initWithString:

-(void)method003
{
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"string"];    
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
     [self method001];
    [self method002];
    //[self method003];
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
