//
//  OOOViewController.h
//  NSURLConnection
//
//  Created by 大森 智史 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOViewController : UIViewController
{
    NSURLConnection *globalConnection;
}

- (IBAction)button001:(id)sender;
- (IBAction)button002:(id)sender;
- (IBAction)button003:(id)sender;
- (IBAction)button004:(id)sender;
- (IBAction)button005:(id)sender;
- (IBAction)method006:(id)sender;
- (IBAction)method007:(id)sender;
- (IBAction)method008:(id)sender;
- (IBAction)method009:(id)sender;
- (IBAction)method010:(id)sender;


@property (strong, nonatomic) NSMutableData *receivedData;

@end
