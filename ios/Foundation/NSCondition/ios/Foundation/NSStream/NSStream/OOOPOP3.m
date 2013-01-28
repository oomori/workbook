//
//  OOOPOP3.m
//  NSStream
//
//  Created by 大森 智史 on 2012/09/04.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOPOP3.h"
#import <CommonCrypto/CommonDigest.h> // for CC_MD5

enum {
    POP3_LOGIN			= 1,
    POP3_USER			= 2,
    POP3_PASS			= 3,
	POP3_STAT			= 4,
	POP3_TOP			= 5,
	POP3_RETR			= 6,
	POP3_QUIT			= 7,
	POP3_LIST			= 8,
	POP3_DELE			= 9,
	POP3_NOOP			= 10,
	POP3_RSET			= 11,
	POP3_UIDL			= 12,
	POP3_APOP			= 13
};

@implementation OOOPOP3

@synthesize inputStream;
@synthesize outputStream;
@synthesize recieveData;

-(void)awakeFromNib
{
    
}

- (void)myAction
{
    
    //nCenterÇ…ÉIÉuÉUÅ[ÉoÅ[Çâ¡Ç¶ÇÈ
    [[NSNotificationCenter defaultCenter] addObserver:self//Ç±ÇÍÇåƒÇ—èoÇ∑
                                             selector:@selector(handlePop3Recieve:) //åƒÇ—èoÇ≥ÇÍÇÈÉÅÉ\ÉbÉh
                                                 name:@"OOMORI_POP3_RECIEVE" //POP3ÉfÅ[É^ÇéÛÇØéÊÇ¡ÇΩ
                                               object:nil];
    NSUInteger portNo = 995;
    CFStringRef hostName = CFSTR("pops.eonet.ne.jp");
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    CFStreamCreatePairWithSocketToHost(NULL, hostName, portNo, &readStream, &writeStream);
    
    assert(CFGetRetainCount(readStream) == 1L);
    assert(CFGetRetainCount(writeStream) == 1L);
    
    self.inputStream = (__bridge_transfer NSInputStream*) readStream;
    self.outputStream = (__bridge_transfer NSOutputStream*) writeStream;
    
    [inputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream setDelegate:self];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    if ([inputStream streamStatus] == NSStreamStatusNotOpen){
    [inputStream open];
    }
    
    if ([outputStream streamStatus] == NSStreamStatusNotOpen){
    [outputStream open];
    }
    
    BOOL useSSL = YES;
    if (useSSL)
    {
        [inputStream setProperty:NSStreamSocketSecurityLevelNegotiatedSSL
                       forKey:NSStreamSocketSecurityLevelKey];
        [outputStream setProperty:NSStreamSocketSecurityLevelNegotiatedSSL
                        forKey:NSStreamSocketSecurityLevelKey];
        
    }
    const char *request = "USER oomori%iris.eonet.ne.jp\r\n";
    
    [outputStream write:(const uint8_t*)request maxLength:strlen(request)];
    
    
    NSLog(@"!!!s");
    
}
#pragma mark-
#pragma mark== POP3 ÉRÉ}ÉìÉhÅ@==
- (void)sendAPOP:(NSString *)userNameString hash:(NSString *)hash
{
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"APOP %@ %@",userName,hash] commandCode: POP3_APOP ];
	NSLog(@"APOP %@ %@\r\n",userNameString,hash);
}
- (void)sendUser:(NSString *)userNameString
{
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"USER %@\r\n",userName] commandCode: POP3_USER ];
    
}
- (void)sendPassword:(NSString *)passwordString
{
	_data = nil;
	NSLog(@"send pass");
	[self outputCommand:[NSString stringWithFormat:@"PASS %@\r\n",passWord] commandCode: POP3_PASS ];
    
}
- (void)quit
{
	_data = nil;
	[self outputCommand:@"QUIT\r\n" commandCode: POP3_QUIT ];
    
}
- (void)list
{
	_data = nil;
	[self outputCommand:@"LIST\r\n" commandCode: POP3_LIST ];
    
}
- (void)stat
{
    //Status: ROÇæÇ∆ä˘Ç…ì«Ç›çûÇ‹ÇÍÇΩ
	_data = nil;
	[self outputCommand:@"STAT\r\n" commandCode: POP3_STAT ];
    
}
//TOP
- (void)top:(int)start length:(int)length
{
	//startÅ@ìæÇΩÇ¢ÉÅÅ[ÉãÇÃî‘çÜ
	//lengthÅ@ìæÇΩÇ¢ñ{ï∂ÇÃçsêî
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"TOP %d %d\r\n",start,length] commandCode: POP3_TOP ];
}
- (void)letter:(int)messageNum
{
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"RETR %d\r\n",messageNum] commandCode: POP3_RETR ];
}
- (void)sendDelete:(int)messageNum
{	//ÉTÅ[ÉoÇ©ÇÁçÌèúÅBÇ∑ÇÆÇ…ÇÕçÌèúÇ≥ÇÍÇ∏ÅAQUITÉÅÉbÉZÅ[ÉWÇëóÇ¡ÇΩå„Ç…çÌèúÇ≥ÇÍÇÈ
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"DELE %d\r\n",messageNum] commandCode: POP3_DELE ];
}
- (void)noop//âΩÇ‡ÇµÇ»Ç¢
{	//
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"NOOP\r\n"] commandCode: POP3_NOOP ];
}
- (void)resetDelete//çÌèúÇÇ∆ÇËÇØÇµ
{	//
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"RSET\r\n"] commandCode: POP3_RSET ];
}
- (void)uidl:(int)messageNum//Ç±ÇÃÉÅÅ[ÉãÇÃÉTÅ[Éoì‡Ç≈ÇÃIDÇéÊìæÇ∑ÇÈ
{	//
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"UIDL %d\r\n",messageNum] commandCode: POP3_UIDL ];
}
-(NSString *)convertMG5:(NSString *)key
{
    const char *cStr = [key UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
/*
-(NSString *)convertOpenSSL:(NSString *)key
{
    NSTask *task;
    task = [[NSTask alloc] init];
	
	[task setLaunchPath: @"/bin/sh"];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-c",
                 //[NSString stringWithFormat:@"echo \"%s\" | openssl dgst -md5",[key cString]],
                 [NSString stringWithFormat:@"md5 -q -s \"%s\"",[key cString]],
                 
                 nil];
    
	
	[task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data
                                   encoding: NSUTF8StringEncoding];//NSASCIIStringEncoding//NSUTF8StringEncoding
    
	return string;
}
*/
//éÛêM
#pragma mark-
#pragma mark== éÛêMÅ@==
- (void)handlePop3Recieve:(NSNotification *)notification
{
	NSString *str;
    
	if (_data != nil ){
        str = [[NSString alloc] initWithData:_data encoding:NSISO2022JPStringEncoding ];
	}else{
        str = @"";
	}
	
    NSLog(@"handlePop3Recieve");
    
	//ëóÇ¡ÇΩÉRÉ}ÉìÉhÇ…ÇÊÇ¡ÇƒêUÇËï™ÇØ
	switch ([self currentCommand]){
        case POP3_LOGIN://ÉçÉOÉCÉìéû
		{
			NSLog(@"login : %@",str);
			_data = nil;
			
            /*
			if ([str rangeOfString:@"<"].location != NSNotFound){
                NSLog(@"!%d",[str rangeOfString:@"<"]);
				[self sendAPOP:[self userName] hash:
                 [self convertMG5:
                  [NSString stringWithFormat:@"%@%@",
                   [str substringWithRange:NSMakeRange([str rangeOfString:@"<"].location,[str rangeOfString:@">"].location-[str rangeOfString:@"<"].location+1)]
                   ,[self passWord]
                   ]]
                 ];
			}else{
            */
				[self sendUser:[self userName]];
				
			//}
            
            
			
			break;
		}
        case POP3_USER://
		{
			if ([[str uppercaseString] hasPrefix:@"+OK"]){
				NSLog(@"USER : %@",str);
				_data = nil;
				//
				
				[self sendPassword: [self passWord] ];
				
			}else{
				NSLog(@"USER : error %@",str);
				_data = nil;
                
				[self quit ];
                
			}
			
			
			break;
		}
        case POP3_PASS://
		{
			if ([[str uppercaseString] hasPrefix:@"+OK"]){
				NSLog(@"PASS : %@",str);
			}else if([[str uppercaseString] hasPrefix:@"-ERR"]){
                NSLog(@"PASS : -ERR %@ %@",str,notification);
				[self quit ];
                
                
            }else{
				NSLog(@"PASS : error %@ %@",str,notification);
				[self quit ];
			}
			
			NSNotification *notifi = [NSNotification notificationWithName:@"OOMORI_POP3_PASS" object:self];
			//
			[[NSNotificationCenter defaultCenter] postNotification:notifi];
			_data = nil;
			break;
        }
        case POP3_STAT:	//
		{
			NSLog(@"STAT : %@",str);
			_data = nil;
			break;
        }
        case POP3_TOP://éwíËÇµÇΩÉÅÉbÉZÅ[ÉWÇÃÉwÉbÉ_Ç∆ñ{ï∂ÇéwíËÇµÇΩçsêîéÊìæÇ∑ÇÈ
		{
			if ([str hasSuffix:@"\r\n.\r\n"])
			{
                NSLog(@"TOP : %@",str);
                [self setTopString:	str ];
                //í ímÇçÏÇÈ
                NSNotification *notifi = [NSNotification notificationWithName:@"OOMORI_POP3_TOP" object:self];
                //í ímÉZÉìÉ^Å[Ç…í ímÇëóÇÈ
                [[NSNotificationCenter defaultCenter] postNotification:notifi];
				
                
                _data = nil;
			}
			break;
        }
        case POP3_RETR://éwíËÇµÇΩÉÅÅ[ÉãÇÃéÊèoÇµ
		{
			if ([str hasSuffix:@"\r\n.\r\n"])
			{
                //NSLog(@"RETR : %@",str);
                
                //ñ{ï∂Ç∆ÉwÉbÉ_Çï™ÇØÇÈ
                NSArray *arrayheader = [str componentsSeparatedByString:@"\r\n\r\n"];
                
                //ÉwÉbÉ_ÇåüçıÇµÇƒïKóvÇ»çÄñ⁄ÇêÿÇËï™ÇØÇÈ
                if ([arrayheader count] >1 ){
                    
                    //ÉwÉbÉ_ÇÃé´èë
                    headerDictionary = [ NSMutableDictionary dictionaryWithCapacity:1 ];
                    //ÉwÉbÉ_
                    NSString *header = [arrayheader objectAtIndex:0];
                    
                    //
                    NSEnumerator *aObjEnumerator = [[header componentsSeparatedByString:@"\r\n"] objectEnumerator];//é´èëÉLÅ[óÒãìéq
                    
                    NSMutableString *beforeCommand = [ NSMutableString stringWithCapacity:1 ];
                    id obj;
                    while ((obj = [aObjEnumerator nextObject])) {
                        
                        
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"	" lowercaseString]]){
                            [headerDictionary setObject:[NSString stringWithFormat:@"%@\r%@",(NSString *)[headerDictionary valueForKey:beforeCommand],(NSString *)obj] forKey:beforeCommand];
                            //NSLog(beforeCommand);
                        }
                        
                        //from
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"From: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"From: " length]] forKey:@"from"];
                            [beforeCommand setString:@"from"];
                        }
                        //Subject
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Subject: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Subject: " length]] forKey:@"subject"];
                            [beforeCommand setString:@"subject"];
                        }
                        //Content-Type
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Content-Type: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Content-Type: " length]] forKey:@"content-type"];
                            [beforeCommand setString:@"content-type"];
                        }
                        //Delivered-To:
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Delivered-To: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Delivered-To: " length]] forKey:@"delivered-to"];
                            [beforeCommand setString:@"delivered-to"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Return-Path: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Return-Path: " length]] forKey:@"return-path"];
                            [beforeCommand setString:@"return-path"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"MINE-Version: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"MINE-Version: " length]] forKey:@"mine-version"];
                            [beforeCommand setString:@"mine-version"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Content-Transfer-Encoding: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Content-Transfer-Encoding: " length]] forKey:@"content-transfer-encoding"];
                            [beforeCommand setString:@"content-transfer-encoding"];
                        }
                        //To
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"To: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"To: " length]] forKey:@"to"];
                            [beforeCommand setString:@"to"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Message-Id: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Message-Id: " length]] forKey:@"message-id"];
                            [beforeCommand setString:@"message-id"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Date: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Date: " length]] forKey:@"date"];
                            [beforeCommand setString:@"date"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Status: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Status: " length]] forKey:@"status"];
                            [beforeCommand setString:@"status"];
                        }
                        
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Precedence: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Precedence: " length]] forKey:@"precedence"];
                            [beforeCommand setString:@"precedence"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Reply-To: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Reply-To: " length]] forKey:@"reply-to"];
                            [beforeCommand setString:@"reply-to"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"List-Id: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"List-Id: " length]] forKey:@"list-id"];
                            [beforeCommand setString:@"list-id"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"List-Unsubscribe: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"List-Unsubscribe: " length]] forKey:@"list-unsubscribe"];
                            [beforeCommand setString:@"list-unsubscribe"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"List-Post: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"List-Post: " length]] forKey:@"list-post"];
                            [beforeCommand setString:@"list-post"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"List-Help: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"List-Help: " length]] forKey:@"list-help"];
                            [beforeCommand setString:@"list-help"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"List-Subscribe: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"List-Subscribe: " length]] forKey:@"list-subscribe"];
                            [beforeCommand setString:@"list-subscribe"];
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Sender: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Sender: " length]] forKey:@"sender"];
                            [beforeCommand setString:@"sender"];
                            
                        }
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"Errors-To: " lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"Errors-To: " length]] forKey:@"errors-to"];
                            [beforeCommand setString:@"errors-to"];
                        }
                        
                        
                        //
                        if ([[(NSString *)obj lowercaseString] hasPrefix:[@"x-" lowercaseString]]){
                            [headerDictionary setObject:[(NSString *)obj substringFromIndex:[@"x-: " length]] forKey:@"x-"];
                            [beforeCommand setString:@"x-"];
                            //substringToIndex
                        }
                        
                        
                        
                        
                        
                        
                        //contentsTypeÇ™
                        /*
                         if ([contentsType compare:@"text/plain; Charset=iso-2022-jp"] == NSOrderedSame){
                         NSLog([headerFrom stringByAddingPercentEscapesUsingEncoding:NSISO2022JPStringEncoding]);
                         NSLog(headerFrom );
                         }
                         */
                        //NSLog(header);
                        
                        //[image lockFocus];
                        //[thePath appendBezierPathWithRect:NSMakeRect(0,0,10,10)];
                        //[theColor set];
                        //[thePath fill];
                        //[image unlockFocus];
						/*
                         [mailTable addObject:
                         [NSMutableDictionary dictionaryWithObjectsAndKeys:
                         image,@"check",
                         //[subNodePath pathExtension],@"sender",
                         headerFrom,@"sender",//ëóêMé“
                         headerSubject,@"subject",//ÉTÉuÉWÉFÉNÉg
                         subNodePath,@"filepath",//ÉtÉ@ÉCÉãÉpÉX
                         nil]
                         ];
                         */
                    }
                    
                    [self setBodyString:	str ];
                    
                    //í ímÇçÏÇÈ
                    NSNotification *notifi = [NSNotification notificationWithName:@"OOMORI_POP3_RETR" object:self];
                    //í ímÉZÉìÉ^Å[Ç…í ímÇëóÇÈ
                    [[NSNotificationCenter defaultCenter] postNotification:notifi];
                    
                    
                    NSLog(@"%@",[headerDictionary description]);
                }
                
                _data = nil;
			}
			break;
        }
        case POP3_QUIT://ê⁄ë±ÇÃèIóπ
		{
            
            if ([[str uppercaseString] hasPrefix:@"+OK"]){
				NSLog(@"QUIT : %@",str);
				_data = nil;
                
                [oStream close];
				// [oStream release];
			}else{
				NSLog(@"QUIT : error %@",str);
			}
            
            [self setCurrentCommand:0];
            
            
            _data = nil;
            //[oStream close];
            break;
        }
        case POP3_LIST://Ç±Ç±ÇÃÉÅÅ[ÉãÇÃÉäÉXÉgÇÃéÊìæ
		{
			
			if ([str hasSuffix:@"\r\n.\r\n"])
			{
                
                //ñ{ï∂Ç∆ÉwÉbÉ_Çï™ÇØÇÈ
                NSArray *listArray = [str componentsSeparatedByString:@"\r\n"];
                NSLog(@"LIST : %@",[listArray description]);
                NSLog(@"LIST count: %d",[listArray count]-3);
                [self setServerMailCount:[listArray count]-3];
                NSNotification *notifi = [NSNotification notificationWithName:@"OOMORI_POP3_LIST" object:self];
                //í ímÉZÉìÉ^Å[Ç…í ímÇëóÇÈ
                [[NSNotificationCenter defaultCenter] postNotification:notifi];
                
                _data = nil;
			}
            
			break;
        }
        case POP3_DELE:
		{
            if ([[str uppercaseString] hasPrefix:@"+OK"]){
                NSLog(@"DELE : %@",str);
            }
            _data = nil;
            break;
        }
        case POP3_NOOP:
		{
            NSLog(@"NOOP : %@",str);
            _data = nil;
            break;
        }
        case POP3_RSET://çÌèúÉ}Å[ÉNÇÇ¬ÇØÇΩÉÅÅ[ÉãÇ©ÇÁçÌèúÉ}Å[ÉNÇäOÇ∑
		{
            if ([[str uppercaseString] hasPrefix:@"+OK"]){
                NSLog(@"RSET : %@",str);
            }
            _data = nil;
            break;
        }
        case POP3_UIDL:
		{
            NSLog(@"UIDL : %@",str);
            _data = nil;
            
            break;
        }
        case POP3_APOP:
		{
            
            if ([[str uppercaseString] hasPrefix:@"+OK"]){
                NSLog(@"APOP : %@",str);
                /*
                NSNotification *notifi = [NSNotification notificationWithName:@"OOMORI_POP3_PASS" object:self];
                //í ímÉZÉìÉ^Å[Ç…í ímÇëóÇÈ
                [[NSNotificationCenter defaultCenter] postNotification:notifi];
                */
                _data = nil;
                sleep(1);
                [self outputCommand:[NSString stringWithFormat:@"USER %@\r\n",userName] commandCode: POP3_USER ];
            }
			
			
            _data = nil;
            break;
        }
        default:
        {
			NSLog(@"pop3 data : %@",str);
        }
    }
    /*
     
     
     APOP
     MD5Ç≈à√çÜâªÇ≥ÇÍÇΩÉÜÅ[ÉUîFèÿ
     */
    
}




// ì¸óÕèoóÕÇÃêÿÇËë÷Ç¶
//
- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
	//NSLog(@"stream!!!s %@",[aStream description]);
    if (aStream == inputStream) {
        [self handleInputStreamEvent:eventCode stream:aStream ];
        //NSLog(@"in stream!!!s");
    } else if (aStream == outputStream) {
		//NSLog(@"out stream!!!s");
        [self handleOutputStreamEvent:eventCode stream:aStream];
    }
    
}
//ì¸óÕÉXÉgÉäÅ[ÉÄÇÃèàóù
- (void)handleInputStreamEvent:(NSStreamEvent)eventCode stream:(NSStream *)aStream
{
    switch (eventCode) {
            
        case NSStreamEventHasBytesAvailable:
        {
            //NSLog(@"iNSStreamEventHasBytesAvailable");
            
            if(!_data) {
                
                _data = [NSMutableData data];
                
            }
            
            uint8_t buf[1024];
            
            unsigned int len = 0;
            if ([(NSInputStream *)aStream hasBytesAvailable]) 
            {
                
                len = [(NSInputStream *)aStream read:buf maxLength:1024];
                
                
                [_data appendBytes:(const void *)buf length:len];
                
                
                //í ímÇçÏÇÈ
                NSNotification *notifi = [NSNotification notificationWithName:@"OOMORI_POP3_RECIEVE" object:nil];
                
                //NSASCIIStringEncodingÅ@7ÉrÉbÉgASCIIÉGÉìÉRÅ[Éh
                //NSISO2022JPStringEncodingÅ@ISO2022ì˙ñ{åÍÉGÉìÉRÅ[ÉhÅiìdéqÉÅÅ[ÉãÇ»Ç«Åj
                
                
                //í ímÉZÉìÉ^Å[Ç…í ímÇëóÇÈ
                
                
                [[NSNotificationCenter defaultCenter] postNotification:notifi];
                
                
                //[_data release];
                //_data = nil;
                
                
            }
            break;
            
        }
		case NSStreamEventNone:
			NSLog(@"iNSStreamEventNone");
            break;
            
		case NSStreamEventHasSpaceAvailable:
			NSLog(@"NSStreamEventHasSpaceAvailable");
            break;
			
            //ÉXÉgÉäÅ[ÉÄÇÃèIÇÌÇË
		case NSStreamEventEndEncountered:
			NSLog(@"iNSStreamEventEndEncountered");
			
            _data = nil;	
            break;
        case NSStreamEventOpenCompleted:
            //NSLog(@"iNSStreamEventOpenCompleted");
            break;
            
        case NSStreamEventErrorOccurred:
            NSLog(@"NSStreamEventErrorOccurred");
			NSLog(@"i streamError %@",[[aStream streamError] description]);
            break;
		default:
            NSLog(@"i default");
			break;
    }
	
    //NSLog(@"handleInputStreamEvent:");
}
- (void)handleOutputStreamEvent:(NSStreamEvent)eventCode  stream:(NSStream *)aStream 
{
    switch (eventCode) {
        case NSStreamEventHasBytesAvailable:
            NSLog(@"oNSStreamEventHasBytesAvailable");
            //[self readBytes];
            break;
        case NSStreamEventOpenCompleted:
            // ÉXÉgÉäÅ[ÉÄÇäJÇ¢ÇΩÇÁ
        {
			//NSLog(@"oNSStreamEventOpenCompleted");
            
			//ÉçÉOÉCÉìÇ∑ÇÈ
			[self setCurrentCommand: POP3_LOGIN ];//@"login"
			
            
            break;
            
        }
            
            break;
        case NSStreamEventNone:
			NSLog(@"oNSStreamEventNone");
            break;
            
		case NSStreamEventHasSpaceAvailable:
			//NSLog(@"oNSStreamEventHasSpaceAvailable");
            break;
			
            //ÉXÉgÉäÅ[ÉÄÇÃèIÇÌÇË
		case NSStreamEventEndEncountered:
			NSLog(@"oNSStreamEventEndEncountered");
            
			NSLog(@"oData : %@",[[NSString alloc] initWithData:_data encoding:NSASCIIStringEncoding]);
            //[_data release];
            break;
            
            
        case NSStreamEventErrorOccurred:
            NSLog(@"An error occurred on the output stream.");
            NSLog(@"o streamError %@",[[oStream streamError] description]);
			
            break;
		default:
			NSLog(@"o default");
			break;
            
    }
	
    //NSLog(@"handleOutputStreamEvent:");
	
}
//ÉRÉ}ÉìÉhÇëóêM
-(void)outputCommand:(NSString *)command commandCode:(int)commandCode
{
    NSLog(@"command output : %@",command);
    
    const uint8_t * rawstring = 
    
    (const uint8_t *)[command UTF8String];
    
    [oStream write:rawstring maxLength:strlen((const char *)rawstring)];
    
    [self setCurrentCommand:commandCode];
    
}

