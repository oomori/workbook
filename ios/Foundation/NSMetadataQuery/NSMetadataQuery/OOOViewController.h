//
//  OOOViewController.h
//  NSMetadataQuery
//
//  Created by 大森 智史 on 12/05/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOViewController : UIViewController
{
    NSString *searchString;
    NSMetadataQuery *_query;
}
- (IBAction)method001:(id)sender;
- (IBAction)method002:(id)sender;

@end
