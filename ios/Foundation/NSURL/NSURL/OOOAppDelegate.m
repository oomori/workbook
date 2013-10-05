//
//  OOOAppDelegate.m
//  NSURL
//
//  Created by 大森 智史 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;
@synthesize receivedData;



#pragma mark NSArray indexOfObjectPassingTest:
- (void)connection:(NSURLConnection *)connection 
didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"didReceiveResponse");
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection 
    didReceiveData:(NSData *)data
{
    NSLog(@"didReceiveData");
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection 
  didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError Error - %@ %@",
          [error localizedDescription],
          [error userInfo][NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoading Received %d bytes of data",[receivedData length]);
    NSLog(@"%@", [[NSString alloc]initWithData:receivedData
                                      encoding:NSUTF8StringEncoding]);
}



#pragma mark NSURL URLWithString:

-(void)method001
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *url = [NSURL URLWithString:@"http://www.apple.com/"];
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
	} else {
		NSLog(@"error: %@", anError);
	}    
}
#pragma mark NSURL URLWithString:

-(void)method002
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:@"www.apple.com" path:@"/index.html"];
    
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
	} else {
		NSLog(@"error: %@", anError);
	}    
}

#pragma mark NSURL URLWithString:
-(void)method003
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *url = [[NSURL alloc] initWithString:@"http://www.apple.com/"];
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
	} else {
		NSLog(@"error: %@", anError);
	}    
}

#pragma mark NSURL URLWithString:
-(void)method004
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *baseUrl = [NSURL URLWithString:@"http://www.apple.com/"];

    NSString *pathString = @"index.html";
    NSString *encodedString = 
    (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                 (__bridge CFStringRef)pathString,
                                                                 NULL,
                                                                 (CFStringRef)@";,/?:@&=+$#",
                                                                 kCFStringEncodingUTF8);
    NSLog(@"%s %@",__FUNCTION__,encodedString);
    //=>target%20strings
    
    NSURL *url = [NSURL URLWithString:encodedString
                        relativeToURL:baseUrl];
    
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
	} else {
		NSLog(@"error: %@", anError);
	}    
}

#pragma mark NSURL URLWithString:
-(void)method005
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *baseUrl = [NSURL URLWithString:@"http://www.apple.com/"];
    
    NSString *pathString = @"index.html";
    NSString *encodedString = 
    (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                 (__bridge CFStringRef)pathString,
                                                                 NULL,
                                                                 (CFStringRef)@";,/?:@&=+$#",
                                                                 kCFStringEncodingUTF8);
    NSLog(@"%s %@",__FUNCTION__,encodedString);
    //=>target%20strings
    
    NSURL *url = [[NSURL alloc ]initWithString:encodedString
                        relativeToURL:baseUrl];
    
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
	} else {
		NSLog(@"error: %@", anError);
	}   
}



#pragma mark NSURL initFileURLWithPath:
-(void)method006
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

#pragma mark NSURL initFileURLWithPath:
-(void)method007
{
    
    NSData *bData ;
    //NSCharacterSet *chrSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSCharacterSet *chrSet = [[NSCharacterSet characterSetWithRange:NSMakeRange(0x41,1)] invertedSet];
    bData = [chrSet bitmapRepresentation] ;

    //
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *aURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];

    
    
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

