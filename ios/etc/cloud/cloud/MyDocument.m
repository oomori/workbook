//
//  MyDocument.m
//  cloud
//
//  Created by 大森 智史 on 12/05/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyDocument.h"

@implementation MyDocument

@synthesize userText;

//保存する
-(id)contentsForType:(NSString *)typeName 
               error:(NSError **)outError
{

    return [self.userText dataUsingEncoding:NSUTF8StringEncoding];
}

//ロードする
-(BOOL) loadFromContents:(id)contents 
                  ofType:(NSString *)typeName 
                   error:(NSError **)outError
{
    if ( [contents length] > 0) {
        self.userText = [[NSString alloc] 
                         initWithBytes:[contents bytes] 
                         length:[contents length] 
                         encoding:NSUTF8StringEncoding];
        
        
       
    } else {
        self.userText = @"";
    }
    return YES;

}
@end
