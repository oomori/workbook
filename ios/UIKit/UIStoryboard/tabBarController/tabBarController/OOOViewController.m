//
//  OOOViewController.m
//  tabBarController
//
//  Created by 大森 智史 on 2013/10/07.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"
@class DetailViewController;
@interface OOOViewController ()

@end

@implementation OOOViewController
- (IBAction)aaaaa:(id)sender {
    //タブ内入れ替え
    NSMutableArray *tabs = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];
    NSLog(@"22");
    
    DetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    
    //controller.backController = self;
    
    NSLog(@"22");
    //showDetail
    UIViewController *tmpController = [tabs objectAtIndex:0];
    //controller.tabBarItem = tmpController.tabBarItem;
    [tabs replaceObjectAtIndex:0 withObject:controller];
    [self.tabBarController setViewControllers:tabs animated:YES];
    [UIView transitionWithView:tmpController.view duration:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
        tmpController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        //[self.navigationController pushViewController:tmpController animated:NO];
        //[tmpController.view removeFromSuperview];
    }];
    
    /*
    [controller.displayDataDic removeAllObjects];
    controller.displayDataDic = [NSMutableDictionary dictionaryWithCapacity:1];
    
    if (selectedWords.count) {
        [controller.displayDataDic setObject:[selectedWords objectAtIndex:indexPath.row] forKey:@"word"];
    }else{
        [controller.displayDataDic setObject:[words objectAtIndex:indexPath.row] forKey:@"word"];
    }
    [controller setupDisplay];
    */
     
    NSLog(@"%@",[tmpController description]);
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
