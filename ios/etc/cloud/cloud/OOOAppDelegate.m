//
//  OOOAppDelegate.m
//  cloud
//
//  Created by 大森 智史 on 12/05/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"
#import "MyDocument.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark check
-(void)method001
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *url = [fileManager URLForUbiquityContainerIdentifier:nil];
    if (url) {
        NSLog(@"%s :YES %@", __FUNCTION__,[url description]);
    }else {
        NSLog(@"NO");
    }
    //=>[OOOAppDelegate method001] :YES file://localhost/private/var/mobile/Library/Mobile%20Documents/XXXXXXXXXX~com~oomori~cloud/
}

#pragma mark Key-Value Store
-(void)method002
{
    //
    NSUbiquitousKeyValueStore *aStore = [NSUbiquitousKeyValueStore defaultStore];
    [aStore setString:@"oomori" forKey:@"name"];
    [aStore setDouble:30.0 forKey:@"age"];
    if ([aStore synchronize]) {
        NSLog(@"%s :sync OK", __FUNCTION__);
    }else {
        NSLog(@"NO");
    }
    
    //=>[OOOAppDelegate method002] :sync OK
    
}
#pragma mark Read Data
-(void)method003
{
    
    NSUbiquitousKeyValueStore *aStore = [NSUbiquitousKeyValueStore defaultStore];

    //まずは同期してから
    if ([aStore synchronize]) {
        NSLog(@"%s :sync OK", __FUNCTION__);
        NSLog(@"name = %@ :age = %.0f", [aStore stringForKey:@"name"],[aStore doubleForKey:@"age"]);
        
    }else {
        NSLog(@"NO");
    }
    
    //=>[OOOAppDelegate method003] :sync OK
    //name = oomori :age = 44
}