#pragma mark NSURL URLWithString:
-(void)method008
{
    
    //作成中
    //NSHTTPURLResponse *aResponse;
	//NSError *anError;
    
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    NSLog(@"aurl: %@", [absoluteURL description]);
    NSData *bookmark = [absoluteURL bookmarkDataWithOptions:NSURLBookmarkCreationSuitableForBookmarkFile
                             
                             includingResourceValuesForKeys:nil
                                              relativeToURL:nil
                                                      error:NULL];
    
    NSURL *url = [NSURL URLByResolvingBookmarkData:bookmark 
                                           options:NSURLBookmarkResolutionWithoutUI 
                                     relativeToURL:nil
                               bookmarkDataIsStale:NULL error:NULL];
    
    NSLog(@"url: %@", [url description]);
    NSData *bData ;
    //NSCharacterSet *chrSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSCharacterSet *chrSet = [[NSCharacterSet characterSetWithRange:NSMakeRange(0x41,1)] invertedSet];
    bData = [chrSet bitmapRepresentation] ;
	//データ書き出し
    NSLog(([bData writeToURL:url atomically:YES])?@"YES":@"NO");
    
    //ビットマップをチェック
    //1114112文字分(0x10FFFF)
    NSData *cData = [NSData dataWithContentsOfURL:url];
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

#pragma mark NSURL URLWithString:
-(void)method009
{

	NSURL *aUrl = [[NSURL alloc] initWithString:@"http://www.apple.com/index.html"];
    NSURL *baseUrl = [NSURL URLWithString:@"http://www.apple.com/"];
    
    NSString *pathString = @"aaa/bbb/index.html?123";
    
    __block NSMutableArray *resultArray =  [NSMutableArray arrayWithCapacity:0];
    NSArray *pathArray = [pathString pathComponents];
    [pathArray enumerateObjectsWithOptions:NSEnumerationConcurrent
                              usingBlock:^(id s,NSUInteger idx,BOOL *stop){
                                  NSString *encodedString = 
                                  (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                (__bridge CFStringRef)pathString,
                                                NULL,(CFStringRef)@";,/?:@&=+$#",
                                            kCFStringEncodingUTF8);
                                  [resultArray addObject:encodedString];
                              }]; 
    
        
    
    
    NSURL *bUrl = [NSURL URLWithString:[NSString pathWithComponents:pathArray]
                        relativeToURL:baseUrl];
    NSURL *cUrl = [[NSURL alloc] initWithScheme: @"http"
                                        host: @"www.apple.com"
                                        path: @"/index.html"];
    NSLog(@"%s  %@",__FUNCTION__,[aUrl description]);
    NSLog(@"%s  %@",__FUNCTION__,[bUrl description]);
    NSLog(@"%s  %@",__FUNCTION__,[cUrl description]);
    NSLog(@"%s  a%@b",__FUNCTION__,([aUrl isEqual:bUrl])?@"=":@"≠");
    NSLog(@"%s  a%@c",__FUNCTION__,([aUrl isEqual:cUrl])?@"=":@"≠");
    NSLog(@"%s  b%@c",__FUNCTION__,([bUrl isEqual:cUrl])?@"=":@"≠");
}

#pragma mark NSURL URLWithString:
-(void)method010
{
	NSError *anError;
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    if ([absoluteURL checkResourceIsReachableAndReturnError:&anError]) {
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
    }else {
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
    }
}

#pragma mark NSURL URLWithString:
-(void)method011
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];

    
    NSLog(@"%s %@",__FUNCTION__,([absoluteURL isFileReferenceURL])?@"YES":@"NO");
}

#pragma mark NSURL isFileURL
-(void)method012
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSLog(@"%s %@",__FUNCTION__,([absoluteURL isFileURL])?@"YES":@"NO");
}

#pragma mark NSURL absoluteURL
-(void)method013
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *aUrl = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSLog(@"%s %@",__FUNCTION__,[aUrl absoluteURL]);
}

#pragma mark NSURL absoluteString
-(void)method014
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *aUrl = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    NSLog(@"%s %@",__FUNCTION__,[aUrl absoluteString]);
}

#pragma mark NSURL baseURL
-(void)method015
{
    NSURL *baseUrl = [[NSURL alloc] initWithString:@"http://www.apple.com"];
    NSURL *aUrl = [NSURL URLWithString:@"/index.html"
                         relativeToURL:baseUrl];
    NSLog(@"%s %@",__FUNCTION__,[aUrl baseURL]);
}

#pragma mark NSURL fragment
-(void)method016
{
    NSURL *baseUrl = [[NSURL alloc] initWithString:@"http://www.apple.com"];
    NSURL *aUrl = [NSURL URLWithString:@"/index.html#123"
                         relativeToURL:baseUrl];
    NSLog(@"%s %@",__FUNCTION__,[aUrl fragment]);
}

#pragma mark NSURL host
-(void)method017
{
    NSURL *baseUrl = [[NSURL alloc] initWithString:@"http://www.apple.com"];
    NSURL *aUrl = [NSURL URLWithString:@"/index.html#123"
                         relativeToURL:baseUrl];
    NSLog(@"%s %@",__FUNCTION__,[aUrl host]);
}

#pragma mark NSURL scheme
-(void)method018
{
    NSURL *baseUrl = [[NSURL alloc] initWithString:@"http://www.apple.com"];
    NSURL *aUrl = [NSURL URLWithString:@"/index.html#123"
                         relativeToURL:baseUrl];
    NSLog(@"%s %@",__FUNCTION__,[aUrl scheme]);
}

#pragma mark NSURL user
-(void)method019
{
    NSURL *aUrl = [NSURL URLWithString:@"ftp://user:password@www.oomori.com/index.html"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl user]);
}

#pragma mark NSURL password
-(void)method020
{
    NSURL *aUrl = [NSURL URLWithString:@"ftp://user:password@www.oomori.com/index.html"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl password]);
}

#pragma mark NSURL port
-(void)method021
{
    NSURL *aUrl = [NSURL URLWithString:@"http://www.oomori.com:8080/index.html"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl port]);
}

#pragma mark NSURL query
-(void)method022
{
    NSURL *aUrl = [NSURL URLWithString:@"http://www.oomori.com/index.html?name=oomori&age=44"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl query]);
}

#pragma mark NSURL pathExtension
-(void)method023
{
    NSURL *aUrl = [NSURL URLWithString:@"http://www.oomori.com/index.html?name=oomori&age=44"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl pathExtension]);
}

