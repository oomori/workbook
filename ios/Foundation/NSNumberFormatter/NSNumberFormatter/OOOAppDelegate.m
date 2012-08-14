//
//  OOOAppDelegate.m
//  NSNumberFormatter
//
//  Created by 大森 智史 on 12/07/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSNumberFormatter setFormatWidth:
-(void)method001
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setFormatWidth: 3 ];
    NSLog(@"%s ,formatWidth %u",__FUNCTION__,[numFormat formatWidth]);
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method002
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setFormatterBehavior:NSNumberFormatterBehavior10_4 ];
    switch ([numFormat formatterBehavior]) {
        case NSNumberFormatterBehavior10_4:
                NSLog(@"%s , %@",__FUNCTION__,@"10.4 later");
            break;
            
        default:
            NSLog(@"%s , %@",__FUNCTION__,@"default");
            break;
    }
    
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method003
{
    [NSNumberFormatter setDefaultFormatterBehavior:NSNumberFormatterBehavior10_4 ];
    switch ([NSNumberFormatter defaultFormatterBehavior]) {
        case NSNumberFormatterBehavior10_4:
            NSLog(@"%s , %@",__FUNCTION__,@"10.4 later");
            break;
            
        default:
            NSLog(@"%s , %@",__FUNCTION__,@"default");
            break;
    }
    
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method004
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterSpellOutStyle];
    switch ([numFormat numberStyle]) {
        case NSNumberFormatterNoStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterNoStyle");
            break;
        case NSNumberFormatterDecimalStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterDecimalStyle");
            break;
        case NSNumberFormatterCurrencyStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterCurrencyStyle");
            break;
        case NSNumberFormatterPercentStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterPercentStyle");
            break;
        case NSNumberFormatterScientificStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterScientificStyle");
            break;
        case NSNumberFormatterSpellOutStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterSpellOutStyle");
            break;
            
        default:
            NSLog(@"%s , %@",__FUNCTION__,@"default");
            break;
    }

    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithLongLong:999999999999999935]]);
    //=>2,340
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method005
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setGeneratesDecimalNumbers:YES];
    [numFormat setNumberStyle:NSNumberFormatterSpellOutStyle];
    switch ([numFormat numberStyle]) {
        case NSNumberFormatterNoStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterNoStyle");
            break;
        case NSNumberFormatterDecimalStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterDecimalStyle");
            break;
        case NSNumberFormatterCurrencyStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterCurrencyStyle");
            break;
        case NSNumberFormatterPercentStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterPercentStyle");
            break;
        case NSNumberFormatterScientificStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterScientificStyle");
            break;
        case NSNumberFormatterSpellOutStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterSpellOutStyle");
            break;
            
        default:
            NSLog(@"%s , %@",__FUNCTION__,@"default");
            break;
    }
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:30.32]]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method006
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setGeneratesDecimalNumbers:NO];
    [numFormat setNumberStyle:NSNumberFormatterSpellOutStyle];
    switch ([numFormat numberStyle]) {
        case NSNumberFormatterNoStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterNoStyle");
            break;
        case NSNumberFormatterDecimalStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterDecimalStyle");
            break;
        case NSNumberFormatterCurrencyStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterCurrencyStyle");
            break;
        case NSNumberFormatterPercentStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterPercentStyle");
            break;
        case NSNumberFormatterScientificStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterScientificStyle");
            break;
        case NSNumberFormatterSpellOutStyle:
            NSLog(@"%s , %@",__FUNCTION__,@"NSNumberFormatterSpellOutStyle");
            break;
            
        default:
            NSLog(@"%s , %@",__FUNCTION__,@"default");
            break;
    }
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[[[numFormat numberFromString:@"三十・三一九九九九六九四八二四二"]class ]description]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method007
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setGeneratesDecimalNumbers:NO];
    [numFormat setNumberStyle:NSNumberFormatterSpellOutStyle];

    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    
    NSDecimalNumber *dNum;
    NSRange aRange = NSMakeRange(0,4);
    NSError *error;
    [numFormat getObjectValue:&dNum forString:@"三十・三一九九九九六九四八二四二" range:&aRange error:&error];
    NSLog(@"%s , %@",__FUNCTION__,[dNum description]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method008
{
    
    NSLog(@"%s , %@",__FUNCTION__,[NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithFloat:3.0] numberStyle:NSNumberFormatterSpellOutStyle]);
    //=>
    
}

