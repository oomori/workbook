//
//  OOOSecondViewController.h
//  WordNetJPN
//
//  Created by 大森 智史 on 2013/04/14.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOSecondViewController :UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate>
{
    
    __weak IBOutlet UISearchBar *searchField;
    NSMutableArray *words;
    NSMutableArray *selectedWords;
    NSMutableArray *synsets;
}
- (IBAction)search:(id)sender;
//
@property (nonatomic,strong) NSMutableArray *words;
@property (nonatomic,strong) NSMutableArray *selectedWords;
@property (nonatomic,strong) NSMutableArray *synsets;

//セクションインデックス
@property(nonatomic, strong) NSMutableArray *sectionIndices;
@property(nonatomic, strong) NSMutableArray *rowIndices;


@end