#pragma mark NSURL relativePath
-(void)method024
{
    NSURL *aUrl = [NSURL URLWithString:@"http://www.oomori.com/index.html"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl relativePath]);
    //=>/index.html

	NSURL *baseUrl = [NSURL URLWithString:@"http://www.oomori.com/"];
    NSString *pathString = @"index.html";
    
    NSURL *bURL = [NSURL URLWithString:pathString relativeToURL:baseUrl];
    NSLog(@"%s %@",__FUNCTION__,[bURL relativePath]);
    //=>index.html
    
}

#pragma mark NSURL relativeString
-(void)method025
{
    NSURL *aURL = [NSURL URLWithString:@"http://www.oomori.com/index.html"];
    NSLog(@"%s %@",__FUNCTION__,[aURL relativeString]);
    //=>http://www.oomori.com/index.html
    
	NSURL *baseUrl = [NSURL URLWithString:@"http://www.oomori.com/"];
    NSString *pathString = @"index.html";
    
    NSURL *bURL = [NSURL URLWithString:pathString relativeToURL:baseUrl];
    NSLog(@"%s %@",__FUNCTION__,[bURL relativeString]);
    //=>index.html
}
#pragma mark NSURL relativeString
-(void)method026
{
    NSURL *aUrl = [NSURL URLWithString:@"http://www.oomori.com/index.html?name=oomori&age=44"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl resourceSpecifier]);
}

#pragma mark NSURL relativeString
-(void)method027
{
    NSURL *aUrl = [NSURL URLWithString:@"./testWritecharset.bitmap"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl standardizedURL]);
    NSLog(@"%s %@",__FUNCTION__,[aUrl relativeString]);

}
#pragma mark NSURL lastPathComponent
-(void)method028
{
    NSURL *aUrl = [NSURL URLWithString:@"http://www.oomori.com/index.html?name=oomori&age=44"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl lastPathComponent]);
}

#pragma mark NSURL parameterString
-(void)method029
{
    NSURL *aUrl = [NSURL URLWithString:@"http://www.oomori.com/index.html;param?name=oomori&age=44"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl parameterString]);
}

#pragma mark NSURL path
-(void)method030
{
    NSURL *aUrl = [NSURL URLWithString:@"http://www.oomori.com/index.html;param?name=oomori&age=44"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl path]);
}

#pragma mark NSURL path
-(void)method031
{
    NSURL *aUrl = [NSURL URLWithString:@"http://www.oomori.com/index.html;param?name=oomori&age=44"];
    NSLog(@"%s %@",__FUNCTION__,[aUrl pathComponents]);
}

#pragma mark NSURL filePathURL
-(void)method032
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    
    NSURL *bURL = [NSURL URLWithString:@"http://www.oomori.com/index.html?name=oomori&age=44"];
    NSLog(@"%s %@",__FUNCTION__,[bURL filePathURL]);
    
}

#pragma mark NSURL filePathURL
-(void)method033
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL fileReferenceURL]);
    NSURL *bURL = [NSURL URLWithString:@"http://www.oomori.com/index.html?name=oomori&age=44"];
    NSLog(@"%s %@",__FUNCTION__,[bURL filePathURL]);
}

#pragma mark NSURL URLByAppendingPathComponent
-(void)method034
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, @"aaa"]];

    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    NSURL *newURL = [absoluteURL URLByAppendingPathComponent:filename];
    NSLog(@"%s %@",__FUNCTION__,[newURL filePathURL]);
}

#pragma mark NSURL URLByAppendingPathComponent
-(void)method035
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, @"aaa"]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    //=>-[OOOAppDelegate method035] file://localhost/Users/xxxxx/Library/Application%20Support/iPhone%20Simulator/5.1/Applications/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/Documents/aaa
    
    NSURL *newURL = [absoluteURL URLByAppendingPathComponent:@"dir" isDirectory:YES];
    NSLog(@"%s %@",__FUNCTION__,[newURL filePathURL]);
    //=>-[OOOAppDelegate method035] file://localhost/Users/xxxxxxx/Library/Application%20Support/iPhone%20Simulator/5.1/Applications/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/Documents/aaa/dir/
    
    NSURL *newNewURL = [newURL URLByAppendingPathComponent:filename];
    NSLog(@"%s %@",__FUNCTION__,[newNewURL filePathURL]);
    //=>-[OOOAppDelegate method035] file://localhost/Users/xxxxxxx/Library/Application%20Support/iPhone%20Simulator/5.1/Applications/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/Documents/aaa/dir/testWritecharset.bitmap
    
}

#pragma mark NSURL URLByAppendingPathComponent
-(void)method036
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    NSURL *newURL = [absoluteURL URLByAppendingPathExtension:@"bitmap"];
    NSLog(@"%s %@",__FUNCTION__,[newURL filePathURL]);
}

