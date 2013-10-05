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



-(IBAction)button001:(id)sender
{
    NSAttributedString *aString;
        aString = [[NSAttributedString alloc] initWithString:@"string"
              attributes:@{NSFontAttributeName:[UIFont fontWithName:@"HiraKakuProN-W6" size:12.0f],
                            NSForegroundColorAttributeName:[UIColor redColor]}
                                                                                ];
    
    _label.attributedText = aString;
    
}

-(IBAction)button002:(id)sender
{
    
    //段落スタイル
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 20.f;
    paragraphStyle.minimumLineHeight = 10.f;
    paragraphStyle.maximumLineHeight = 100.f;
    
    NSDictionary *fontAttributes = @{NSFontAttributeName:[UIFont fontWithName:@"HiraKakuProN-W6" size:12.0f],
        NSForegroundColorAttributeName:[UIColor blueColor],
        NSParagraphStyleAttributeName:paragraphStyle
                                     };
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"この文字列は002のメソッドから書いています。行間が通常とは違っていると思いますが、これは段落設定をしているからです。"  attributes:fontAttributes];
    
    _textView.attributedText = aString;
    
}
-(IBAction)button003:(id)sender
{
    
}
#pragma mark initWithString:
-(void)method001
{
    
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"string"];
    
    _label.attributedText = aString;
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
    NSDictionary *fontAttributes = @{@"NSFont": (__bridge id)aFont2,
                                     @"CTForegroundColor": (__bridge id)darkGrayColor,
                                     @"CTVerticalForms": @YES,
                                     (id)kCTParagraphStyleAttributeName: paragraphStyleAttr};
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"string"  attributes:fontAttributes];
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    NSLog(@"%s %@",__FUNCTION__,[aString string]);
    

     
     
    
}
#pragma mark initWithString:

-(void)method003
{
    
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:@"string"];
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);

    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(3, 1)];
    
    [aString enumerateAttributesInRange:NSMakeRange(0, 5)
                                options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                             usingBlock:^(NSDictionary *attributes, NSRange range, BOOL *stop)
     {
         UIColor *fontColor = attributes[NSForegroundColorAttributeName];
         NSLog(@"%@",[fontColor description]);
     }
     ];
    
    
}
-(void)method004
{
    
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:@"string"];
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(3, 1)];
    
    [aString enumerateAttribute:NSForegroundColorAttributeName inRange:NSMakeRange(0, 5)
     
                                options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                             usingBlock:^(id value, NSRange range, BOOL *stop)
     {
         UIColor *fontColor = value;
         NSLog(@"%@",[fontColor description]);
     }
     ];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
     [self method001];
    [self method002];
    [self method003];
    [self method004];
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
