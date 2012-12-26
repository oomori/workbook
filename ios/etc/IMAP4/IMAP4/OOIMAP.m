//
//  OOIMAP.m
//
//  Created by 大森智史 on Thu May 20 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//
//IMAPアクセスのためのクラス　10.3以上が必要
//

#import "OOIMAP.h"

enum {
    IMAP_LOGIN			= 1,
    IMAP_USER			= 2,
    IMAP_PASS			= 3,
	POP3_STAT			= 4,
	POP3_TOP			= 5,
	POP3_RETR			= 6,
	IMAP_LOGOUT			= 7,
	IMAP_LIST			= 8,
	POP3_DELE			= 9,
	POP3_NOOP			= 10,
	POP3_RSET			= 11,
	POP3_UIDL			= 12,
	POP3_APOP			= 13,
	IMAP_CAPABILITY		=14
};

@implementation OOIMAP

@synthesize inputStream;
@synthesize outputStream;
@synthesize recieveData;



- (void)myAction
{

    //nCenterÇ…ÉIÉuÉUÅ[ÉoÅ[Çâ¡Ç¶ÇÈ
    [[NSNotificationCenter defaultCenter] addObserver:self//
                                             selector:@selector(handleIMAPRecieve:) //åƒÇ—èoÇ≥ÇÍÇÈÉÅÉ\ÉbÉh
                                                 name:@"OOMORI_IMAP_RECIEVE" //受信したら呼ぶ
                                               object:nil];
    NSUInteger portNo = 993;//143;//993;
    CFStringRef hostName = CFSTR("p02-imap.mail.me.com");
    
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
    //const char *request = "USER oomori%iris.eonet.ne.jp\r\n";
    
    //[outputStream write:(const uint8_t*)request maxLength:strlen(request)];
    
    
    NSLog(@"!!!s");




}
#pragma mark-
#pragma mark== IMAP コマンド　==

- (void)sendCapability
{	
	_data = nil;
    NSLog(@"send capability");
	[self outputCommand:[NSString stringWithFormat:@"a01 CAPABILITY\r\n"] commandCode: IMAP_CAPABILITY ];

}

- (void)sendUser:(NSString *)userNameString
{	
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"a01 LOGIN %@ %@\r\n",userName,passWord] commandCode: IMAP_USER ];

}
- (void)sendPassword:(NSString *)passwordString
{	
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"PASS %@\r\n",passwordString] commandCode: IMAP_PASS ];

}
- (void)logout
{	
	_data = nil;
	[self outputCommand:@"LOGUOT\r\n" commandCode: IMAP_LOGOUT ];

}
- (void)list
{	
	_data = nil;
	NSLog(@"---LIST");
	[self outputCommand:@"a02 LIST \"\" \"*\"\r\n" commandCode: IMAP_LIST ];
	

}
- (void)stat
{	
//Status: ROだと既に読み込まれた
	_data = nil;
	[self outputCommand:@"STAT\r\n" commandCode: POP3_STAT ];

}
//TOP
- (void)top:(int)start length:(int)length
{	
	//start　得たいメールの番号
	//length　得たい本文の行数
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"TOP %d %d\r\n",start,length] commandCode: POP3_TOP ];
}
- (void)letter:(int)messageNum
{	
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"RETR %d\r\n",messageNum] commandCode: POP3_RETR ];
}
- (void)sendDelete:(int)messageNum
{	//サーバから削除。すぐには削除されず、QUITメッセージを送った後に削除される
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"DELE %d\r\n",messageNum] commandCode: POP3_DELE ];
}
- (void)noop//何もしない
{	//
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"NOOP\r\n"] commandCode: POP3_NOOP ];
}
- (void)resetDelete//削除をとりけし
{	//
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"RSET\r\n"] commandCode: POP3_RSET ];
}
- (void)uidl:(int)messageNum//このメールのサーバ内でのIDを取得する
{	//
	_data = nil;
	[self outputCommand:[NSString stringWithFormat:@"UIDL %d\r\n",messageNum] commandCode: POP3_UIDL ];
}