#pragma mark NSURL URLByDeletingLastPathComponent
-(void)method037
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    NSURL *newURL = [absoluteURL URLByDeletingLastPathComponent];
    NSLog(@"%s %@",__FUNCTION__,[newURL filePathURL]);
}

#pragma mark NSURL URLByDeletingLastPathComponent
-(void)method038
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    NSURL *newURL = [absoluteURL URLByDeletingPathExtension];
    NSLog(@"%s %@",__FUNCTION__,[newURL filePathURL]);
}

#pragma mark NSURL URLByResolvingSymlinksInPath
-(void)method039
{
    //作成中
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    NSURL *newURL = [absoluteURL URLByResolvingSymlinksInPath];
    NSLog(@"%s %@",__FUNCTION__,[newURL filePathURL]);
}

#pragma mark NSURL URLByStandardizingPath
-(void)method040
{
    //作成中
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    NSURL *newURL = [absoluteURL URLByStandardizingPath];
    NSLog(@"%s %@",__FUNCTION__,[newURL filePathURL]);
}

#pragma mark NSURL URLByStandardizingPath
-(void)method041
{
    //作成中
    NSError *anError;
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    NSURL *resultURL;
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    
    NSData *bookmarkData = [NSURL bookmarkDataWithContentsOfURL: absoluteURL error:&anError];
    if (bookmarkData)
    {
        BOOL isStale = NO;
        NSURLBookmarkResolutionOptions options =
                    (NSURLBookmarkResolutionWithoutUI | NSURLBookmarkResolutionWithoutMounting); 
        
        NSURL* resolvedURL = [NSURL 
                              URLByResolvingBookmarkData:bookmarkData
                              options:options
                              relativeToURL:nil
                              bookmarkDataIsStale:&isStale
                              error:&anError];
        if (resolvedURL)
        {
            resultURL = resolvedURL;
        }
        NSLog(@"%s %@",__FUNCTION__,[resolvedURL description]);
        NSLog(@"%s %@",__FUNCTION__,[resultURL description]);
    }

    
        
}

#pragma mark NSURL URLByStandardizingPath
- (NSData *)bookmarkFromURL:(NSURL *)url {
    NSData *bookmark = [url bookmarkDataWithOptions:NSURLBookmarkCreationMinimalBookmark
                     includingResourceValuesForKeys:NULL
                                      relativeToURL:NULL
                                              error:NULL];
    return bookmark;
}

- (NSURL *)urlFromBookmark:(NSData *)bookmark {
    NSURL *url = [NSURL URLByResolvingBookmarkData:bookmark
                                           options:NSURLBookmarkResolutionWithoutUI
                                     relativeToURL:NULL
                               bookmarkDataIsStale:NO
                                             error:NULL];
    return url;
}

-(void)method042
{
    //作成中
    
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    NSString *testFileName = @"testfile.alias";
    NSURL *newURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, testFileName]];
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    NSData *bData = [self bookmarkFromURL:absoluteURL];
    NSError *anError = nil;

    NSLog(@"%s %@1",__FUNCTION__,([NSURL writeBookmarkData:bData toURL:newURL options:NSURLBookmarkCreationMinimalBookmark error:&anError])?@"write OK":@"write NG");
    
    //NSLog(@"%s %@",__FUNCTION__,[bData description]);
    NSURL *cURL = [self urlFromBookmark:bData];
    NSLog(@"%s %@",__FUNCTION__,[cURL description]);
    
    NSError *error = nil;
    NSNumber *fileSizeBytes;
    [newURL getResourceValue:&fileSizeBytes forKey:NSURLFileSizeKey error:&error];
    NSLog(@"Error===%@",error); 
    NSLog(@"size of file in bytes ===%@",fileSizeBytes);
}

#pragma mark NSURL :
-(void)method043
{
    
    NSString *path = @"~/testWritecharset.bitmap";//ユーザーディレクトリのトップのtestWritecharset.bitmapというファイルへ
    NSData *bData ;
    //NSCharacterSet *chrSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSCharacterSet *chrSet = [[NSCharacterSet characterSetWithRange:NSMakeRange(0x41,1)] invertedSet];
    bData = [chrSet bitmapRepresentation] ;
    NSURL *aURL = [[NSURL alloc] initFileURLWithPath:[path stringByExpandingTildeInPath]];
    //データ書き出し
    NSLog(([bData writeToURL:aURL atomically:YES])?@"YES":@"NO");
    
    NSError *error = nil;
    NSNumber *fileSizeBytes;
    [aURL getResourceValue:&fileSizeBytes forKey:NSURLFileSizeKey error:&error];
    NSLog(@"Error===%@",error); 
    NSLog(@"size of file in bytes ===%@",fileSizeBytes);
    //NSLog(@"%s %@",__FUNCTION__,mString);
    
}

