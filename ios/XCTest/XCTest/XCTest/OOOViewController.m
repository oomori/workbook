//
//  OOOViewController.m
//  XCTest
//
//  Created by 大森 智史 on 2014/01/01.
//  Copyright (c) 2014年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"
#import "OOOModel.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    OOOModel *model = [[OOOModel alloc] init];
    
    [model method001];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