#pragma mark-
#pragma mark== ÉAÉNÉZÉbÉTÉÅÉ\ÉbÉhÅ@==
-(void)setCurrentCommand:(int)command
{
	currentCommand = command;
}
-(int)currentCommand
{
	return currentCommand  ;
}

-(void)setUserName:(NSString *)name
{
	userName = name;
}
-(NSString *)userName
{
	return userName  ;
}

-(void)setPassWord:(NSString *)name
{
	passWord = name;
}
-(NSString *)passWord
{
	return passWord  ;
}
-(void)setTopString:(NSString *)name
{
	topString = name;
}
-(NSString *)topString
{
	return topString  ;
}
-(void)setBodyString:(NSString *)name
{
	bodyString = name;
}
-(NSString *)bodyString
{
	return bodyString  ;
}
-(void)setHeaderDictionary:(NSMutableDictionary *)name
{
	headerDictionary = [name copy];
}
-(NSMutableDictionary *)headerDictionary
{
	return [headerDictionary copy]  ;
}
-(void)setServerMailCount:(int)mailCount
{
	serverMailCount = mailCount;
}
-(int)serverMailCount
{
	return serverMailCount  ;
}
-(void)setCurrentHost:(NSString *)name
{
	currentHost = name;
}
-(NSString *)currentHost
{
	return currentHost  ;
}

@end