#pragma mark NSNumberFormatter setLocale:
-(void)method009
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setGeneratesDecimalNumbers:NO];
    [numFormat setNumberStyle:NSNumberFormatterSpellOutStyle];
    
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    
    NSDecimalNumber *dNum;
    NSRange aRange = NSMakeRange(0,4);
    NSError *error;
    [numFormat getObjectValue:&dNum forString:@"三十・三一九九九九六九四八二四二" range:&aRange error:&error];
    NSLog(@"%s , %@",__FUNCTION__,[dNum description]);
    //=>
    
}

#pragma mark NSNumberFormatter setLocale:
-(void)method010
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setGeneratesDecimalNumbers:NO];
    [numFormat setNumberStyle:NSNumberFormatterSpellOutStyle];
    //[numFormat setRoundingIncrement:[NSNumber numberWithInteger:5]];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    
    NSDecimalNumber *dNum;
    NSRange aRange = NSMakeRange(0,8);
    NSError *error;
    [numFormat getObjectValue:&dNum forString:@"九十九兆九千九百九十九億九千九百九十九万九千九百三十五" range:&aRange error:&error];
    NSLog(@"%s , %@",__FUNCTION__,[dNum description]);
    //=>
    
}

#pragma mark NSNumberFormatter setLocale:
-(void)method011
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setGeneratesDecimalNumbers:NO];
    [numFormat setNumberStyle:NSNumberFormatterSpellOutStyle];
    [numFormat setRoundingMode:NSNumberFormatterRoundDown];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    
    NSDecimalNumber *dNum;
    NSRange aRange = NSMakeRange(0,8);
    NSError *error;
    [numFormat getObjectValue:&dNum forString:@"九千九百九十九万九千九百三十五" range:&aRange error:&error];
    NSLog(@"%s , %@",__FUNCTION__,[dNum description]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method012
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setFormatWidth:3];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:10000000]]);
    //=>2,340
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method013
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setPositiveFormat:@"###,###円"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:10000000]]);
    //=>10,000,000円
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method014
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setNegativeFormat:@"▲###,###円"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:-10000000000]]);
    //=>10,000,000円
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method015
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setMultiplier:[NSNumber numberWithInteger:2]];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:6.0]]);
    //=>
    
}


#pragma mark NSNumberFormatter initWithObjects:
-(void)method016
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterPercentStyle];
    [numFormat setPercentSymbol:@"㌫"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:0.6]]);
        NSLog(@"%s , %@",__FUNCTION__,[numFormat percentSymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method017
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterPercentStyle];
    [numFormat setPerMillSymbol:@"‰"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:0.6]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat perMillSymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter setMinusSign:
-(void)method018
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setMinusSign:@"マイナス"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:-10000000000]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat minusSign]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method019
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setPlusSign:@"ぷらす"];
    [numFormat setPositiveFormat:@"+###,###円"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:10000000000]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat plusSign]);
    //=>
    
}