#pragma mark NSURL resourceValuesForKeys:error:
-(void)method044
{
    
    NSString *path = @"~/testWritecharset.bitmap";//ユーザーディレクトリのトップのtestWritecharset.bitmapというファイルへ
    NSData *bData ;
    //NSCharacterSet *chrSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSCharacterSet *chrSet = [[NSCharacterSet characterSetWithRange:NSMakeRange(0x41,1)] invertedSet];
    bData = [chrSet bitmapRepresentation] ;
    NSURL *aURL = [[NSURL alloc] initFileURLWithPath:[path stringByExpandingTildeInPath]];
    //データ書き出し
    NSLog(([bData writeToURL:aURL atomically:YES])?@"YES":@"NO");
    
    NSError *error = nil;
    NSNumber *fileSizeBytes;
    NSDictionary *dic = [aURL resourceValuesForKeys:@[NSURLFileSizeKey,NSURLFileAllocatedSizeKey]  error:&error];
    NSLog(@"Error===%@",error); 
    NSLog(@"size of file in bytes ===%@",fileSizeBytes);
    NSLog(@"%s %@",__FUNCTION__,[dic description]);
    
}

#pragma mark NSURL resourceValuesForKeys:error:
-(void)method045
{
    //作成中
    
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    
    //NSString *testFileName = @"testfile.alias";
    
    NSLog(@"%s %@",__FUNCTION__,[absoluteURL filePathURL]);
    NSData *bData = [self bookmarkFromURL:absoluteURL];

    
    NSDictionary *dic =[NSURL resourceValuesForKeys:@[NSURLNameKey,NSURLLocalizedNameKey,NSURLTypeIdentifierKey] fromBookmarkData:bData];
    
    NSLog(@"%s %@",__FUNCTION__,[dic description]);
}

#pragma mark NSURL resourceValuesForKeys:error:
-(void)method046
{
    
    NSString *path = @"~/testWritecharset.bitmap";//ユーザーディレクトリのトップのtestWritecharset.bitmapというファイルへ
    NSData *bData ;
    //NSCharacterSet *chrSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSCharacterSet *chrSet = [[NSCharacterSet characterSetWithRange:NSMakeRange(0x41,1)] invertedSet];
    bData = [chrSet bitmapRepresentation] ;
    NSURL *aURL = [[NSURL alloc] initFileURLWithPath:[path stringByExpandingTildeInPath]];
    //データ書き出し
    NSLog(([bData writeToURL:aURL atomically:YES])?@"write YES":@"write NO");
    
    NSError *error = nil;
    NSDictionary *dic = [aURL resourceValuesForKeys:@[NSURLFileSizeKey,NSURLFileAllocatedSizeKey,NSURLNameKey]  error:&error];
    NSLog(@"%s %@",__FUNCTION__,[dic description]);
    
    
    NSLog(([aURL setResourceValue:@"テスト" forKey:NSURLLocalizedNameKey error:&error])?@"YES":@"NO");

    NSDictionary *dic2 = [aURL resourceValuesForKeys:@[NSURLFileSizeKey,NSURLFileAllocatedSizeKey,NSURLNameKey]  error:&error];
    NSLog(@"%s %@",__FUNCTION__,[dic2 description]);

}

#pragma mark NSURL resourceValuesForKeys:error:
-(void)method047
{
    
    NSString *path = @"~/testWritecharset.bitmap";//ユーザーディレクトリのトップのtestWritecharset.bitmapというファイルへ
    NSData *bData ;
    //NSCharacterSet *chrSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSCharacterSet *chrSet = [[NSCharacterSet characterSetWithRange:NSMakeRange(0x41,1)] invertedSet];
    bData = [chrSet bitmapRepresentation] ;
    NSURL *aURL = [[NSURL alloc] initFileURLWithPath:[path stringByExpandingTildeInPath]];
    //データ書き出し
    NSLog(([bData writeToURL:aURL atomically:YES])?@"writeToURL YES":@"writeToURLNO");
    
    NSError *error = nil;
    NSDictionary *dic = [aURL resourceValuesForKeys:@[NSURLFileSizeKey,NSURLFileAllocatedSizeKey,NSURLNameKey]  error:&error];
    NSLog(@"%s %@",__FUNCTION__,[dic description]);
    
    NSDictionary *propDic = @{NSURLLocalizedNameKey: @"テスト"};
    NSLog(([aURL setResourceValues:propDic error:&error])?@"setResourceValues YES":@"setResourceValues NO");
    
    NSDictionary *dic2 = [aURL resourceValuesForKeys:@[NSURLFileSizeKey,NSURLFileAllocatedSizeKey,NSURLNameKey]  error:&error];
    NSLog(@"%s %@",__FUNCTION__,[dic2 description]);
    
}

#pragma mark NSURL NSDocumentDirectory
-(void)method048
{

    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *bUrl = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    NSLog(@"%s %@",__FUNCTION__,[bUrl relativeString]);
}

#pragma mark NSURL NSDocumentDirectory

