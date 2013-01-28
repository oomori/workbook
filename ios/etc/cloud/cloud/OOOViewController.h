//
//  OOOViewController.h
//  cloud
//
//  Created by 大森 智史 on 12/05/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDocument.h"


@interface OOOViewController : UIViewController
{
    MyDocument *document;
    NSURL *documentURL;
    UITextView *textView;
    
        NSMetadataQuery *query;
    BOOL _isiCloudEnabled;
}

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSURL *documentURL;
@property (strong, nonatomic) MyDocument *document;
@property (strong, nonatomic) NSMetadataQuery *query;

- (IBAction)searchDocument:(id)sender;
- (IBAction)saveDocument:(id)sender;
- (IBAction)revertDocument:(id)sender;
- (IBAction)testButton:(id)sender;
- (IBAction)cloudToLocal:(id)sender;

@end
