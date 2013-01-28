//
//  OOOViewController.m
//  NSTimer
//
//  Created by 大森 智史 on 2012/09/08.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

#pragma mark


NSTimer *timer = nil;
-(void) timerControl:(id)sender{
	NSLog(@"%s ...",__FUNCTION__);
}

- (IBAction)method001:(id)sender {

    //メソッドシグネチャ
	NSMethodSignature* aSignature ;
	//起動オブジェクト
    NSInvocation *invocation ;
	//セレクタ
    SEL aSelector  = @selector( timerControl: );
	//メソッドシグネチャ
    aSignature = [ self methodSignatureForSelector:aSelector ];
    //起動オブジェクトを作る
	invocation = [ NSInvocation invocationWithMethodSignature:aSignature ];
    //ターゲットをセット
	[ invocation setTarget: self ];
    //セレクタをセット
	[ invocation setSelector: aSelector ];
    
    NSLog(@"%s start",__FUNCTION__);
	//タイマースタート
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                         invocation:invocation
                                            repeats:YES];
    
}

#pragma mark invalidate
- (IBAction)method002:(id)sender {
    
    NSLog(@"%s invalidate",__FUNCTION__);
    
    NSLog(@"%s isValid %@",__FUNCTION__,([timer isValid])?@"YES":@"NO");
    
    NSLog(@"%s %@",__FUNCTION__,[[timer fireDate] description]);
    [timer setFireDate:[NSDate dateWithTimeInterval:5 sinceDate:[NSDate date]]];
    NSLog(@"%s %@",__FUNCTION__,[[timer fireDate] description]);
    
    [timer invalidate];
    
    NSLog(@"%s isValid %@",__FUNCTION__,([timer isValid])?@"YES":@"NO");
    
    
}

#pragma mark
- (IBAction)method003:(id)sender {
    [timer fire];
    NSLog(@"fire");
}

- (IBAction)method004:(id)sender {
    //userInfoに使う辞書を作成
	NSDictionary *userInfoDictionary =@{@"key1": @"value1",
                                       @"key2": @"value2",
                                       @"key3": @"value3"};
    
	//タイマースタート
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:		self
                                           selector:	@selector( timerControl: )
                                           userInfo:	userInfoDictionary
                                            repeats:	YES
             ];
}
- (IBAction)method005:(id)sender {
    //メソッドシグネチャ
	NSMethodSignature* aSignature ;
	//起動オブジェクト
    NSInvocation *invocation ;
	//セレクタ
    SEL aSelector  = @selector( timerControl: );
	
	//メソッドシグネチャ
    aSignature = [ self methodSignatureForSelector:aSelector ];
    //起動オブジェクトを作る
	invocation = [ NSInvocation invocationWithMethodSignature:aSignature ];
	
    //ターゲットをセット
	[ invocation setTarget: self ];
    //セレクタをセット
	[ invocation setSelector: aSelector ];
    
    timer = [NSTimer timerWithTimeInterval:1.0
                                invocation:	invocation
                                   repeats:YES];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    
    NSLog(@"%s timerWithTimeInterval:invocation:repeats",__FUNCTION__);

    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    [runloop addTimer:timer forMode:UITrackingRunLoopMode];
    
	
}
- (IBAction)method006:(id)sender {
    //現在の時間
	NSDate *theDate = [NSDate date];
	//NSDate *theDate = [NSDate dateWithString:@"2015-09-02 13:31:00 +0900"];
	
	//userInfoに使う辞書を作成
	NSDictionary *userInfoDictionary =@{@"key1": @"value1",
                                       @"key2": @"value2",
                                       @"key3": @"value3"};
    
	
	timer = [[NSTimer alloc] initWithFireDate:theDate
                                     interval:1.0
                                       target:self
                                     selector:@selector(timerControl:)
                                     userInfo:userInfoDictionary
                                      repeats:YES];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    
    NSLog(@"%s initWithFireDate:interval:target:selector:userInfo:repeats",__FUNCTION__);

    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    [runloop addTimer:timer forMode:UITrackingRunLoopMode];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
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
