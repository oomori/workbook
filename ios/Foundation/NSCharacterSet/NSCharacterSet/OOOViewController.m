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

#pragma mark NSCharacterSet alphanumericCharacterSet:
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
#pragma mark NSCharacterSet decimalDigitCharacterSet:
-(void)method002
{
    NSString *str = @"Tokyo Tower is the height of 333m. Tokyo Sky Tree height is 634m.";
    NSScanner *scanner = [NSScanner scannerWithString:str];
    [scanner setCharactersToBeSkipped:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
    
    NSInteger intValue;
    while ([scanner scanInteger:&intValue])
    {
        NSLog(@"%s %i",__FUNCTION__, intValue );
    }
}

#pragma mark NSCharacterSet alphanumericCharacterSet
-(void)method003
{
    NSCharacterSet* chSet = [NSCharacterSet alphanumericCharacterSet];
    NSString* aString= @"......a.........b.......0........1.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
}

#pragma mark NSCharacterSet capitalizedLetterCharacterSet
-(void)method004
{
    //ǅǈǋǲᾈᾉᾊᾋᾌᾍᾎᾏᾘᾙᾚᾛᾜᾝᾞᾟᾨᾩᾪᾫᾬᾭᾮᾯᾼῌῼ
    NSCharacterSet* chSet = [NSCharacterSet capitalizedLetterCharacterSet];
    NSString* aString= @"......a.........ῼ.......0........ᾊ.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet capitalizedLetterCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    NSLog(@"%s %@",__FUNCTION__,mString);
}
#pragma mark NSCharacterSet capitalizedLetterCharacterSet
-(void)method005
{
    //
    NSCharacterSet* chSet = [NSCharacterSet controlCharacterSet];
    NSString* aString= @"......a.........ῼ.......0........ᾊ.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet controlCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
}

#pragma mark NSCharacterSet capitalizedLetterCharacterSet
-(void)method006
{
    //
    NSCharacterSet* chSet = [NSCharacterSet decimalDigitCharacterSet];
    NSString* aString= @"......a.........1.......z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet decimalDigitCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    NSLog(@"%s %@",__FUNCTION__,mString);
}

#pragma mark NSCharacterSet capitalizedLetterCharacterSet
-(void)method007
{
    //
    NSCharacterSet* chSet = [NSCharacterSet decomposableCharacterSet];
    NSString* aString= @"......a.........1.......z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet decomposableCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
}
#pragma mark NSCharacterSet capitalizedLetterCharacterSet
-(void)method008
{
    //
    NSCharacterSet* chSet = [NSCharacterSet illegalCharacterSet];
    NSString* aString= @"......a.........1.......z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet illegalCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
}
#pragma mark NSCharacterSet capitalizedLetterCharacterSet
-(void)method009
{
    //
    NSCharacterSet* chSet = [NSCharacterSet letterCharacterSet];
    NSString* aString= @"......a.........1.......z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);

}

#pragma mark NSCharacterSet letterCharacterSet
-(void)method010
{
    //
    NSCharacterSet* chSet = [NSCharacterSet letterCharacterSet];
    NSString* aString= @"......a.........1.......Z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
}
#pragma mark NSCharacterSet lowercaseLetterCharacterSet
-(void)method011
{
    //
    NSCharacterSet* chSet = [NSCharacterSet lowercaseLetterCharacterSet];
    NSString* aString= @"......a.........1.......Z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
}

#pragma mark NSCharacterSet lowercaseLetterCharacterSet
-(void)method012
{
    //
    NSCharacterSet* chSet = [NSCharacterSet newlineCharacterSet];
    NSString* aString= @"......a.........\n.......Z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
}

#pragma mark NSCharacterSet nonBaseCharacterSet
-(void)method013
{
    //
    NSCharacterSet* chSet = [NSCharacterSet nonBaseCharacterSet];
    NSString* aString= @"......a.........\n.......Z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet nonBaseCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
    
}

#pragma mark NSCharacterSet punctuationCharacterSet
-(void)method014
{
    //
    NSCharacterSet* chSet = [NSCharacterSet punctuationCharacterSet];
    NSString* aString= @"......a.........\n.......Z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet punctuationCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
    
}

#pragma mark NSCharacterSet punctuationCharacterSet
-(void)method015
{
    //
    NSCharacterSet* chSet = [NSCharacterSet symbolCharacterSet];
    NSString* aString= @"......a.........\n.......Z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet symbolCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
    
}
#pragma mark NSCharacterSet uppercaseLetterCharacterSet
-(void)method016
{
    //
    NSCharacterSet* chSet = [NSCharacterSet uppercaseLetterCharacterSet];
    NSString* aString= @"......a.........0.......Z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
    
}

#pragma mark NSCharacterSet whitespaceAndNewlineCharacterSet
-(void)method017
{
    //
    NSCharacterSet* chSet = [NSCharacterSet uppercaseLetterCharacterSet];
    NSString* aString= @"......a.........\n.......Z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet whitespaceAndNewlineCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
    
}

#pragma mark NSCharacterSet whitespaceCharacterSet
-(void)method018
{
    //
    NSCharacterSet* chSet = [NSCharacterSet whitespaceCharacterSet];
    NSString* aString= @"......a.........\n.......Z........0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet whitespaceCharacterSet] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
    
}
#pragma mark NSCharacterSet whitespaceCharacterSet
-(void)method019
{
    //
    NSCharacterSet* chSet = [NSCharacterSet characterSetWithCharactersInString:@"!#"];
    NSString* aString= @"......a.....!....\n.......Z....#....0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    
}
#pragma mark NSCharacterSet characterSetWithRange
-(void)method020
{
    //
    NSCharacterSet* chSet = [NSCharacterSet characterSetWithRange:NSMakeRange(40,100)];
    NSString* aString= @"......a.....!....\n.......Z....#....0.......";
    NSScanner* aScanner = [NSScanner scannerWithString:aString];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:6];
    NSString *retStr ;
    while(![aScanner isAtEnd]) {
        if([aScanner scanUpToCharactersFromSet:chSet intoString:&retStr]) {
            [mArray addObject:retStr];
        }
        [aScanner scanCharactersFromSet:chSet intoString:NULL];
    }
    NSLog(@"%s %@",__FUNCTION__,[mArray description]);
    
    //
    
    UTF32Char currentChar ;
    NSCharacterSet *chrSet = [NSCharacterSet characterSetWithRange:NSMakeRange(40,90)] ;
    NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    int i,u = 0;
    
    
    
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet longCharacterIsMember:currentChar])
        {
            NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            [mString appendString:str];
            NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);

}

