//
//  OOOViewController.m
//  NSMetadataQuery
//
//  Created by 大森 智史 on 12/05/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController
-(void)queryDidUpdate:(id)sender
{
    NSLog(@"%@",[sender description]);
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)method001:(id)sender {
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:
                               @"kMDItemContentType == 'jp.natori.thousand.thread'"];
    if (searchString != nil) {
        NSPredicate * subPredicate = [NSPredicate predicateWithFormat:
                                      @"kMDItemTextContent like[cd] %@",
                                      [searchString stringByAppendingString:@"*"]];
        predicate = [NSCompoundPredicate andPredicateWithSubpredicates:
                     [NSArray arrayWithObjects:predicate, subPredicate, nil]];
        
    }
    
    if (!_query) {
		_query = [[NSMetadataQuery alloc] init];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(queryDidUpdate:)
													 name:nil
												   object:_query];
		
		/*[_query setValueListAttributes:
		 [NSArray arrayWithObjects:
		  (id)kMDItemContentType,
		  (id)kMDItemDisplayName,
		  @"jp_natori_Thousand_thread_threadInternalPath",
		  @"jp_natori_Thousand_thread_resCount",
		  @"jp_natori_Thousand_thread_label",
		  nil]];
         */
	}
	//[_query setSearchScopes:[NSArray arrayWithObject:[NSString appLogFolderPath]]];
	//[_query setPredicate:predicate];
	[_query startQuery];
    
}

//作成中
- (IBAction)method002:(id)sender {
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:
                               @"kMDItemContentType == 'jp.natori.thousand.thread'"];
    if (searchString != nil) {
        NSPredicate * subPredicate = [NSPredicate predicateWithFormat:
                                      @"kMDItemTextContent like[cd] %@",
                                      [searchString stringByAppendingString:@"*"]];
        predicate = [NSCompoundPredicate andPredicateWithSubpredicates:
                     [NSArray arrayWithObjects:predicate, subPredicate, nil]];
    }
    
    if (!_query) {
		_query = [[NSMetadataQuery alloc] init];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(queryDidUpdate:)
													 name:nil
												   object:_query];
		
		[_query setValueListAttributes:
		 [NSArray arrayWithObjects:
		  @"kMDItemContentType",
		  @"kMDItemDisplayName",
		  @"jp_natori_Thousand_thread_threadInternalPath",
		  @"jp_natori_Thousand_thread_resCount",
		  @"jp_natori_Thousand_thread_label",
		  nil]];
	}
	[_query setSearchScopes:[NSArray arrayWithObject:@"abc"]];
	[_query setPredicate:predicate];
	[_query startQuery];
}
    
@end
