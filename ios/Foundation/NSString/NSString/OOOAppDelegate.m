//
//  OOOAppDelegate.m
//  NSString
//
//  Created by 大森 智史 on 12/05/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark TOOL FREE BRIDGE
-(void)method001
{
	NSString *encodedString = 
    (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                 (CFStringRef)@"target strings",
                                                                 NULL,
                                                                 (CFStringRef)@";,/?:@&=+$#",
                                                                 kCFStringEncodingUTF8);
    NSLog(@"%s %@",__FUNCTION__,encodedString);
    //=>target%20strings
    
}

#pragma mark TOOL FREE BRIDGE
-(void)method002
{
    CFStringRef cfString = CFStringCreateWithFormat(kCFAllocatorDefault, NULL,
                                                    CFSTR("%@ = %.2f \n"),CFSTR("pi"),3.1415);
    
    CFShow(cfString);
    
    NSString *aString = (__bridge_transfer NSString *)cfString;//CFBridgingRelease(cfString);
    
    NSLog(@"%s %@",__FUNCTION__,aString);
    
}

#pragma mark TOOL FREE BRIDGE
-(void)method003
{
    NSDictionary *localeDic= [[NSDictionary alloc] initWithObjectsAndKeys:
                              @",",@"NSDecimalSeparator",//小数点区切りフランスでは,が小数点らしい
                              nil];
    NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    NSLocale *gbLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    NSLocale *deLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];
    

    NSString *dicStr = [[NSString alloc] initWithFormat:@"  %.2f" locale:localeDic,1200.344,nil ];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,dicStr,dicStr);
    
    NSString *frStr = [[NSString alloc] initWithFormat:@"  %.2f" locale:frLocale,1200.344,nil ];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,frStr,frStr);
    
    NSString *gbStr = [[NSString alloc] initWithFormat:@"  %.2f" locale:gbLocale,1200.344,nil ];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,gbStr,gbStr);
    
    NSString *jpStr = [[NSString alloc] initWithFormat:@"  %.2f" locale:jpLocale,1200.344,nil ];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,jpStr,jpStr);
    
    NSString *deStr = [[NSString alloc] initWithFormat:@"  %.2f" locale:deLocale,1200.344,nil ];
    NSLog(@"%s aDictionary %p = %@",__FUNCTION__,deStr,deStr);
    
}

#pragma mark initWithFormat:
-(void)method004
{
	NSString *str1 = [[NSString alloc] initWithFormat:@"int%d",10];
    NSLog(@"%s str1 %p = %@",__FUNCTION__,str1,str1);
    
    NSString *str2 = [[NSString alloc] initWithFormat:@"%@",@"string"];
    NSLog(@"%s str2 %p = %@",__FUNCTION__,str2,str2);
    
}

#pragma mark stringByReplacingOccurrencesOfString:withString:options:range:
-(void)method005
{
    //000-000-0000形式の文字列が最初に出現する位置を返す。
    NSString *str1 = [[NSString alloc] initWithString:@"my telephone number is 012-345-6789 ."];
    NSRange aRange = [str1 rangeOfString:@"[0-9]{3}+-[0-9]{3}+-[0-9]{4}+" 
                                                        options:NSRegularExpressionSearch];
    
    
    NSLog(@"%s str2  = %u",__FUNCTION__,aRange.location);
    
    NSString *str3 = [[NSString alloc] initWithString:@"If into in onto of often on and ON"];
    NSString *str4 = [str3 stringByReplacingOccurrencesOfString:@"\\b(i|o)(f|n)\\b" //\\bはスペース(i|o)はiまたはo
                                                     withString:@"$2$1" //2番目の要素が前にきて、1番目の要素があとに来る
                                                        options:NSRegularExpressionSearch 
                                                          range:NSMakeRange(0,[str3 length])
                      ];

    
    NSLog(@"%s str2 %p = %@",__FUNCTION__,str4,str4);
    
}

