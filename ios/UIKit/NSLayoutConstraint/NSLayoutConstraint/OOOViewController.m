//
//  OOOViewController.m
//  NSLayoutConstraint
//
//  Created by air on 2013/10/08.
//  Copyright (c) 2013年 oomori. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

- (IBAction)goAction:(id)sender {

    NSLog(@"obj1 %@ \nobj2 %@",_object1.constraints,_object2.constraints);
}
- (IBAction)addConstraint:(id)sender {
    
    //レイアウト制限設定
    NSLayoutConstraint *constraint1 =
    [NSLayoutConstraint
     constraintWithItem : _object1
     attribute : NSLayoutAttributeWidth
     relatedBy : NSLayoutRelationEqual
     toItem : nil
     attribute : NSLayoutAttributeNotAnAttribute
     multiplier : 1
     constant : 50];
    //[_object1 addConstraint:constraint1];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_object1, _object2);
    //NSNumber *padding = @8;
    //NSNumber *widePadding = @20;
    //NSDictionary *metricsDictionary = NSDictionaryOfVariableBindings(padding, widePadding);
   
    
    NSArray *constraintArray2 = [NSLayoutConstraint
                                       constraintsWithVisualFormat:@"V:|-8-[object1]"
                                       options:0
                                       metrics:nil
                                       views:viewsDictionary
                                       ];
    [_object1 addConstraints:constraintArray2];
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