#pragma mark Read Data
-(void)method004
{
    NSArray *dirPaths = 
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *dataFile = 
    [docsDir stringByAppendingPathComponent: 
     @"document.doc"];
    
    NSURL *url = [NSURL fileURLWithPath:dataFile];
    //UIDocumentはFilePresenter準拠。
    UIDocument *doc = [[UIDocument alloc] initWithFileURL:url];
    NSFileCoordinator *coodinator = [[NSFileCoordinator alloc] initWithFilePresenter:doc];

    NSFileManager *syncFileManager = [[NSFileManager alloc] init];
    //NSURL *ubiq = [syncFileManager URLForUbiquityContainerIdentifier:nil];
    
    //NSLog(@"%s : OK %@", __FUNCTION__,[ubiq description]);
    
    __block NSError  *error = nil;
    __block NSString *readStr = nil;
    

    /*    
    
    [coodinator coordinateReadingItemAtURL:url
                                   options:0
                                     error:&error
                                byAccessor:^(NSURL *newURL)
                                     {
                                         
                                         NSError *readErr;
                                         readStr = [NSString
                                                stringWithContentsOfURL:newURL
                                                 encoding:NSUTF8StringEncoding
                                                error:&readErr ];
                                         
                                         
                                         NSLog(@"%s : OK %@", __FUNCTION__,[newURL description]);
                                         
                                     }];
    */
    // NSFileCoordinatorを使って、ファイルを読み込む
    //NSFileCoordinator* file = [[NSFileCoordinator alloc] initWithFilePresenter:doc];
    [coodinator coordinateReadingItemAtURL:url options:0 error:nil 
                          byAccessor:^(NSURL* newUrl)
     {
         //readStr = [NSString stringWithContentsOfURL:newUrl 
          //                                         encoding:NSUTF8StringEncoding error:&error];
         NSData *contents = [NSData dataWithContentsOfURL:newUrl];
         readStr = [[NSString alloc] 
                    initWithBytes:[contents bytes] 
                    length:[contents length] 
                    encoding:NSUTF8StringEncoding];
         //[textView.textStorage.mutableString setString:text];
         //[textView setNeedsDisplay:YES];
     }];
    NSLog(@"READ str = %@",readStr);
    NSLog(@"READ err = %@",[coodinator description]);
    
}
#pragma mark Read/Write Data
-(void)method005
{
    NSArray *dirPaths = 
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *dataFile = 
    [docsDir stringByAppendingPathComponent: 
     @"document.doc"];
    
    NSURL *url = [NSURL fileURLWithPath:dataFile];
    //UIDocumentはFilePresenter準拠。
    UIDocument *doc = [[UIDocument alloc] initWithFileURL:url];
    NSFileCoordinator *coodinator = [[NSFileCoordinator alloc] initWithFilePresenter:doc];
    
    
    NSError *error = nil;
    __block NSString *readStr = nil;
    //読み込み
    [coodinator coordinateReadingItemAtURL:url
                                   options:0
                                     error:&error
                                byAccessor:^(NSURL *newURL)
     {
         
         NSError *readErr;
         NSData *contents = [NSData dataWithContentsOfURL:newURL];
         readStr = [[NSString alloc] 
                    initWithBytes:[contents bytes] 
                    length:[contents length] 
                    encoding:NSUTF8StringEncoding];
         /*
         readStr = [NSString
                    stringWithContentsOfURL:newURL
                    encoding:NSUTF8StringEncoding
                    error:&readErr ];
         */
         
     }];
    
    NSLog(@"READ str = %@",[readStr description]);
    NSString *writeStr = [NSString stringWithFormat:@"%@%@",readStr,@"+"];
    /*
    [coodinator coordinateWritingItemAtURL:url 
                                   options:NSFileCoordinatorWritingForMoving 
                          writingItemAtURL:url 
                                   options:NSFileCoordinatorWritingForReplacing 
                                     error:&error 
                                byAccessor:^(NSURL *newURL, NSURL *url) {
     */                               
    [coodinator coordinateWritingItemAtURL:url
                                   options:NSFileCoordinatorWritingForMoving
                                     error:&error
                                byAccessor:^(NSURL *newURL)
     {
       
         //NSError *writeErr;
         //[writeStr writeToURL:newURL atomically:YES
           //          encoding:NSUTF8StringEncoding error:&writeErr];
         NSData *wData = [writeStr dataUsingEncoding:NSUTF8StringEncoding];
         [wData writeToURL:newURL atomically:YES];
         
         ^(){
             NSURL* cloudUrl = 
             [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
             
             
             // テンポラリーからiCloudへファイルを移動（元の場所から削除される）
             [[NSFileManager defaultManager] 
              setUbiquitous:YES itemAtURL:newURL destinationURL:cloudUrl error:nil];
             
             // 操作対象のURLを設定して、NSFileCoordinatorに登録
             [NSFileCoordinator addFilePresenter:doc]; 
         };
         
         NSFileVersion *localVersion = [NSFileVersion currentVersionOfItemAtURL:newURL];
         
         NSArray *remoteVersions = [NSFileVersion unresolvedConflictVersionsOfItemAtURL:newURL];
         NSArray *otherVersions = [NSFileVersion otherVersionsOfItemAtURL:newURL];
         
         
         NSLog(@"remote  = %@",[localVersion description]);
         
     }];
    
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    [self method003];
    
    [self method004];
    [self method005];

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


#pragma mark -
#pragma mark NSFilePresenter

// ----------------------------------------------------------------------------
//   NSFilePresenter implementation
// ----------------------------------------------------------------------------

//
// 操作対象となるファイルのURL
// NSFileCoordinatorに登録することで、このURLのファイル操作に対する通知を受信できる
//
- (NSURL*)presentedItemURL
{
    return currentUrl;
}



//
// 以下のメソッドの実行は、このOperationQueueにスケジュールされる
// MainThreadとは非同期のキューです
//
- (NSOperationQueue*)presentedItemOperationQueue
{
    return operationQueue;
}



//
// 他のプロセスがcurrentVersionの読み込みを行おうとしている
// NSFileCoordinatorを使っていれば、他のプロセスが読み込んでいる最中は書き込めません
//
- (void)relinquishPresentedItemToReader:(void(^)(void(^reacquirer)(void)))reader
{
    NSLog(@"relinquishPresentedItemToReader begin");
    
    reader(^
           {
               NSLog(@"relinquishPresentedItemToReader end");
           });
}



//
// 他のプロセスがcurrentVersionへ書き込みを行おうとしている
// NSFileCoordinatorを使っていれば、他のプロセスが書き込んでいる最中は書き込めません
//
- (void)relinquishPresentedItemToWriter:(void(^)(void(^reacquirer)(void)))writer
{
    // 今回は、書き込まれたファイルを読み込むので、処理が終わるまで保存できないようにする
    fileIsWritable = NO;
    
    writer(^
           {
               // とりあえず、書き込まれたファイルの内容を現在の書類に反映させるためにファイルを再読み込み
               // この処理は、MainThreadにスケジュールする
               [[NSOperationQueue mainQueue] addOperationWithBlock:^
                {
                    if (currentUrl)
                    {
                        [self readFromCurrentURL];
                    }
                    fileIsWritable = YES;
                }];
           });
}



//
// 未保存のデータを保存することを要求された
//
- (void)savePresentedItemChangesWithCompletionHandler:
(void (^)(NSError *errorOrNil))completionHandler
{
    // とりあえず、現在の書類の内容を新バージョンとして保存しておく
    // この処理は、MainThreadにスケジュールする
    [[NSOperationQueue mainQueue] addOperationWithBlock:^
     {
         [self writeToCurrentURLWithNewVersion:YES];
         completionHandler(nil);
     }];
}



//
// currentVersionのファイルが削除されようとしている
//
- (void)accommodatePresentedItemDeletionWithCompletionHandler:
(void (^)(NSError *errorOrNil))completionHandler
{
    completionHandler(nil);
}



//
// currentVersionのファイルが移動した。または、削除された。
//
- (void)presentedItemDidMoveToURL:(NSURL *)newURL
{
    // とりあえず、編集中の書類を無慈悲に破棄して、書類を初期化する
    // この処理は、MainThreadにスケジュールする
    NSInvocationOperation* operation = [[NSInvocationOperation alloc] 
                                        initWithTarget:self selector:@selector(newDocument:) object:self];
    [[NSOperationQueue mainQueue] addOperation:operation];
}



//
// currentVersionの内容が変更された
//
- (void)presentedItemDidChange
{
    NSLog(@"presentedItemDidChange");
}



//
// otherVersionsに新規バージョンが追加された
//
- (void)presentedItemDidGainVersion:(NSFileVersion *)version
{
    // もし競合バージョンが追加されたなら、とりあえず無条件に競合を解決したことにする
    NSArray* conflictVersions = 
    [NSFileVersion unresolvedConflictVersionsOfItemAtURL:currentUrl];
    for (NSFileVersion* version in conflictVersions)
    {
        version.resolved = YES;
    }
}



//
// otherVersionsからあるバージョンが削除された
//
- (void)presentedItemDidLoseVersion:(NSFileVersion *)version
{
    NSLog(@"presentedItemDidLoseVersion: %@", version);
}



//
// バージョン競合が解決された
//
- (void)presentedItemDidResolveConflictVersion:(NSFileVersion *)version
{
    NSLog(@"presentedItemDidResolveConflictVersion: %@", version);
}


@end
