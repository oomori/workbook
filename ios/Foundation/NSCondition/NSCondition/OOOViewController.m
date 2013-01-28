//
//  OOOViewController.m
//  NSCondition
//
//  Created by 大森 智史 on 2012/09/17.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController
@synthesize wait5second;
@synthesize progressBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    state = CalculatorStateIdle;
    cond = [[NSCondition alloc] init];
    
    cond2 = [[NSCondition alloc] init];
    val = 0.0;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setProgressBar:nil];
    [self setWait5second:nil];
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
// バックグラウンドでprogressを変更
- (void)progress:(NSNumber *)amount {
	progressBar.progress = [amount floatValue];
}
- (void)run
{
    NSLog(@"run");
    
    @autoreleasepool {
        while (1) {
            // メインの動作
            
            val += 0.001;
            
            [self performSelectorInBackground:@selector(progress:) withObject:@(val)];
            [NSThread sleepForTimeInterval:0.01f];

            NSLog(@"val:%f",val);
            if (state == CalculatorStateCanceling) {
                break;
            }
        }
        
        //
        [cond lock];
        
        //キャンセルなら
        if (state == CalculatorStateCanceling) {
            //waitのスレッドを起こす
            [cond signal];
            NSLog(@"run:cancel:signel");
        }
        state = CalculatorStateIdle;
        [cond unlock];
    }
}
- (IBAction)start:(id)sender {
    [cond setName:@"condition name"];
    [cond lock];
    [cond broadcast];
    //待機中の場合のみ実行
    if (state == CalculatorStateIdle) {
        state = CalculatorStateRunning;
        [self performSelectorInBackground:@selector(run) withObject:nil];
    }
    NSLog(@"%@",[cond name]);
    [cond unlock];
}

- (IBAction)stop:(id)sender {
    [cond lock];
    
    //キャンセル
    if (state == CalculatorStateRunning) {
        state = CalculatorStateCanceling;
        while (state != CalculatorStateIdle) {
            //実行ストップ
            [cond wait];
            //[cond waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
        }
    }
    [cond unlock];

}



- (void)threadTask:(id)obj
{
    @autoreleasepool {
        
        int i;
        for (i=1;i<20000;i++) {
            

            NSLog(@"%@------- %d",(([[NSThread currentThread] isMainThread])?@"main":@"sub"),i);
        }
    //[thread1 cancel];
        NSLog(@"exit");
    }
}
- (IBAction)threadStart:(id)sender
{
    /*
    thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(threadTask:) object:self];
    [thread1 start];
    
    NSLog(@"%@------- ",(([[NSThread currentThread] isMainThread])?@"main":@"sub"));
    
    if ([NSThread isMultiThreaded]){
        NSLog(@"YES");
    }else{
        NSLog(@"NO");
    }
    */
    // 共有するデータ
    commonData = [[NSMutableArray alloc] init];
    // @synchronized と wait の代わりに使うロックオブジェクト
    lockObject = [[NSCondition alloc] init];
    // 作るスレッド
    producerThread = [[ProducerThread alloc] initWithCommonData:commonData lockObject:lockObject];
    // 使うスレッド
    consumerThread = [[ConsumerThread alloc] initWithCommonData:commonData lockObject:lockObject];
    
    // go!
    [producerThread start];
    [consumerThread start];

 
    
}

- (IBAction)threadStop:(id)sender {
    NSLog(@"stop");

    [cond2 lock];
    [cond2 signal];
    [thread1 cancel];
    [cond2 unlock];

}



- (IBAction)wait5second:(id)sender {
    [cond lock];

    [cond waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
   
    [cond unlock];
}


@end
