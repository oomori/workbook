//
//  OOOPOP3.h
//  NSStream
//
//  Created by 大森 智史 on 2012/09/04.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OOOPOP3 : NSObject<NSStreamDelegate>{

        
        NSString *userName;		//ÉÜÅ[ÉUÅ[ñº
        NSString *passWord;		//ÉpÉXÉèÅ[Éh
        NSString *currentHost;  //ÉzÉXÉg
        
        NSString *topString;
        
        NSString *bodyString;
        
        //NSInputStream *inputStream;
        //NSOutputStream *outputStream;
        NSOutputStream *oStream;
        NSOutputStream *oStream2;
        NSInputStream *iStream;
        NSMutableData *_data;
        NSMutableDictionary *headerDictionary;//ÉwÉbÉ_ÇÃé´èë
        
        
        int currentCommand;//íºãﬂÇÃÉRÉ}ÉìÉh
        int serverMailCount;//ÉTÅ[Éoè„ÇÃÉÅÅ[Éãêî
    }
    //- (IBAction)testMD5:(id)sender;
    - (void)myAction;
    //POP3ÉRÉ}ÉìÉhëóêM
    
    -(NSString *)convertOpenSSL:(NSString *)key;
    
    - (void)sendAPOP:(NSString *)userNameString hash:(NSString *)hash;
    - (void)sendUser:(NSString *)userName;
    - (void)sendPassword:(NSString *)passwordString;
    - (void)list;
    - (void)quit;
    - (void)stat;
    - (void)letter:(int)messageNum;
    - (void)sendDelete:(int)messageNum;
    - (void)top:(int)start length:(int)length;
    - (void)noop;
    - (void)resetDelete;
    - (void)uidl:(int)messageNum;
    
    //éÛêM
    - (void)handlePop3Recieve:(NSNotification *)notification;
    
    - (void)handleInputStreamEvent:(NSStreamEvent)eventCode  stream:(NSStream *)aStream ;
    - (void)handleOutputStreamEvent:(NSStreamEvent)eventCode  stream:(NSStream *)aStream ;
    
    -(void)pop3RecieveComplete:(id)sender;
    
    //ëóêM
    -(void)outputCommand:(NSString *)command commandCode:(int)commandCode;
    
    //ÉAÉNÉZÉbÉTÉÅÉ\ÉbÉh
	-(void)setCurrentCommand:(int)command;
	-(int)currentCommand;
    //
	-(void)setUserName:(NSString *)name;
	-(NSString *)userName;
    //
	-(void)setPassWord:(NSString *)name;
	-(NSString *)passWord;
    //
	-(void)setTopString:(NSString *)name;
	-(NSString *)topString;
    //
	-(void)setBodyString:(NSString *)name;
	-(NSString *)bodyString;
    //
	-(void)setHeaderDictionary:(NSMutableDictionary *)name;
	-(NSMutableDictionary *)headerDictionary;
    //
	-(void)setServerMailCount:(int)mailCount;
	-(int)serverMailCount;
    //currentHost
	-(void)setCurrentHost:(NSString *)name;
	-(NSString *)currentHost;
@property (strong, nonatomic) NSInputStream *inputStream;
@property (strong, nonatomic) NSOutputStream *outputStream;

@property (strong, nonatomic) NSMutableData *recieveData;
    @end