#pragma mark NSCharacterSet invertedSet
-(void)method021
{
    NSString *str = @"Tokyo Tower is the height of 333m. Tokyo Sky Tree height is 634m.";
    NSScanner *scanner = [NSScanner scannerWithString:str];
    [scanner setCharactersToBeSkipped:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
    
    NSInteger intValue;
    while ([scanner scanInteger:&intValue])
    {
        NSLog(@"%s %i",__FUNCTION__, intValue );
    }
}

#pragma mark NSCharacterSet invertedSet
-(void)method022
{

    NSString *path = @"~/testWritecharset.bitmap";//ユーザーディレクトリのトップのtestWritecharset.bitmapというファイルへ
    NSData *bData ;
    //NSCharacterSet *chrSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSCharacterSet *chrSet = [[NSCharacterSet characterSetWithRange:NSMakeRange(0x41,1)] invertedSet];
    bData = [chrSet bitmapRepresentation] ;
    NSURL *aURL = [[NSURL alloc] initFileURLWithPath:[path stringByExpandingTildeInPath]];
    //データ書き出し
    NSLog(([bData writeToURL:aURL atomically:YES])?@"YES":@"NO");
    
    //ビットマップをチェック
    //1114112文字分(0x10FFFF)
    NSData *cData = [NSData dataWithContentsOfURL:aURL];
    NSUInteger len = [cData length];
    NSLog(@"%d",len);
    unsigned char *bitmapRep = (Byte*)malloc(len);
    memcpy(bitmapRep, [cData bytes], len);
    //0x41 'A'が含まれているか
    unsigned char n=0x41;
     if (bitmapRep[n >> 3] & (((unsigned int)1) << (n  & 7))) {
         NSLog(@"include ");
     }
    
    UTF32Char currentChar ;
    //データ読み込み
    NSCharacterSet *chrSet2 = [NSCharacterSet characterSetWithContentsOfFile:[path stringByExpandingTildeInPath]];
    //NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    unsigned int i,u = 0;
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet2 longCharacterIsMember:currentChar])
        {
            //NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            //[mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);

}

#pragma mark NSCharacterSet invertedSet
-(void)method023
{
    
    NSString *path = @"~/testWritecharset.bitmap";//ユーザーディレクトリのトップのtestWritecharset.bitmapというファイルへ
    NSData *bData ;
    //NSCharacterSet *chrSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSCharacterSet *chrSet = [[NSCharacterSet characterSetWithRange:NSMakeRange(0x41,1)] invertedSet];
    bData = [chrSet bitmapRepresentation] ;
    NSURL *aURL = [[NSURL alloc] initFileURLWithPath:[path stringByExpandingTildeInPath]];
    //データ書き出し
    NSLog(([bData writeToURL:aURL atomically:YES])?@"YES":@"NO");
    
    //ビットマップをチェック
    //1114112文字分(0x10FFFF)
    NSData *cData = [NSData dataWithContentsOfURL:aURL];
    NSUInteger len = [cData length];
    NSLog(@"%d",len);
    unsigned char *bitmapRep = (Byte*)malloc(len);
    memcpy(bitmapRep, [cData bytes], len);
    //0x41 'A'が含まれているか
    unsigned char n=0x41;
    if (bitmapRep[n >> 3] & (((unsigned int)1) << (n  & 7))) {
        NSLog(@"include ");
    }
    
    UTF32Char currentChar ;
    //データ読み込み
    NSCharacterSet *chrSet2 = [NSCharacterSet characterSetWithBitmapRepresentation:cData ];
    //NSMutableString *mString = [NSMutableString stringWithCapacity:100];
    unsigned int i,u = 0;
    for ( i=0 ; i<=0x10FFFF ; i++){
        
        currentChar = (UTF32Char)i;
        if ([chrSet2 longCharacterIsMember:currentChar])
        {
            //NSString *str = [[NSString alloc] initWithBytes:&currentChar length:4 encoding:NSUTF32LittleEndianStringEncoding];
            //[mString appendString:str];
            //NSLog(@"%s code=0x%lX %@",__FUNCTION__,currentChar,str);
            u++;
        }
        
    }
    NSLog(@"%s total %d characters",__FUNCTION__,u);
    //NSLog(@"%s %@",__FUNCTION__,mString);
    
}

#pragma mark NSCharacterSet isSupersetOfSet
-(void)method024
{
    
    
    NSCharacterSet *decimalSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *checkSet = [NSCharacterSet characterSetWithCharactersInString:@"a12345"];
    BOOL valid = [decimalSet isSupersetOfSet:checkSet];    

    NSLog(@"%s is number? %@",__FUNCTION__,(valid)?@"YES":@"NO");
    //NSLog(@"%s %@",__FUNCTION__,mString);
    printf("unsigned short の最大値: %u\n", USHRT_MAX);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
