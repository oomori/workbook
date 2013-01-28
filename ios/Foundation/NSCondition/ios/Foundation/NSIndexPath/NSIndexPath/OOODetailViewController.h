//
//  OOODetailViewController.h
//  NSIndexPath
//
//  Created by 大森 智史 on 2012/08/11.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOODetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