#pragma mark iOS NSString boolValue:
-(void)method006
{

    NSString *str1 = [[NSString alloc] initWithString:@"t"];
    NSLog(@"%s %p \"%@\" = %@",__FUNCTION__,str1,str1,([str1 boolValue])?@"YES":@"NO");
    //=>0x4750 "t" = YES
    
    NSString *str2 = [[NSString alloc] initWithString:@"at"];
    NSLog(@"%s %p \"%@\" = %@",__FUNCTION__,str2,str2,([str2 boolValue])?@"YES":@"NO");
    //=>0x4790 "at" = NO
    
    NSString *str3 = [[NSString alloc] initWithString:@"0"];
    NSLog(@"%s %p \"%@\" = %@",__FUNCTION__,str3,str3,([str3 boolValue])?@"YES":@"NO");
    //=>0x47a0 "0" = NO
    
    NSString *str4 = [[NSString alloc] initWithString:@"01"];
    NSLog(@"%s %p \"%@\" = %@",__FUNCTION__,str4,str4,([str4 boolValue])?@"YES":@"NO");
    //=>0x47b0 "01" = YES
    
}

#pragma mark iOS NSString lastPathComponent
-(void)method007
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"/tmp/scratch.tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str1,[str1 lastPathComponent]);
    //=>0x57d8 , scratch.tiff
    
    NSString *str2 = [[NSString alloc] initWithString:@"/tmp/scratch"];
    NSLog(@"%s %p , %@",__FUNCTION__,str2,[str2 lastPathComponent]);
    //=>0x57f8 , scratch
    
    NSString *str3 = [[NSString alloc] initWithString:@"/tmp/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str3,[str3 lastPathComponent]);
    //=>0x5808 , tmp
    
    NSString *str4 = [[NSString alloc] initWithString:@"scratch"];
    NSLog(@"%s %p , %@",__FUNCTION__,str4,[str4 lastPathComponent]);
    //=>0x5818 , scratch

    NSString *str5 = [[NSString alloc] initWithString:@"/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str5,[str5 lastPathComponent]);
    //=>0x5828 , /
    
}

#pragma mark iOS NSString stringByAppendingPathComponent:
-(void)method008
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"/tmp"];
    NSLog(@"%s %p , %@",__FUNCTION__,str1,[str1 stringByAppendingPathComponent:@"scratch.tiff"]);
    //=>0x5848 , /tmp/scratch.tiff
    
    NSString *str2 = [[NSString alloc] initWithString:@"/tmp/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str2,[str2 stringByAppendingPathComponent:@"scratch.tiff"]);
    //=>0x5818 , /tmp/scratch.tiff
    
    NSString *str3 = [[NSString alloc] initWithString:@"/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str3,[str3 stringByAppendingPathComponent:@"scratch.tiff"]);
    //=>0x5838 , /scratch.tiff
    
    NSString *str4 = [[NSString alloc] initWithString:@""];
    NSLog(@"%s %p , %@",__FUNCTION__,str4,[str4 stringByAppendingPathComponent:@"scratch.tiff"]);
    //=>0x5868 , scratch.tiff

    
}


#pragma mark iOS NSString stringByDeletingLastPathComponent
-(void)method009
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"/tmp/scratch.tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str1,[str1 stringByDeletingLastPathComponent]);
    //=>-[OOOAppDelegate method009] 0x5800 , /tmp
    
    NSString *str2 = [[NSString alloc] initWithString:@"/tmp/lock/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str2,[str2 stringByDeletingLastPathComponent]);
    //=>-[OOOAppDelegate method009] 0x5890 , /tmp
    
    NSString *str3 = [[NSString alloc] initWithString:@"/tmp/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str3,[str3 stringByDeletingLastPathComponent]);
    //=>-[OOOAppDelegate method009] 0x5830 , /
    
    NSString *str4 = [[NSString alloc] initWithString:@"/tmp"];
    NSLog(@"%s %p , %@",__FUNCTION__,str4,[str4 stringByDeletingLastPathComponent]);
    //=>-[OOOAppDelegate method009] 0x5860 , /
    
    NSString *str5 = [[NSString alloc] initWithString:@"/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str5,[str5 stringByDeletingLastPathComponent]);
    //=>-[OOOAppDelegate method009] 0x5850 , /

    NSString *str6 = [[NSString alloc] initWithString:@"scratch.tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str6,[str6 stringByDeletingLastPathComponent]);
    //=>-[OOOAppDelegate method009] 0x5870 , 　　　(空の文字列)

    
}

#pragma mark iOS NSString stringByDeletingLastPathComponent
-(void)method010
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"/tmp/scratch.tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str1,[str1 pathExtension]);
    //=>-[OOOAppDelegate method010] 0x5810 , tiff
    
    NSString *str2 = [[NSString alloc] initWithString:@"/tmp/scratch"];
    NSLog(@"%s %p , %@",__FUNCTION__,str2,[str2 pathExtension]);
    //=>-[OOOAppDelegate method010] 0x5830 , 
    
    NSString *str3 = [[NSString alloc] initWithString:@"/tmp/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str3,[str3 pathExtension]);
    //=>-[OOOAppDelegate method010] 0x5840 , 
    
    NSString *str4 = [[NSString alloc] initWithString:@"/tmp/scratch..tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str4,[str4 pathExtension]);
    //=>-[OOOAppDelegate method010] 0x58b0 , tiff
    
    
}

#pragma mark iOS NSString stringByAppendingPathComponent:
-(void)method011
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"/tmp/scratch.old"];
    NSLog(@"%s %p , %@",__FUNCTION__,str1,[str1 stringByAppendingPathExtension:@"tiff"]);
    //=>-[OOOAppDelegate method011] 0x58d8 , /tmp/scratch.old.tiff
    
    NSString *str2 = [[NSString alloc] initWithString:@"/tmp/scratch."];
    NSLog(@"%s %p , %@",__FUNCTION__,str2,[str2 stringByAppendingPathExtension:@"tiff"]);
    //=>-[OOOAppDelegate method011] 0x58f8 , /tmp/scratch..tiff
    
    NSString *str3 = [[NSString alloc] initWithString:@"/tmp/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str3,[str3 stringByAppendingPathExtension:@"tiff"]);
    //=>-[OOOAppDelegate method011] 0x5858 , /tmp.tiff
    
    NSString *str4 = [[NSString alloc] initWithString:@"scratch"];
    NSLog(@"%s %p , %@",__FUNCTION__,str4,[str4 stringByAppendingPathExtension:@"tiff"]);
    //=>-[OOOAppDelegate method011] 0x5868 , scratch.tiff
    
    
}

#pragma mark iOS NSString stringByDeletingPathExtension
-(void)method012
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"/tmp/scratch.tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str1,[str1 stringByDeletingPathExtension]);
    //=>-[OOOAppDelegate method012] 0x6838 , /tmp/scratch
    
    NSString *str2 = [[NSString alloc] initWithString:@"/tmp/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str2,[str2 stringByDeletingPathExtension]);
    //=>-[OOOAppDelegate method012] 0x6868 , /tmp
    
    NSString *str3 = [[NSString alloc] initWithString:@"scratch.bundle/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str3,[str3 stringByDeletingPathExtension]);
    //=>-[OOOAppDelegate method012] 0x6918 , scratch
    
    NSString *str4 = [[NSString alloc] initWithString:@"scratch..tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str4,[str4 stringByDeletingPathExtension]);
    //=>-[OOOAppDelegate method012] 0x6928 , scratch.
    
    NSString *str5 = [[NSString alloc] initWithString:@".tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str5,[str5 stringByDeletingPathExtension]);
    //=> -[OOOAppDelegate method012] 0x6938 , .tiff
    
    NSString *str6 = [[NSString alloc] initWithString:@"/"];
    NSLog(@"%s %p , %@",__FUNCTION__,str6,[str6 stringByDeletingPathExtension]);
    //=>-[OOOAppDelegate method012] 0x6888 , /
    
    
}

#pragma mark iOS NSString isAbsolutePath
-(void)method013
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"/tmp/scratch.tiff"];
    NSLog(@"%s %p \"%@\" = %@",__FUNCTION__,str1,str1,([str1 isAbsolutePath])?@"YES":@"NO");
    //=>-[OOOAppDelegate method013] 0x6850 "/tmp/scratch.tiff" = YES
    
    NSString *str2 = [[NSString alloc] initWithString:@"../tmp/scratch.tiff"];
    NSLog(@"%s %p \"%@\" = %@",__FUNCTION__,str2,str2,([str2 isAbsolutePath])?@"YES":@"NO");
    //=>-[OOOAppDelegate method013] 0x6960 "../tmp/scratch.tiff" = NO
    
    
}

#pragma mark iOS NSString pathWithComponents
-(void)method014
{
    
    NSString *str1 = [NSString pathWithComponents:[NSArray arrayWithObjects:@"tmp",@"scratch.tiff", nil]];
    NSLog(@"%s %p , %@",__FUNCTION__,str1,str1);
    //=>-[OOOAppDelegate method014] 0x6a401d0 , tmp/scratch.tiff
    
    NSString *str2 = [NSString pathWithComponents:[NSArray arrayWithObjects:@"/",@"tmp",@"scratch.tiff", nil]];
    NSLog(@"%s %p , %@",__FUNCTION__,str2,str2);
    //=>-[OOOAppDelegate method014] 0x6827900 , /tmp/scratch.tiff
    
    NSString *str3 = [NSString pathWithComponents:[NSArray arrayWithObjects:@"tmp",@"scratch.tiff",@" ", nil]];
    NSLog(@"%s %p , %@",__FUNCTION__,str3,str3);
    //=>-[OOOAppDelegate method014] 0x6b3b600 , tmp/scratch.tiff/ 
    
    NSString *str4 = [NSString pathWithComponents:[NSArray arrayWithObjects:@"tmp",@"scratch.tiff",@"", nil]];
    NSLog(@"%s %p , %@",__FUNCTION__,str4,str4);
    //=>-[OOOAppDelegate method014] 0x687ad90 , tmp/scratch.tiff
    
    
}

#pragma mark iOS NSString pathComponents
-(void)method015
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"/tmp/scratch.tiff"];
    NSArray *anArray1 = [str1 pathComponents];
    NSLog(@"%s %p , %@",__FUNCTION__,str1,anArray1);
    //=>-[OOOAppDelegate method015] 0x6880 , ("/",tmp,"scratch.tiff")

    
    NSString *str2 = [[NSString alloc] initWithString:@"/tmp/"];
    NSArray *anArray2 = [str2 pathComponents];
    NSLog(@"%s %p , %@",__FUNCTION__,str2,anArray2);
    //=>-[OOOAppDelegate method015] 0x68b0 , ("/",tmp,"/")

    
    NSString *str3 = [[NSString alloc] initWithString:@"scratch.bundle/"];
    NSArray *anArray3 = [str3 pathComponents];
    NSLog(@"%s %p , %@",__FUNCTION__,str3,anArray3);
    //=>-[OOOAppDelegate method015] 0x6960 , ("scratch.bundle","/")

    
    NSString *str4 = [[NSString alloc] initWithString:@"scratch..tiff"];
    NSArray *anArray4 = [str4 pathComponents];
    NSLog(@"%s %p , %@",__FUNCTION__,str4,anArray4);
    //=>-[OOOAppDelegate method015] 0x6970 , ("scratch..tiff")

    
    NSString *str5 = [[NSString alloc] initWithString:@".tiff"];
    NSArray *anArray5 = [str5 pathComponents];
    NSLog(@"%s %p , %@",__FUNCTION__,str5,anArray5);
    //=>-[OOOAppDelegate method015] 0x6980 , (".tiff")

    
    NSString *str6 = [[NSString alloc] initWithString:@"/"];
    NSArray *anArray6 = [str6 pathComponents];
    NSLog(@"%s %p , %@",__FUNCTION__,str6,anArray6);
    //=>-[OOOAppDelegate method015] 0x68d0 , ("/")

    
    
}

#pragma mark iOS NSString stringByExpandingTildeInPath
-(void)method016
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"~/tmp/scratch.tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str1,[str1 stringByExpandingTildeInPath]);
    //=>-[OOOAppDelegate method016] 0x399d0 , /var/mobile/Applications/00000000-0000-0000-0000-000000000000/tmp/scratch.tiff
    
    NSString *str2 = [[NSString alloc] initWithString:@"/tmp/scratch.tiff"];
    NSLog(@"%s %p , %@",__FUNCTION__,str2,[str2 stringByExpandingTildeInPath]);
    //=>-[OOOAppDelegate method016] 0x39890 , /tmp/scratch.tiff
    
}

#pragma mark iOS NSString fileSystemRepresentation
-(void)method017
{
    
    NSString *str1 = [[NSString alloc] initWithString:@"~/tmp/scratch.tiff"];
    const char *str = [str1 fileSystemRepresentation];
    NSLog(@"%s %p , %s",__FUNCTION__,str1,str);
    //=>-[OOOAppDelegate method017] 0x539e8 , ~/tmp/scratch.tiff
    
}


#pragma mark stringWithContentsOfFile:encoding:error:

-(void)method018
{
    NSBundle *bundle = [NSBundle mainBundle ];
    
    NSString *resourcePath = [bundle resourcePath];
    NSString *filePath1 = [resourcePath stringByAppendingPathComponent:@"Textfile.txt"];
    NSLog(@"%s : %@",__FUNCTION__ ,resourcePath);
    NSError *error;
    NSString *output1 = [[NSString alloc] initWithContentsOfFile:filePath1 encoding: NSASCIIStringEncoding
                                                          error: &error];
    NSLog(@"%s %p , %@",__FUNCTION__,output1,output1);
    //Textfile.txtの内容はSample Text
    //=>-[OOOAppDelegate method018] 0x158940 , Sample Text
    
    NSString *filePath2 = [resourcePath stringByAppendingPathComponent:@"not exist.txt"];
    NSString *output2 = [[NSString alloc] initWithContentsOfFile:filePath2 encoding: NSASCIIStringEncoding
                                                           error: &error];
    NSLog(@"%s %p , %@",__FUNCTION__,output2,output2);
    NSLog(@"%s %p , %@",__FUNCTION__,error,[error localizedDescription]);
    //not exist.txtというファイルは存在しないのでエラーになる
    //=>-[OOOAppDelegate method018] 0x0 , (null)
    //=>-[OOOAppDelegate method018] 0x1690b0 , The operation couldn窶冲 be completed. (Cocoa error 260.)

    //error情報が要らなければerrorにNULLを渡す
    NSString *filePath3 = [resourcePath stringByAppendingPathComponent:@"not exist.txt"];
    NSString *output3 = [[NSString alloc] initWithContentsOfFile:filePath3 encoding: NSASCIIStringEncoding
                                                           error: NULL];
    NSLog(@"%s %p , %@",__FUNCTION__,output3,output3);

}
#pragma mark iOS NSString stringWithContentsOfFile:usedEncoding:error

-(NSString *)encodeString:(NSStringEncoding)encoding
{
    switch (encoding) {
        case NSASCIIStringEncoding:
            return @"NSASCIIStringEncoding";
        case NSNEXTSTEPStringEncoding:
            return @"NSNEXTSTEPStringEncoding";
        case NSJapaneseEUCStringEncoding:
            return @"NSJapaneseEUCStringEncoding";
        case NSUTF8StringEncoding:
            return @"NSUTF8StringEncoding";
        case NSISOLatin1StringEncoding:
            return @"NSISOLatin1StringEncoding";
        case NSSymbolStringEncoding:
            return @"NSSymbolStringEncoding";
        case NSNonLossyASCIIStringEncoding:
            return @"NSNonLossyASCIIStringEncoding";
        case NSShiftJISStringEncoding:
            return @"NSShiftJISStringEncoding";
        case NSISOLatin2StringEncoding:
            return @"NSISOLatin2StringEncoding";
        case NSUnicodeStringEncoding:
            return @"NSUnicodeStringEncoding";
        case NSWindowsCP1251StringEncoding:
            return @"NSWindowsCP1251StringEncoding";
        case NSWindowsCP1252StringEncoding:
            return @"NSWindowsCP1252StringEncoding";
        case NSWindowsCP1253StringEncoding:
            return @"NSWindowsCP1253StringEncoding";
        case NSWindowsCP1254StringEncoding:
            return @"NSWindowsCP1254StringEncoding";
        case NSWindowsCP1250StringEncoding:
            return @"NSWindowsCP1250StringEncoding";
        case NSISO2022JPStringEncoding:
            return @"NSISO2022JPStringEncoding";
        case NSMacOSRomanStringEncoding:
            return @"NSMacOSRomanStringEncoding";
        case NSUTF16BigEndianStringEncoding:
            return @"NSUTF16BigEndianStringEncoding";
        case NSUTF16LittleEndianStringEncoding:
            return @"NSUTF16LittleEndianStringEncoding";
        case NSUTF32StringEncoding:
            return @"NSUTF32StringEncoding";
        case NSUTF32BigEndianStringEncoding:
            return @"NSUTF32BigEndianStringEncoding";
        case NSUTF32LittleEndianStringEncoding:
            return @"NSUTF32LittleEndianStringEncoding";
        default:
            return @"Unknown Encoding";

    }
}
-(void)method019
{
    NSBundle *bundle = [NSBundle mainBundle ];
    
    NSString *resourcePath = [bundle resourcePath];
    NSString *filePath1 = [resourcePath stringByAppendingPathComponent:@"Textfile.txt"];
    NSLog(@"%s : %@",__FUNCTION__ ,resourcePath);
    NSError *error;
    NSStringEncoding encoding;
    NSString *output1 = [[NSString alloc] initWithContentsOfFile:filePath1 
                                                    usedEncoding:&encoding
                                                           error: &error];
    NSLog(@"%s %p , encode= %@ , %@ ",__FUNCTION__,output1,[self encodeString:encoding],output1);
    //=>-[OOOAppDelegate method019] 0x199580 , encode= NSUTF8StringEncoding , Sample Text 
    
}

#pragma mark iOS NSString stringWithContentsOfFile:usedEncoding:error
//未完成
-(void)method020
{
    NSBundle *bundle = [NSBundle mainBundle ];
    NSString *resourcePath = [bundle resourcePath];
    NSString *filePath1 = [resourcePath stringByAppendingPathComponent:@"Documents/writeTest.txt"];
    NSError *error;
    NSString *fileContents1 = [[NSString alloc] initWithString:@"This is write test file."];
    [fileContents1 writeToFile:filePath1 atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    
    NSLog(@"%s : %@ %@",__FUNCTION__ ,filePath1,[error localizedDescription]);
    
    NSStringEncoding encoding;
    NSString *output1 = [[NSString alloc] initWithContentsOfFile:filePath1 
                                                    usedEncoding:&encoding
                                                           error: &error];
    NSLog(@"%s %p , encode= %@ , %@ ",__FUNCTION__,output1,[self encodeString:encoding],output1);
    //=>-[OOOAppDelegate method019] 0x199580 , encode= NSUTF8StringEncoding , Sample Text 
    
}


#pragma mark initWithFormat:arguments:
-(void)method021
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    NSRange range = NSMakeRange(0, [aArray count]);
    
    NSMutableData* data = [NSMutableData dataWithLength: sizeof(id) * [aArray count]];
    
    [anOrderedSet getObjects: (__unsafe_unretained id *)data.mutableBytes range:range];
    
    NSString* content = [[NSString alloc] initWithFormat: @"1: %@ 2: %@ 3: %@"  arguments: data.mutableBytes];
    
    NSLog(@"%@", content);
    
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
