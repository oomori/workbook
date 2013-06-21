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
@synthesize progressBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    state = CalculatorStateIdle;
    cond = [[NSCondition alloc] init];
    val = 0.0;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setProgressBar:nil];
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
    @autoreleasepool {
        while (1) {
            // ちょっとずつ計算を行う。
            
            val += 0.001;
            
            [self performSelectorInBackground:@selector(progress:) withObject:@(val)];
            [NSThread sleepForTimeInterval:0.01f];

            
            NSLog(@"%f",progressBar.progress);
            // 計算中、定期的に state をチェックする。
            if (state == CalculatorStateCanceling) {
                break;
            }
        }
        
        // state の変更は必ず [cond lock]; ～ [cond unlock]; の間で行う。
        [cond lock];
        if (state == CalculatorStateCanceling) {
            // [cond wait]; しているスレッドを起こす。
            [cond signal];
        }
        state = CalculatorStateIdle;
        [cond unlock];


        
    }
}
- (IBAction)start:(id)sender {
    
    [cond lock];
    
    // start が重複して呼ばれても良いように、待機中の場合のみ実行を開始する。
    if (state == CalculatorStateIdle) {
        state = CalculatorStateRunning;
        [self performSelectorInBackground:@selector(run) withObject:nil];
    }
    
    [cond unlock];
}

- (IBAction)stop:(id)sender {
    [cond lock];
    
    // 実行中なら、状態をキャンセル中にしてスレッドの終了を待つ。
    if (state == CalculatorStateRunning) {
        state = CalculatorStateCanceling;
        while (state != CalculatorStateIdle) {
            // [cond signal]; が実行されるのを待つ。
            [cond wait];
        }
    }
    
    [cond unlock];

}
@end