#pragma mark NSNumberFormatter initWithObjects:
-(void)method020
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterScientificStyle];
    [numFormat setExponentSymbol:@"^"];
    [numFormat setPositiveFormat:@"###E###"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:10000000000]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat exponentSymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method021
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterScientificStyle];
    [numFormat setZeroSymbol:@"零"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:0.0]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat zeroSymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method022
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterScientificStyle];
    [numFormat setNilSymbol:@"NULL"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:0]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat nilSymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method023
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterScientificStyle];
    [numFormat setNilSymbol:@"NULL"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:0]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat nilSymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method024
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterScientificStyle];
    [numFormat setNilSymbol:@"N/A"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:0]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat notANumberSymbol]);
    //=>
    
}
#pragma mark NSNumberFormatter initWithObjects:
-(void)method025
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterScientificStyle];
    [numFormat setNegativeInfinitySymbol:@"まいなす∞"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:0]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat negativeInfinitySymbol]);
    //=>
    
}
#pragma mark NSNumberFormatter initWithObjects:
-(void)method026
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterScientificStyle];
    [numFormat setPositiveInfinitySymbol:@"無限大"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:0]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat positiveInfinitySymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method027
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    //[numFormat setCurrencySymbol:@"円"];
    [numFormat setPositiveFormat:@"+###,###"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:10000000000]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat currencySymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method028
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setCurrencyCode:@"日本円"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:10000000000]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat currencyCode]);
    //=>
    
}
#pragma mark NSNumberFormatter initWithObjects:
-(void)method029
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setInternationalCurrencySymbol:@"円"];
    //[numFormat setPositiveFormat:@"+###,###"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:10000000000]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat internationalCurrencySymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method030
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setCurrencyGroupingSeparator:@"、"];
    [numFormat setPositiveFormat:@"+###,###"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:10000000000]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat currencyGroupingSeparator]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method031
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setPositivePrefix:@""];
    [numFormat setPositiveSuffix:@"円"];
    [numFormat setPositiveFormat:@"+###,###"];
    [numFormat setNegativeFormat:@"-###,###"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:10000000000]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat currencySymbol]);
    //=>
    
}

#pragma mark NSNumberFormatter initWithObjects:
-(void)method032
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    
    NSMutableDictionary *newAttrs = [NSMutableDictionary dictionary];
    
    [newAttrs setObject:[UIColor redColor] forKey:@"NSColor"];
    [numFormat setTextAttributesForNegativeValues:newAttrs];
    [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numFormat setPositivePrefix:@""];
    [numFormat setPositiveSuffix:@"円"];
    [numFormat setPositiveFormat:@"$#,##0.00"];
    [numFormat setNegativeFormat:@"$#,##0.00"];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:-10000000000]]);
    NSLog(@"%s , %@",__FUNCTION__,[numFormat currencySymbol]);
    //=>
    

    
}

#pragma mark NSNumberFormatter textAttributesForNegativeInfinity:
-(void)method033
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    NSDictionary *aDictionary = [numFormat textAttributesForNegativeInfinity];
    NSLog(@"%s , %@",__FUNCTION__,[aDictionary description]);
    //=>
    
}

#pragma mark NSNumberFormatter groupingSeparator:
-(void)method034
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSString *aGroupingSeparator = [numFormat groupingSeparator];
    NSLog(@"%s , ja-JP %@",__FUNCTION__,[aGroupingSeparator description]);
    //=> -[OOOAppDelegate method034] , ja-JP ,
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"fr-FR"]];
    NSString *aGroupingSeparatorFR = [numFormat groupingSeparator];
    NSLog(@"%s , fr-FR %@",__FUNCTION__,[aGroupingSeparatorFR description]);
    //=>
    
}

#pragma mark NSNumberFormatter usesGroupingSeparator:
-(void)method035
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setPositiveFormat:@"#,##0円"];
    [numFormat setUsesGroupingSeparator:YES];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:1000000000]]);
    //=> -[OOOAppDelegate method034] , ja-JP ,
    [numFormat setUsesGroupingSeparator:NO];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:1000000000]]);
    //=>
    
}

