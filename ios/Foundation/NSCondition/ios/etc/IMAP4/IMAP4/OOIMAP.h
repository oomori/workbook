//
//  OOIMAP.h
//
//  Created by 大森智史 on Thu May 20 2004.
//  Copyright (c) 2004 大森智史. All rights reserved.
//
//IMAPアクセスのためのクラス　10.3以上が必要
//

#import <Foundation/Foundation.h>


@interface OOIMAP : NSObject<NSStreamDelegate> {
	//IBOutlet id myOutlet;
	//NSSecureTextField * passwordField;
	NSString *userName;
	NSString *passWord;
	
    NSInputStream *inputStream;
	NSOutputStream *outputStream;
	NSOutputStream *oStream;
	NSOutputStream *oStream2;
    NSInputStream *iStream;
	NSMutableData *_data;
	
	int currentCommand;//直近のコマンド

}
//- (IBAction)testMD5:(id)sender;
- (void)myAction;
//POP3コマンド送信
- (void)sendCapability;
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

//受信
- (void)handlePop3Recieve:(NSNotification *)notification;

- (void)handleInputStreamEvent:(NSStreamEvent)eventCode  stream:(NSStream *)aStream ;
- (void)handleOutputStreamEvent:(NSStreamEvent)eventCode  stream:(NSStream *)aStream ;



//送信
-(void)outputCommand:(NSString *)command commandCode:(int)commandCode;

//アクセッサメソッド
-(void)setCurrentCommand:(int)command;
-(int)currentCommand;
-(void)setUserName:(NSString *)name;
-(NSString *)userName;
-(void)setPassWord:(NSString *)name;
-(NSString *)passWord;


@property (strong, nonatomic) NSInputStream *inputStream;
@property (strong, nonatomic) NSOutputStream *outputStream;

@property (strong, nonatomic) NSMutableData *recieveData;

@end
