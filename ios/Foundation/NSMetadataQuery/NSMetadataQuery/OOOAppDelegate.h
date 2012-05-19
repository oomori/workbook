//
//  OOOAppDelegate.h
//  NSMetadataQuery
//
//  Created by 大森 智史 on 12/05/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOAppDelegate : UIResponder <UIApplicationDelegate>
{
    
    NSMetadataQuery *query;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMetadataQuery *query;

@end
