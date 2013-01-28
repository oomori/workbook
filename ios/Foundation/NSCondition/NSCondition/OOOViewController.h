//
//  OOOViewController.h
//  NSCondition
//
//  Created by 大森 智史 on 2012/09/17.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ConsumerThread.h"
#import "ProducerThread.h"


// スレッドの状態を表す定数
typedef enum {
    CalculatorStateIdle,        // 待機中
    CalculatorStateRunning,     // 実行中
    CalculatorStateCanceling,   // キャンセル中
} CalculatorState;

@interface OOOViewController : UIViewController
{
    volatile CalculatorState state;     // 必ず volatile にすること
    NSCondition *cond;                  // state を保護し、状態変化を伝える
    float val;
    
    
    NSCondition *cond2;
    NSThread *thread1;
    
    NSMutableArray* commonData;
    NSCondition* lockObject;
    ProducerThread* producerThread;
    ConsumerThread* consumerThread;
    
}
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)threadStart:(id)sender;

- (IBAction)wait5second:(id)sender;

- (IBAction)threadStop:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *wait5second;

@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@end