#pragma mark NSNumberFormatter setAlwaysShowsDecimalSeparator:
-(void)method036
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setPositiveFormat:@"#,##0"];
    [numFormat setAlwaysShowsDecimalSeparator:YES];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:100.23]]);
    //=> -[OOOAppDelegate method034] , ja-JP ,
    [numFormat setAlwaysShowsDecimalSeparator:NO];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithFloat:100.23]]);
    //=>
    
}
#pragma mark NSNumberFormatter decimalSeparator:
-(void)method037
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSString *aDecimalSeparator = [numFormat decimalSeparator];
    NSLog(@"%s , ja-JP %@",__FUNCTION__,[aDecimalSeparator description]);
    //=> -[OOOAppDelegate method034] , ja-JP ,
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"fr-FR"]];
    NSString *aDecimalSeparatorFR = [numFormat decimalSeparator];
    NSLog(@"%s , fr-FR %@",__FUNCTION__,[aDecimalSeparatorFR description]);
    //=>
    
}

#pragma mark NSNumberFormatter decimalSeparator:
-(void)method038
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    NSString *aCurrencyDecimalSeparator = [numFormat currencyDecimalSeparator];
    NSLog(@"%s , ja-JP %@",__FUNCTION__,[aCurrencyDecimalSeparator description]);
    //=> -[OOOAppDelegate method034] , ja-JP ,
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"fr-FR"]];
    NSString *aCurrencyDecimalSeparatorFR = [numFormat currencyDecimalSeparator];
    NSLog(@"%s , fr-FR %@",__FUNCTION__,[aCurrencyDecimalSeparatorFR description]);
    //=>
    
}
#pragma mark NSNumberFormatter setGroupingSize:
-(void)method039
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setPositiveFormat:@"#,##0円"];
    [numFormat setGroupingSize:3];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:1000000000]]);
    //=>-[OOOAppDelegate method039] , 1,000,000,000円
    [numFormat setGroupingSize:4];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:1000000000]]);
    //=>-[OOOAppDelegate method039] , 10,0000,0000円
    
}

#pragma mark NSNumberFormatter setGroupingSize:
-(void)method040
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setPositiveFormat:@"#,##0円"];
    [numFormat setSecondaryGroupingSize:2];
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"hi-IN"]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:123456789]]);
    //=>
    [numFormat setGroupingSize:4];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:123456789]]);
    //=>
    
}

#pragma mark NSNumberFormatter setGroupingSize:
-(void)method041
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    //[numFormat setMaximumIntegerDigits:4];
    [numFormat setMinimumIntegerDigits:6];

    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:10]]);
    //=>-[OOOAppDelegate method039] , 1,000,000,000円
    [numFormat setGroupingSize:4];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:10000]]);
    //=>-[OOOAppDelegate method039] , 10,0000,0000円
    
    NSLog(@"%s ,  %@",__FUNCTION__,[numFormat paddingCharacter]);
    
}

#pragma mark NSNumberFormatter setMaximum:
-(void)method042
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    //[numFormat setNegativeFormat:@"-####"];
    //[numFormat setPositiveFormat:@"+####"];
    [numFormat setMaximum:[NSNumber numberWithInteger: 4]];
    [numFormat setMinimum:[NSNumber numberWithInteger: 4]];
    [numFormat setPaddingPosition:4];
    
    //[numFormat setPositiveFormat:@"#,##0円"];
    //[numFormat setPaddingCharacter:@"M"];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:10]]);
    //=>-[OOOAppDelegate method039] , 1,000,000,000円
    [numFormat setGroupingSize:4];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:1000000000]]);
    //=>-[OOOAppDelegate method039] , 10,0000,0000円
    
    NSLog(@"%s ,  %@",__FUNCTION__,[numFormat paddingCharacter]);
    
}

