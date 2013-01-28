//
//  OOOAppDelegate.m
//  NSOrthography
//
//  Created by 大森 智史 on 2012/08/14.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

#pragma mark NSMutableCharacterSet requestCheckingOfString:
-(void)method001
{
    
    NSSpellChecker *spellChecker = [NSSpellChecker sharedSpellChecker];
    [spellChecker setAutomaticallyIdentifiesLanguages:YES];
    //NSString *spellCheckText = @"Guten Herr Mustermann. Dies ist ein deutscher Text. Bitte löschen Sie diesen nicht.";
    NSString *spellCheckText = @"みなさんこんばんは。私は元気です。";
    [spellChecker requestCheckingOfString:spellCheckText
                                    range:(NSRange){0, [spellCheckText length]}
                                    types:NSTextCheckingTypeOrthography
                                  options:nil
                   inSpellDocumentWithTag:0
                        completionHandler:^(NSInteger sequenceNumber, NSArray *results, NSOrthography *orthography, NSInteger wordCount) {
                            NSLog(@"dominant language = %@", orthography.dominantLanguage);
                        }];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self method001];
}

@end