-(void)method049
{
    //作成中
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    NSLog(@"aurl: %@", [absoluteURL description]);
    NSData *bookmark = [absoluteURL bookmarkDataWithOptions:NSURLBookmarkCreationSuitableForBookmarkFile
                        
                             includingResourceValuesForKeys:nil
                                              relativeToURL:nil
                                                      error:NULL];
    
    NSURL *url = [NSURL URLByResolvingBookmarkData:bookmark
                                           options:NSURLBookmarkResolutionWithoutUI
                                     relativeToURL:nil
                               bookmarkDataIsStale:NULL error:NULL];
    

    NSURL* resultURL = [url URLByResolvingSymlinksInPath];
    
    
    
    //
    NSError* error = nil;
    NSNumber* isAliasFile = nil;
    BOOL success = [resultURL getResourceValue:&isAliasFile
                                        forKey:NSURLIsAliasFileKey
                                         error:&error];
    if (success && [isAliasFile boolValue])
    {
        NSData* bookmarkData = [NSURL bookmarkDataWithContentsOfURL:resultURL
                                                              error:&error];
        if (bookmarkData)
        {
            BOOL isStale = NO;
            NSURLBookmarkResolutionOptions options =
            (NSURLBookmarkResolutionWithoutUI | NSURLBookmarkResolutionWithoutMounting);
            
            NSURL* resolvedURL = [NSURL
                                  URLByResolvingBookmarkData:bookmarkData
                                  options:options
                                  relativeToURL:nil
                                  bookmarkDataIsStale:&isStale
                                  error:&error];
            if (resolvedURL)
            {
                resultURL = resolvedURL;
            }
        }
    }

    
    NSLog(@"%s %@",__FUNCTION__,([isAliasFile boolValue])?@"YES":@"NO");
}
#pragma mark NSURL ファイル属性
//NSURLTotalFileAllocatedSizeKey
-(void)method050
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* totalFileAllocatedSize = nil;
    [absoluteURL getResourceValue:&totalFileAllocatedSize
                                        forKey:NSURLTotalFileAllocatedSizeKey
                                         error:&error];
   
    NSLog(@"%s %@ , %d",__FUNCTION__,[totalFileAllocatedSize class],[totalFileAllocatedSize integerValue]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method051
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSString* URLNameKey = nil;
    [absoluteURL getResourceValue:&URLNameKey
                           forKey:NSURLNameKey
                            error:&error];
    
    NSLog(@"%s %@",__FUNCTION__,URLNameKey);
}
#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method052
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSString* URLLocalizedNameKey = nil;
    [absoluteURL getResourceValue:&URLLocalizedNameKey
                           forKey:NSURLLocalizedNameKey
                            error:&error];
    
    NSLog(@"%s %@",__FUNCTION__,URLLocalizedNameKey);
}
#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method053
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* isRegularFileKey = nil;
    [absoluteURL getResourceValue:&isRegularFileKey
                           forKey:NSURLIsRegularFileKey
                            error:&error];
    
    NSLog(@"%s %@",__FUNCTION__,([isRegularFileKey boolValue])?@"isRegularFileKey ?YES":@"NO");
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method054
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* isDirectoryKey = nil;
    [absoluteURL getResourceValue:&isDirectoryKey
                           forKey:NSURLIsDirectoryKey
                            error:&error];
    
    NSLog(@"%s %@",__FUNCTION__,([isDirectoryKey boolValue])?@"isDirectoryKey? YES":@"NO");
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method055
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* isSymbolicLinkKey = nil;
    [absoluteURL getResourceValue:&isSymbolicLinkKey
                           forKey:NSURLIsSymbolicLinkKey
                            error:&error];
    
    NSLog(@"%s %@",__FUNCTION__,([isSymbolicLinkKey boolValue])?@"YES":@"NO");
}
#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method056
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLIsVolumeKey = nil;
    [absoluteURL getResourceValue:&URLIsVolumeKey
                           forKey:NSURLIsVolumeKey
                            error:&error];
    
    NSLog(@"%s %@",__FUNCTION__,([URLIsVolumeKey boolValue])?@"YES":@"NO");
}
#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method057
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSDate* URLCreationDateKey = nil;
    [absoluteURL getResourceValue:&URLCreationDateKey
                           forKey:NSURLCreationDateKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLCreationDateKey class],[URLCreationDateKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method058
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSDate* URLContentAccessDateKey = nil;
    [absoluteURL getResourceValue:&URLContentAccessDateKey
                           forKey:NSURLContentAccessDateKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLContentAccessDateKey class],[URLContentAccessDateKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method059
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSDate* URLContentAccessDateKey = nil;
    [absoluteURL getResourceValue:&URLContentAccessDateKey
                           forKey:NSURLContentAccessDateKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLContentAccessDateKey class],[URLContentAccessDateKey description]);
}
#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method060
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSDate* URLContentModificationDateKey = nil;
    [absoluteURL getResourceValue:&URLContentModificationDateKey
                           forKey:NSURLContentModificationDateKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLContentModificationDateKey class],[URLContentModificationDateKey description]);
}
#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method061
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSDate* URLAttributeModificationDateKey = nil;
    [absoluteURL getResourceValue:&URLAttributeModificationDateKey
                           forKey:NSURLAttributeModificationDateKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLAttributeModificationDateKey class],[URLAttributeModificationDateKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method062
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLLinkCountKey = nil;
    [absoluteURL getResourceValue:&URLLinkCountKey
                           forKey:NSURLLinkCountKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLLinkCountKey class],[URLLinkCountKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method063
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSURL* URLParentDirectoryURLKey = nil;
    [absoluteURL getResourceValue:&URLParentDirectoryURLKey
                           forKey:NSURLParentDirectoryURLKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLParentDirectoryURLKey class],[URLParentDirectoryURLKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method064
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSURL* URLVolumeURLKey = nil;
    [absoluteURL getResourceValue:&URLVolumeURLKey
                           forKey:NSURLVolumeURLKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLVolumeURLKey class],[URLVolumeURLKey description]);
}
#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method065
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSURL* URLTypeIdentifierKey = nil;
    [absoluteURL getResourceValue:&URLTypeIdentifierKey
                           forKey:NSURLTypeIdentifierKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLTypeIdentifierKey class],[URLTypeIdentifierKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method066
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSURL* URLLocalizedTypeDescriptionKey = nil;
    [absoluteURL getResourceValue:&URLLocalizedTypeDescriptionKey
                           forKey:NSURLLocalizedTypeDescriptionKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLLocalizedTypeDescriptionKey class],[URLLocalizedTypeDescriptionKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method067
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLLabelNumberKey = nil;
    [absoluteURL getResourceValue:&URLLabelNumberKey
                           forKey:NSURLLabelNumberKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLLabelNumberKey class],[URLLabelNumberKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method068
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    BOOL result = NO;
    result = [absoluteURL setResourceValue:[UIColor redColor] forKey:NSURLLabelColorKey
                            error:&error];
    NSLog(@"%s %@",__FUNCTION__,(result)?@"YES":@"NO");
    id URLLabelColorKey = nil;
    [absoluteURL getResourceValue:&URLLabelColorKey
                           forKey:NSURLLabelColorKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLLabelColorKey class],[URLLabelColorKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method069
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSString* URLLocalizedLabelKey = nil;
    [absoluteURL getResourceValue:&URLLocalizedLabelKey
                           forKey:NSURLLocalizedLabelKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLLocalizedLabelKey class],[URLLocalizedLabelKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method070
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    UIImage *anImage= [UIImage imageNamed:@"iconimage"];
    NSError* error = nil;
    BOOL result = NO;
    result = [absoluteURL setResourceValue:anImage forKey:NSURLEffectiveIconKey
                                     error:&error];
    NSLog(@"%s %@",__FUNCTION__,(result)?@"YES":@"NO");
    
    
    id URLEffectiveIconKey = nil;
    [absoluteURL getResourceValue:&URLEffectiveIconKey
                           forKey:NSURLEffectiveIconKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLEffectiveIconKey class],[URLEffectiveIconKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method071
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    UIImage *anImage= [UIImage imageNamed:@"iconimage"];
    NSError* error = nil;
    BOOL result = NO;
    result = [absoluteURL setResourceValue:anImage forKey:NSURLCustomIconKey
                                     error:&error];
    NSLog(@"%s %@",__FUNCTION__,(result)?@"YES":@"NO");
    id URLCustomIconKey = nil;
    [absoluteURL getResourceValue:&URLCustomIconKey
                           forKey:NSURLCustomIconKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLCustomIconKey class],[URLCustomIconKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method072
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSData* URLFileResourceIdentifierKey = nil;
    [absoluteURL getResourceValue:&URLFileResourceIdentifierKey
                           forKey:NSURLFileResourceIdentifierKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLFileResourceIdentifierKey class],[URLFileResourceIdentifierKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method073
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSData* URLVolumeIdentifierKey = nil;
    [absoluteURL getResourceValue:&URLVolumeIdentifierKey
                           forKey:NSURLVolumeIdentifierKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLVolumeIdentifierKey class],[URLVolumeIdentifierKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method074
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLPreferredIOBlockSizeKey = nil;
    [absoluteURL getResourceValue:&URLPreferredIOBlockSizeKey
                           forKey:NSURLPreferredIOBlockSizeKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLPreferredIOBlockSizeKey class],[URLPreferredIOBlockSizeKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method075
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLIsReadableKey = nil;
    [absoluteURL getResourceValue:&URLIsReadableKey
                           forKey:NSURLIsReadableKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLIsReadableKey class],[URLIsReadableKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method076
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLIsWritableKey = nil;
    [absoluteURL getResourceValue:&URLIsWritableKey
                           forKey:NSURLIsWritableKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLIsWritableKey class],[URLIsWritableKey description]);
}
#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method077
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLIsExecutableKey = nil;
    [absoluteURL getResourceValue:&URLIsExecutableKey
                           forKey:NSURLIsExecutableKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLIsExecutableKey class],[URLIsExecutableKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method078
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLIsMountTriggerKey = nil;
    [absoluteURL getResourceValue:&URLIsMountTriggerKey
                           forKey:NSURLIsMountTriggerKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLIsMountTriggerKey class],[URLIsMountTriggerKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method079
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLFileSecurityKey = nil;
    [absoluteURL getResourceValue:&URLFileSecurityKey
                           forKey:NSURLFileSecurityKey
                            error:&error];
    NSFileSecurity *fs = [[NSFileSecurity alloc] init];
    NSLog(@"%s %@,%@",__FUNCTION__,[fs class],[fs description]);

    NSLog(@"%s %@,%@",__FUNCTION__,[URLFileSecurityKey class],[URLFileSecurityKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method080
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLIsExcludedFromBackupKey = nil;
    [absoluteURL getResourceValue:&URLIsExcludedFromBackupKey
                           forKey:NSURLIsExcludedFromBackupKey
                            error:&error];


    NSLog(@"%s %@,%@",__FUNCTION__,[URLIsExcludedFromBackupKey class],[URLIsExcludedFromBackupKey description]);
}
#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method081
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLFileResourceTypeKey = nil;
    [absoluteURL getResourceValue:&URLFileResourceTypeKey
                           forKey:NSURLFileResourceTypeKey
                            error:&error];

    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLFileResourceTypeKey class],[URLFileResourceTypeKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method082
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLFileResourceTypeKey = nil;
    [absoluteURL getResourceValue:&URLFileResourceTypeKey
                           forKey:NSURLFileResourceTypeKey
                            error:&error];
    
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLFileResourceTypeKey class],[URLFileResourceTypeKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method083
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLIsUbiquitousItemKey = nil;
    [absoluteURL getResourceValue:&URLIsUbiquitousItemKey
                           forKey:NSURLIsUbiquitousItemKey
                            error:&error];
    
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLIsUbiquitousItemKey class],[URLIsUbiquitousItemKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method084
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLVolumeIsEjectableKey = nil;
    [absoluteURL getResourceValue:&URLVolumeIsEjectableKey
                           forKey:NSURLVolumeIsEjectableKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLVolumeIsEjectableKey class],[URLVolumeIsEjectableKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method085
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSNumber* URLVolumeIsInternalKey = nil;
    [absoluteURL getResourceValue:&URLVolumeIsInternalKey
                           forKey:NSURLVolumeIsInternalKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLVolumeIsInternalKey class],[URLVolumeIsInternalKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method086
{
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSString* URLVolumeUUIDStringKey = nil;
    [absoluteURL getResourceValue:&URLVolumeUUIDStringKey
                           forKey:NSURLVolumeUUIDStringKey
                            error:&error];
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLVolumeUUIDStringKey class],[URLVolumeUUIDStringKey description]);
}

#pragma mark NSURL ファイル属性
//NSURLNameKey
-(void)method087
{
    /*
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filename = @"testWritecharset.bitmap";
    
     NSURL *absoluteURL = [NSURL fileURLWithPathComponents:@[documentsDirectory, filename]];
    //
    NSError* error = nil;
    NSString* URLUbiquitousItemPercentUploadedKey = nil;
    
    [absoluteURL getResourceValue:&URLUbiquitousItemPercentUploadedKey
                           forKey:NSURLUbiquitousItemPercentUploadedKey
                            error:&error];
    
    //NSURLUbiquitousItemPercentUploadedKey（転送率）はiOS6.0で非推奨です。
    //NSMetadataItemでは NSMetadataQuery と NSMetadataUbiquitousItemPercentUploadedKey を使います。
    
    NSLog(@"%s %@,%@",__FUNCTION__,[URLUbiquitousItemPercentUploadedKey class],[URLUbiquitousItemPercentUploadedKey description]);
     */
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
    [self method047];
    [self method048];
    [self method049];
    [self method050];
    [self method051];
    [self method052];
    [self method053];
    [self method054];
    [self method055];
    [self method056];
    [self method057];
    [self method058];
    [self method059];
    [self method060];
    [self method061];
    [self method062];
    [self method063];
    [self method064];
    [self method065];
    [self method066];
    [self method067];
    [self method068];
    [self method069];
    [self method070];
    [self method071];
    [self method072];
    [self method073];
    [self method074];
    [self method075];
    [self method076];
    [self method077];
    [self method078];
    [self method079];
    [self method080];
    [self method081];
    [self method082];
    
    [self method083];
    [self method084];
    [self method085];
    [self method086];
    
    [self method087];
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
