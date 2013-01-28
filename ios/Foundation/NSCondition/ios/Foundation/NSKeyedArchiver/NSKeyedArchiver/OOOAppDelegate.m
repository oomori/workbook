//
//  OOOAppDelegate.m
//  NSKeyedArchiver
//
//  Created by 大森 智史 on 2012/09/09.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"
#import "MyObject.h"
#import "MyString.h"

@implementation OOOAppDelegate
#pragma mark addOperation:
//オブジェクトまるごとのシリアライズ
-(void)method001
{
    //------------------書き出し------------------
    NSString *obj = [[NSString alloc] initWithFormat:@"%@",@"string"];
    NSLog(@"%s obj = %@",__FUNCTION__,[obj description]);
    //アーカイブ
    NSData *dat = [NSKeyedArchiver archivedDataWithRootObject:obj ];
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = @"testWrite.archive";
    NSURL *aURL = [NSURL fileURLWithPathComponents:[NSArray arrayWithObjects:documentsDirectory, filename, nil]];
    
    NSLog(@"%@",filename);
   
    if ([dat writeToURL:aURL atomically:YES]){
        NSLog(@"write YES");
    }else{
        NSLog(@"write NO");
    }
    
    //------------------読み込み------------------    
    NSMutableData *readData = [NSData dataWithContentsOfURL:aURL];
    
    //アンアーカイブ
    NSString *unArchivedObj = [NSKeyedUnarchiver unarchiveObjectWithData:readData];
    NSLog(@"%s unArchivedObj = %@",__FUNCTION__,[unArchivedObj description]);

        
    
}

#pragma mark addOperation:
//
-(void)method002
{
    //------------------書き出し------------------
    NSString *obj = [[NSString alloc] initWithFormat:@"%@",@"string"];
    NSLog(@"%s obj = %@",__FUNCTION__,[obj description]);
    //アーカイブ

    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = @"testWrite.archive";
    NSString *filepath = [documentsDirectory stringByAppendingFormat:@"/%@",filename];
    NSLog(@"%@",filepath);
   
    BOOL result = [NSKeyedArchiver archiveRootObject: obj toFile: filepath];
    NSLog((result)?@"write YES":@"write NO");

    //------------------読み込み------------------
    NSURL *aURL = [NSURL fileURLWithPathComponents:[NSArray arrayWithObjects:documentsDirectory, filename, nil]];
    NSMutableData *readData = [NSData dataWithContentsOfURL:aURL];
    //アンアーカイブ
    NSString *unArchivedObj = [NSKeyedUnarchiver unarchiveObjectWithData:readData];
    NSLog(@"%s unArchivedObj = %@",__FUNCTION__,[unArchivedObj description]);
    
    
}

#pragma mark 
//
-(void)method003
{
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]
                                 initForWritingWithMutableData:data];
    NSString *string = @"string";
    
    //NewObjectとして読み込む場合はこちら
    //[NSKeyedArchiver setClassName:@"NewObject" forClass:[MyObject class]];
    //NSLog(@"-----%@",[NSKeyedArchiver classNameForClass:[MyObject class]]);
    
    //NewObjectとして読み込む場合はこちら
    //[archiver setClassName:@"NewObject" forClass:[MyObject class]];
    //NSLog(@"-----%@",[archiver classNameForClass:[MyObject class]]);
    
    [archiver setOutputFormat:NSPropertyListBinaryFormat_v1_0];
    [archiver setDelegate:self];
    switch ([archiver outputFormat]) {
        case NSPropertyListXMLFormat_v1_0:
                NSLog(@"NSPropertyListXMLFormat_v1_0");
            break;
        case NSPropertyListBinaryFormat_v1_0:
            NSLog(@"NSPropertyListBinaryFormat_v1_0");
            break;
            
        default:
            break;
    }
             
    [archiver encodeObject:string forKey:@"stringKey"];
    [archiver encodeBool:YES forKey:@"boolKey"];
    
    unsigned char aBuffer[200];
    NSString *str = @"This is a pen.";
    NSData *dat1 = [NSData dataWithBytes:[str cStringUsingEncoding:NSUTF8StringEncoding] length:[str lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];
    [dat1 getBytes:aBuffer length:[str length]];
    [archiver encodeBytes:aBuffer length:[str length] forKey:@"bytesKey"];
    
    MyObject *string1 = [[MyObject alloc] init];
    [string1 setValue:@"string1" forKey:@"string"];
    MyObject *string2 = [[MyObject alloc] init];
    MyObject *string3 = [[MyObject alloc] init];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:5];
    [mArray addObject:string1];
    [mArray addObject:string2];
    [mArray addObject:string3];
    [archiver encodeObject:mArray forKey:@"conditionalObjectKey"];
    //[archiver encodeConditionalObject:mArray forKey:@"conditionalObjectKey"];
    [archiver finishEncoding];
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = @"testWrite.archive";
    NSURL *aURL = [NSURL fileURLWithPathComponents:[NSArray arrayWithObjects:documentsDirectory, filename, nil]];
    
    if ([data writeToURL:aURL atomically:YES]){
        NSLog(@"write YES");
    }else{
        NSLog(@"write NO");
    }
    
    //------------------読み込み------------------
    NSMutableData *readData = [NSMutableData dataWithContentsOfURL:aURL];
    NSLog(@"%@",[readData description]);
    //アンアーカイブ
    NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:readData];
    
    NSLog(@"%s boolKey?= %@",__FUNCTION__,([unArchiver containsValueForKey:@"boolKey"])?@"YES":@"NO");
    
    
    
    NSLog(@"%s unArchivedObj = %@",__FUNCTION__,[unArchiver decodeObjectForKey:@"stringKey"]);
    NSLog(@"%s unArchivedObj = %@",__FUNCTION__,([unArchiver decodeObjectForKey:@"boolKey"])?@"YES":@"NO");
    
    const uint8_t *mPointer;
    NSUInteger lengthInteger = 0;
    mPointer = [unArchiver decodeBytesForKey:@"bytesKey" returnedLength:&lengthInteger ];
    NSString *output = [[NSString alloc] initWithBytes:mPointer
                                                length:lengthInteger
                                              encoding:NSUTF8StringEncoding];
    NSLog(@"%s unArchivedObj = %@",__FUNCTION__,output);
    
    //MyObjectのエンコード
    //[encoder encodeConditionalObject:string forKey:@"string"];
    //になっていると内容は保持されない。
    id mArray2 = [unArchiver decodeObjectForKey:@"conditionalObjectKey"];
    
    NSLog(@"%s unArchivedObj = %@",__FUNCTION__,[mArray2 objectAtIndex:0]);
    NSLog(@"%s unArchivedObj = %@",__FUNCTION__,[[mArray2 objectAtIndex:0] class]);
    
    [unArchiver finishDecoding];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    
    [self method003];
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
#pragma mark NSKeyedArchiverDelegate
- (void)archiver:(NSKeyedArchiver *)archiver didEncodeObject:(id)object
{
    NSLog(@"didEncodeObject");
}

- (id)archiver:(NSKeyedArchiver *)archiver willEncodeObject:(id)object
{
    NSLog(@"willEncodeObject");
    return object;
}

- (void)archiver:(NSKeyedArchiver *)archiver willReplaceObject:(id)object withObject:(id)newObject
{
    NSLog(@"willReplaceObject");
    
}

- (void)archiverDidFinish:(NSKeyedArchiver *)archiver
{
    NSLog(@"archiverDidFinish");
    
}

- (void)archiverWillFinish:(NSKeyedArchiver *)archiver
{
    
    NSLog(@"archiverWillFinish");
}

@end
