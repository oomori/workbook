//
//  OOOViewController.h
//  NSUndoManager
//
//  Created by 大森 智史 on 2012/09/23.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OOOPresonList.h"

@interface OOOViewController : UIViewController
    {
        IBOutlet UIButton *button;
        IBOutlet UIButton *removebutton;
        int i;
        NSUndoManager *undoManager;
        OOOPresonList *persons;
    }
@property (nonatomic,retain) NSUndoManager *undoManager;

-(IBAction)addButton;
- (IBAction)removeButton:(id)sender;

-(void)addATruck;
-(void)removeATruck;
-(void)updateTitle;

@end
