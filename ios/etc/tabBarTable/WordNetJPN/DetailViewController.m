//
//  DetailViewController.m
//  WordNetJPN
//
//  Created by 大森 智史 on 2013/04/16.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "DetailViewController.h"
@class OOOFirstViewController;

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize textView;
@synthesize backController;
@synthesize displayDataDic;

-(void)setupDisplay{
    
    
    NSLog(@"!! %@",[displayDataDic objectForKey:@"word"]);
    
    self.textView.text = [displayDataDic objectForKey:@"word"];

     //setText:[displayDataDic objectForKey:@"word"]];
}
- (IBAction)returnToTable:(id)sender {
    
    NSLog(@"!!%@",self.backController.description);
    
    //タブ内入れ替え
    NSMutableArray *tabs = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];

    UIViewController *tmpController = [tabs objectAtIndex:0];
    //controller.tabBarItem = tmpController.tabBarItem;
    [tabs replaceObjectAtIndex:0 withObject:backController];
    [self.tabBarController setViewControllers:tabs animated:NO];
    [UIView transitionWithView:tmpController.view duration:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
        tmpController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [self.navigationController pushViewController:tmpController animated:NO];
        [tmpController.view removeFromSuperview];
    }];
    

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