//受信
#pragma mark-
#pragma mark== 受信　==
- (void)handleIMAPRecieve:(NSNotification *)notification
{
	NSString *str;

	if (_data != nil ){
	str = [[NSString alloc] initWithData:_data encoding:NSASCIIStringEncoding];
	}else{
	str = @"";
	}
	
	NSLog(@"handleIMAPRecieve");

	//送ったコマンドによって振り分け
	switch ([self currentCommand]){
	case IMAP_LOGIN://ログイン時
		{
			NSLog(@"login : %@",str);
			_data = nil;
			
			//[self sendCapability];
			[self sendUser:[self userName]];
			break;
		}
	case IMAP_CAPABILITY://ログイン時
		{
			NSLog(@"CAPABILITY : %@",str);
			_data = nil;
			NSLog(@"sendUser : %@",[self userName]);
			[self sendUser:[self userName]];
			break;
		}	
		
	case IMAP_USER://USERユーザ認証時のユーザ名の送信
		{
			if ([[str uppercaseString] hasPrefix:[@"a01 OK " uppercaseString]]){
				NSLog(@"USER : %@",str);
				_data = nil;
				//
				//[self sendPassword: [self passWord] ];
				
			}else{
				NSLog(@"USER : error %@",str);
				_data = nil;

				[self logout ];

			}
			
			
			break;
		}
	case IMAP_PASS://ユーザ認証
		{
			if ([[str uppercaseString] hasPrefix:@"+OK"]){
				NSLog(@"PASS : %@",str);
			}else{
				NSLog(@"PASS : error %@",str);
				[self quit ];
			}
			
			
			_data = nil;
			break;
			}
	case POP3_STAT:	//メールボックスのメール数とサイズの取得
		{
			NSLog(@"STAT : %@",str);
			_data = nil;
			break;
			}
	case POP3_TOP://指定したメッセージのヘッダと本文を指定した行数取得する
		{	
			if ([str hasSuffix:@"\r\n.\r\n"])
			{
			NSLog(@"TOP : %@",str);
			_data = nil;
			}
			break;
			}
	case POP3_RETR://指定したメールの取出し
		{	
			if ([str hasSuffix:@"\r\n.\r\n"])
			{
			NSLog(@"RETR : %@",str);
			_data = nil;
			}
			break;
			}
	case IMAP_LOGOUT://接続の終了
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
	case IMAP_LIST://ここのメールのリストの取得
		{	
			//NSLog(@"LIST : %@",str);
			if ([str hasSuffix:@"a02 OK Completed"])
			{
			NSLog(@"LIST : %@",str);
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
	case POP3_RSET://削除マークをつけたメールから削除マークを外す
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
		NSLog(@"APOP : %@",str);
		_data = nil;
		break;
			}		
	default:
			{
			NSLog(@"IMAP return : %@",str);
			}
		}			
/*


APOP
MD5で暗号化されたユーザ認証
*/

}




// 入力出力の切り替え
//
- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
	if (aStream == inputStream) {
        [self handleInputStreamEvent:eventCode stream:aStream ];
    } else if (aStream == outputStream) {
		
        [self handleOutputStreamEvent:eventCode stream:aStream];
    }
    //NSLog(@"stream");
}
//入力ストリームの処理
- (void)handleInputStreamEvent:(NSStreamEvent)eventCode stream:(NSStream *)aStream 
{
    switch (eventCode) {
	   
        case NSStreamEventHasBytesAvailable:
				{
				NSLog(@"iNSStreamEventHasBytesAvailable");
		
					if(!_data) {

						_data = [NSMutableData data] ;

					}
					
					uint8_t buf[1024];

					unsigned int len = 0;
					if ([(NSInputStream *)aStream hasBytesAvailable]) 
						{
						
						len = [(NSInputStream *)aStream read:buf maxLength:1024];
						
						
						[_data appendBytes:(const void *)buf length:len];
						
						//NSLog(@"iData : %@",[[NSString alloc] initWithData:_data encoding:NSASCIIStringEncoding]);
						//通知を作る
						NSNotification *notifi = [NSNotification notificationWithName:@"OOMORI_IMAP_RECIEVE" object:nil];
								
								//NSASCIIStringEncoding　7ビットASCIIエンコード
								//NSISO2022JPStringEncoding　ISO2022日本語エンコード（電子メールなど）
								
						
						//通知センターに通知を送る
						
						
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
			
		//ストリームの終わり
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
            // ストリームを開いたら
			{
			NSLog(@"oNSStreamEventOpenCompleted");
			 
			//ログインする
			[self setCurrentCommand: IMAP_LOGIN ];//@"login"
			

            break;

			}

            break;
        case NSStreamEventNone:
			NSLog(@"oNSStreamEventNone");
            break;

		case NSStreamEventHasSpaceAvailable:
            //ストリームにデータを書き込める
			NSLog(@"oNSStreamEventHasSpaceAvailable");
            break;
			
		//ストリームの終わり
		case NSStreamEventEndEncountered:
			NSLog(@"oNSStreamEventEndEncountered");

			
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
	NSLog(@"oData : %@",[[NSString alloc] initWithData:_data encoding:NSASCIIStringEncoding]);
    //NSLog(@"handleOutputStreamEvent:");
	
}
//コマンドを送信
-(void)outputCommand:(NSString *)command commandCode:(int)commandCode
{
				NSLog(@"command output : %@",command);
				
                const uint8_t * rawstring = 

                    (const uint8_t *)[command UTF8String];

                [oStream write:rawstring maxLength:strlen(rawstring)]; 

				[self setCurrentCommand:commandCode];

}

#pragma mark-
#pragma mark== アクセッサメソッド　==
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


@end
