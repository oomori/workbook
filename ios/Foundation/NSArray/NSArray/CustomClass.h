//
//  CustomClass.h
//  NSSortDescriptor
//
//  Created by 大森 智史 on 12/05/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomClass : NSObject
{
    NSMutableString *customClassValue;
    NSNumber *customNumber;
    NSData *custonData;
    
}

@property (strong) NSMutableString *customClassValue;
@property (strong) NSNumber *customNumber;
@property (strong) NSData *custonData;

-(NSMutableString *)appendSomeString;

@end
