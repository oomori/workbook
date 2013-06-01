//
//  OOOSecondViewController.m
//  WordNetJPN
//
//  Created by 大森 智史 on 2013/04/14.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOSecondViewController.h"

#import "WordNetJPN.h"


//@synthesize words;
//@synthesize selectedWords;


@interface OOOSecondViewController ()

@end



@implementation OOOSecondViewController


@synthesize words;
@synthesize selectedWords;
@synthesize synsets;
@synthesize sectionIndices;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    words = [NSMutableArray arrayWithCapacity:10];
    selectedWords = [NSMutableArray arrayWithCapacity:10]; 
    synsets = [NSMutableArray arrayWithCapacity:10];
    

}

- (IBAction)search:(id)sender
{
    /*
    //辞書ファイルから辞書を作る
	NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"wnjpn" ofType:@"db"];
    
	WordNetJPN *wordnet = [[WordNetJPN alloc] initWithPath:path];
    
	//語を与えて関連語セットを返す
	self.synsets = [(NSArray *)[wordnet synsetArrayWithLemma:@"パンダ"] mutableCopy];
	for (Synset* synset in synsets) {
		NSArray *words1 = [wordnet wordsOfSynset:synset.synset language:@"jpn"];
		NSLog(@"---------関連グループ-----------------------------------");
		for (Word *element in words1) {
			
			NSLog(@"%@,品詞:%@", element.lemma , element.pos);
		}
	}
*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark -
#pragma mark Search


- (void) searchBarSearchButtonClicked: (UISearchBar *) searchBar {
    [searchBar resignFirstResponder];
    [self searchItem:searchBar.text];
}

-(void)searchItem:(NSString *)searchString
{
    
    //検索結果を一旦全部削除
    [selectedWords removeAllObjects];
    self.sectionIndices = 0;
    int sectionIndex = 0;
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"wnjpn" ofType:@"db"];
    
	WordNetJPN *wordnet = [[WordNetJPN alloc] initWithPath:path];
    
	//語を与えて関連語セットを返す
	self.synsets = [(NSArray *)[wordnet synsetArrayWithLemma:searchString] mutableCopy];
    NSLog(@"synset　%d",[self.synsets count]);
    
	for (Synset* synset in synsets) {
		sectionIndex++;
        NSArray *words1 = [wordnet wordsOfSynset:synset.synset language:@"jpn"];
		NSLog(@"---------関連グループ-----------------------------------");
        
        //セクション内
		for (Word *element in words1) {
            [selectedWords addObject:element.lemma];
			NSLog(@"%d,%@,品詞:%@", sectionIndex,element.lemma , element.pos);
		}
        [selectedWords addObject:@"------------------"];
	}

    
    
}
- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *) searchText {
    if ([searchText length]!=0) {
        // インクリメンタル検索
        [self searchItem:searchText];
        
    }
}

- (BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchString:(NSString*)searchString {
    if ([searchString length]!=0) {
        [self searchItem:searchString];
    }
    
    return YES;
}

#pragma mark -
#pragma mark Table Data source Methods

// セクション数はself.synsets
- (NSInteger)numberOfSections {
    return [self.synsets count];
}

-(NSInteger)tableView:( UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
	return ([self.selectedWords count]>0)?[self.selectedWords count]:[self.words count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /*
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
	[self.navigationController pushViewController:detailViewController animated:YES];
    */
    /*
     //特別な画面遷移
     DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
     detailViewController.view.frame = self.view.bounds;
     detailViewController.view.alpha = 0.0;
     [self.view addSubview:detailViewController.view];
     
     [UIView transitionWithView:detailViewController.view duration:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
     detailViewController.view.alpha = 1.0;
     } completion:^(BOOL finished) {
     [self.navigationController pushViewController:detailViewController animated:NO];
     [detailViewController.view removeFromSuperview];
     }];
     */
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}
-(UITableViewCell *)tableView:( UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	static NSString *CellIdentifier = @"CellTableIdentifier";
    
    UITableViewCell *aCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (aCell == nil) {
        aCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    if ([self.selectedWords count]>0){
        //aCell.textLabel.text = [[self.synsets objectAtIndex:[indexPath indexAtPosition:0]] objectAtIndex:[indexPath indexAtPosition:1]];
        aCell.textLabel.text = [self.selectedWords objectAtIndex:row ];
        
        NSArray *synsetArray = [self.synsets objectAtIndex:[indexPath indexAtPosition:0]];
        NSLog(@"%d %@",[indexPath indexAtPosition:1],[synsetArray description] );
        
        //[wordnet wordsOfSynset:synset.synset language:@"jpn"]
    }else{
        if (![searchField.text length]) {
            aCell.textLabel.text = [self.words objectAtIndex:row ];
        }
        //
        
    }
    
	return aCell;
}


@end
