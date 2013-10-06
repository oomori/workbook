//
//  DetailViewController.h
//  WordNetJPN
//
//  Created by 大森 智史 on 2013/04/16.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    UIViewController *backController;
    NSMutableDictionary *displayDataDic;
}

-(void)setupDisplay;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic,retain) UIViewController *backController;
@property (nonatomic,retain) NSMutableDictionary *displayDataDic;



@end
