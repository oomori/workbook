//
//  OOOViewController.m
//  NSOperation
//
//  Created by 大森 智史 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOViewController.h"

#import "OOOAppDelegate.h"
#import "MyOperation.h"
#import "SyncOperation.h"

#import "HTTPOperation.h"

@interface OOOViewController ()

@end

@implementation OOOViewController



//
@synthesize method004;
@synthesize method001;

#pragma mark addOperation:
- (IBAction)method001:(id)sender {
    gQueue = [[NSOperationQueue alloc] init];
    
    MyOperation *aOperation1 = [[MyOperation alloc] init];
    MyOperation *aOperation2 = [[MyOperation alloc] init];
    [aOperation1 setThreadPriority:0.1];
    [aOperation2 setThreadPriority:0.9];
    
    aOperation1.string = @"op 1";
    aOperation2.string = @"op 2";
    
    [gQueue addOperation:aOperation1];
    [gQueue addOperation:aOperation2];

    
    NSLog(@"threadPriority %f",[aOperation1 threadPriority]);
    NSLog(@"threadPriority %f",[aOperation2 threadPriority]);
    
}

#pragma mark addOperation:
//非並列
- (IBAction)method002:(id)sender {

        MyOperation *aOperation1 = [[MyOperation alloc] init];
        __block id temp = aOperation1;
        
    //終了時の処理
        [aOperation1 setCompletionBlock:^{
            NSLog(@"%s->finished: %@",__FUNCTION__, ([temp finished])?@"YES":@"NO");
            temp= nil;
        }];
    
    NSLog(@"completionBlock %@",[aOperation1 completionBlock]);
        
    
    [aOperation1 start];
        
        oQueue = [[NSOperationQueue alloc] init];
        
        MyOperation *aOperation2 = [[MyOperation alloc] init];
        
        aOperation1.string = @"aaa";
        aOperation2.string = @"bbb";
        
        //[oQueue addOperation:aOperation1];
        //[oQueue addOperation:aOperation2];
}

- (IBAction)method003:(id)sender {
    //同期型オペレーション startで起動
    SyncOperation *aOperation1 = [[SyncOperation alloc] init];
    SyncOperation *aOperation2 = [[SyncOperation alloc] init];
    
    aOperation1.string = @"ope 1";
    aOperation2.string = @"ope 2";
    
    /*
    // キー値監視を追加する
    [aOperation1 addObserver:self forKeyPath:@"isFinished"
              options:NSKeyValueObservingOptionNew context:nil];
    
    // キー値監視を追加する
    [aOperation2 addObserver:self forKeyPath:@"isFinished"
              options:NSKeyValueObservingOptionNew context:nil];
 */
    NSLog(@"isCancelled %@",([aOperation1 isCancelled])?@"YES":@"NO");
    NSLog(@"isReady %@",([aOperation1 isReady])?@"YES":@"NO");
    [aOperation2 start];
    //[aOperation1 waitUntilFinished];
    
    
    [aOperation1 start];
    //[aOperation1 waitUntilFinished];
}



#pragma mark MyOperation addDependency:
//依存性

- (IBAction)method004:(id)sender {

    gQueue = [[NSOperationQueue alloc] init];
    
    MyOperation *aOperation1 = [[MyOperation alloc] init];
    MyOperation *aOperation2 = [[MyOperation alloc] init];
    [aOperation1 setThreadPriority:0.1];
    [aOperation2 setThreadPriority:0.9];
    
    aOperation1.string = @"op 1";
    aOperation2.string = @"op 2";
    
    [gQueue addOperation:aOperation1];
    [gQueue addOperation:aOperation2];
    
    //[aOperation2 waitUntilFinished];
    
    //aOperation1はaOperation2の処理が終わるまで実行しない。
    [aOperation1 addDependency:aOperation2];
    //[aOperation1 removeDependency:aOperation2];
    NSLog(@"dependencies %@",([aOperation1 dependencies])?@"YES":@"NO");
    NSLog(@"isCancelled %@",([aOperation1 isCancelled])?@"YES":@"NO");
    NSLog(@"isReady %@",([aOperation1 isReady])?@"YES":@"NO");
    
    NSLog(@"threadPriority %f",[aOperation1 threadPriority]);
    NSLog(@"threadPriority %f",[aOperation2 threadPriority]);
}

- (IBAction)method005:(id)sender {
    
    gQueue = [[NSOperationQueue alloc] init];
    
    MyOperation *aOperation1 = [[MyOperation alloc] init];
    MyOperation *aOperation2 = [[MyOperation alloc] init];
    [aOperation1 setQueuePriority:NSOperationQueuePriorityVeryLow];
    [aOperation2 setQueuePriority:NSOperationQueuePriorityVeryHigh];
    
    aOperation1.string = @"op 1";
    aOperation2.string = @"op 2";
    
    [gQueue addOperation:aOperation1];
    [gQueue addOperation:aOperation2];
    
    switch ([aOperation1 queuePriority]) {
        case NSOperationQueuePriorityVeryLow:
            NSLog(@"NSOperationQueuePriorityVeryLow");
            break;
        case NSOperationQueuePriorityLow:
            NSLog(@"NSOperationQueuePriorityLow");
            break;
        case NSOperationQueuePriorityNormal:
            NSLog(@"NSOperationQueuePriorityNormal");
            break;
        case NSOperationQueuePriorityHigh:
            NSLog(@"NSOperationQueuePriorityHigh");
            break;
        case NSOperationQueuePriorityVeryHigh:
            NSLog(@"NSOperationQueuePriorityVeryHigh");
            break;
        default:
            break;
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    progressbar = nil;
    [self setMethod001:nil];
    [self setMethod004:nil];
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