#pragma mark NSNumberFormatter setGroupingSize:
-(void)method043
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    //[numFormat setNegativeFormat:@"-####"];
    //[numFormat setPositiveFormat:@"+####"];
    [numFormat setMaximumIntegerDigits:4];
    [numFormat setMaximumFractionDigits:4];
    [numFormat setPaddingPosition:4];
    
    //[numFormat setPositiveFormat:@"#,##0円"];
    //[numFormat setPaddingCharacter:@"M"];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:10]]);
    //=>-[OOOAppDelegate method039] , 1,000,000,000円
    [numFormat setGroupingSize:4];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSNumber numberWithInteger:1000000000]]);
    //=>-[OOOAppDelegate method039] , 10,0000,0000円
    
    NSLog(@"%s ,  %@",__FUNCTION__,[numFormat paddingCharacter]);
    
}

#pragma mark NSNumberFormatter setLocale:
-(void)method044
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    //[numFormat setLenient:YES];
    [numFormat setGeneratesDecimalNumbers:NO];
    [numFormat setNumberStyle:NSNumberFormatterSpellOutStyle];
    //[numFormat setRoundingIncrement:[NSNumber numberWithInteger:5]];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    
    NSDecimalNumber *dNum;
    NSRange aRange = NSMakeRange(0,8);
    NSError *error;
    [numFormat getObjectValue:&dNum forString:@"九千九百九十九万九千九百三十五" range:&aRange error:&error];
    NSLog(@"%s , %@",__FUNCTION__,[dNum description]);
    //=>
    
}

#pragma mark NSNumberFormatter setLocale:
-(void)method045
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    //[numFormat setLenient:YES];
    [numFormat setGeneratesDecimalNumbers:NO];
    [numFormat setNumberStyle:NSNumberFormatterSpellOutStyle];
    //[numFormat setRoundingIncrement:[NSNumber numberWithInteger:5]];
    
    [numFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"]];
    
    NSDecimalNumber *dNum;
    NSRange aRange = NSMakeRange(0,8);
    NSError *error;
    [numFormat getObjectValue:&dNum forString:@"九千九百九十九万九千九百三十五" range:&aRange error:&error];
    NSLog(@"%s , %@",__FUNCTION__,[dNum description]);
    //=>
    
}

#pragma mark NSNumberFormatter setGroupingSize:
-(void)method046
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setGeneratesDecimalNumbers:YES];
    [numFormat setMinimumFractionDigits:2];
    [numFormat setRoundingMode: NSNumberFormatterRoundHalfEven];
    //[numFormat setRoundingIncrement:[[NSNumber alloc]initWithDouble:0.05]];
    
    //[numFormat setNumberStyle:NSNumberFormatterDecimalStyle];
//    [numFormat setRoundingMode:NSNumberFormatterRoundHalfUp];

    //[numFormat setRoundingIncrement:[NSNumber numberWithDouble:0.01]];
    
    //[numFormat setPositiveFormat:@"0.00000"];
    //[numFormat setRoundingIncrement:[NSNumber numberWithInteger:2]];
    [numFormat setRoundingMode:NSNumberFormatterRoundDown];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSDecimalNumber numberWithFloat:12345.678]]);
    //=>
    //[numFormat setRoundingIncrement:[NSNumber numberWithInteger:-1]];
    NSLog(@"%s , %@",__FUNCTION__,[numFormat stringFromNumber:[NSDecimalNumber numberWithFloat:12345.67]]);
    //=>
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    [self method003];
    [self method004];
    [self method005];
    [self method006];
    [self method007];
    [self method008];
    [self method009];
    [self method010];
    [self method011];
    [self method012];
    [self method013];
    [self method014];
    [self method015];
    [self method016];
    [self method017];
    [self method018];
    [self method019];
    [self method020];
    [self method021];
    [self method022];
    [self method023];
    [self method024];
    [self method025];
    [self method026];
    [self method027];
    [self method028];
    [self method029];
    [self method030];
    [self method031];
    [self method032];
    [self method033];
    [self method034];
    [self method035];
    [self method036];
    [self method037];
    [self method038];
    [self method039];
    [self method040];
    [self method041];
    [self method042];
    [self method043];
    [self method044];
    [self method045];
    [self method046];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
