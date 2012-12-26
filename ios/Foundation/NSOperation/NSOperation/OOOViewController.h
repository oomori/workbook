//
//  OOOViewController.h
//  NSOperation
//
//  Created by 大森 智史 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOViewController : UIViewController
{
    NSOperationQueue *gQueue;
    NSOperationQueue *oQueue;
    __weak IBOutlet UIProgressView *progressbar;
}
@property (weak, nonatomic) IBOutlet UIButton *method001;
@property (weak, nonatomic) IBOutlet UIButton *method004;
- (IBAction)method001:(id)sender;
- (IBAction)method002:(id)sender;
- (IBAction)method003:(id)sender;
- (IBAction)method004:(id)sender;
- (IBAction)method005:(id)sender;


@end
