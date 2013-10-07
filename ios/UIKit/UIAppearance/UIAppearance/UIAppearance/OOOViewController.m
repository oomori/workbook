//
//  OOOViewController.m
//  UIAppearance
//
//  Created by air on 2013/10/06.
//  Copyright (c) 2013年 oomori. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

#pragma mark
//UIActivityIndicatorViewを作成する
//002を実行した後に001を実行するとUIActivityIndicatorViewのカラーがグリーンになる
-(IBAction)button001:(id)sender
{
    [_activityIndicator startAnimating];
    _activityIndicator.color = [UIColor redColor];
    
    UIActivityIndicatorView *secondIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGRect frame = CGRectMake(self.view.center.x-16.0, self.view.center.y-16.0, 32.0, 32.0);
    secondIndicator.frame = frame;

    [self.view addSubview:secondIndicator];
    [self.view bringSubviewToFront:secondIndicator];
    
    [secondIndicator startAnimating];

}
#pragma mark UIAppearance  appearance:
- (IBAction)button002:(id)sender {
    //UIActivityIndicatorViewのアピアランス
    id aiAppearance = [UIActivityIndicatorView appearance];
    //UIButtonのアピアランス
    id buttonAppearance = [UIButton appearance];
    //UIActivityIndicatorViewのカラーをグリーンに
    [aiAppearance setColor:[UIColor greenColor]];
    //UIButtonのバックグラウンドカラーをグリーンに
    [buttonAppearance setBackgroundColor:[UIColor greenColor]];

}
- (IBAction)button003:(id)sender {
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
