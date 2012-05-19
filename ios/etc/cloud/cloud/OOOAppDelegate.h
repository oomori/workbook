//
//  OOOAppDelegate.h
//  cloud
//
//  Created by 大森 智史 on 12/05/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOAppDelegate : UIResponder <UIApplicationDelegate,NSFilePresenter>
{
@private
    
    // 現在操作対象としているファイルのURL
    NSURL* currentUrl;
    
    // NSFilePresenterの実行をスケジュールするためのOperationQueue
    NSOperationQueue* operationQueue;
    
    // ファイルへの書き込み許可フラグ
    BOOL fileIsWritable;
    
}

@property (strong, nonatomic) UIWindow *window;
//
// Read and Write
//
- (void)readFromCurrentURL;
- (void)writeToCurrentURLWithNewVersion:(BOOL)flag;

@end
