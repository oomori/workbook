//
//  OOOFirstViewController.m
//  WordNetJPN
//
//  Created by 大森 智史 on 2013/04/14.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOFirstViewController.h"
#import "DetailViewController.h"

#import "WordNetJPN.h"

@interface OOOFirstViewController ()

@end

@implementation OOOFirstViewController

@synthesize words;
@synthesize selectedWords;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    words = [NSMutableArray arrayWithCapacity:10];
    selectedWords = [NSMutableArray arrayWithCapacity:10];
    
    //read file
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"sampleText" withExtension:@"txt"];
    
    //add object
	NSString *multiLine = [NSString stringWithContentsOfURL:modelURL encoding:NSUTF8StringEncoding error:nil];
    
	[multiLine enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
		[words addObject:line];
	}];

    
}

- (IBAction)search:(id)sender
{
    //辞書ファイルから辞書を作る
	
    
	NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"wnjpn" ofType:@"db"];
    
	WordNetJPN *wordnet = [[WordNetJPN alloc] initWithPath:path];
    
	//語を与えて関連語セットを返す
	NSArray *synsets = [wordnet synsetArrayWithLemma:@"パンダ"];
	for (Synset* synset in synsets) {
		NSArray *words1 = [wordnet wordsOfSynset:synset.synset language:@"jpn"];
		NSLog(@"---------関連グループ-----------------------------------");
		for (Word *element in words1) {
			
			NSLog(@"%@,品詞:%@", element.lemma , element.pos);
		}
	}
	
	/*
	//語それぞれに対してリンクを返す。
	NSArray *theWords = [wordnet getWords:@"人間"];
	
	NSArray *senseArray;
	if (theWords){
		senseArray = [wordnet getSenses:theWords];
		
		NSUInteger i, count = [senseArray count];
		for (i = 0; i < count; i++) {
			NSLog(@"----------------------------------");
			Sense *sense = senseArray[i];
			//
			NSArray *wordArray = [wordnet getWord:sense.wordid];
			NSUInteger u2, wordCount = [wordArray count];
			for (u2 = 0; u2 < wordCount; u2++) {
				Word *word = wordArray[u2];
				NSLog(@"「%@」 についての関連語",word.lemma);
			}
			
			//NSLog(@"getSsenses--%@,%d",sense.synset,sense.lexid);
			NSArray *synsetArray3 = [wordnet getSynset:sense.synset];
			Word* word3 = (Word *)synsetArray3[0];
			NSLog(@"「%@」の下位語を表示",word3.lemma);
            
			NSArray *synLinks = [wordnet getSynLinks: sense link:@"hypo"];
			//hype 上位語
			//hypo 下位語
			//inst インスタンス
			NSUInteger u, count2 = [synLinks count];
            for (u = 0; u < count2; u++) {
                Synlink *synlink = synLinks[u];
                
                NSArray *synsetArray1 = [wordnet getSynset:synlink.synset1];
                Word* word1 = (Word *)synsetArray1[0];
                NSArray *synsetArray2 = [wordnet getSynset:synlink.synset2];
                Word* word2 = (Word *)synsetArray2[0];
                NSLog(@"%@ -> %@",word1.lemma,word2.lemma);
                [wordnet getSynset:synlink.synset2];
            }
			
			
		}
	}else{
		NSLog(@"NG");
	}
	*/
	//オブジェクト解放

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
    
    
    
    //検索に使う関連語の配列
    NSMutableArray *searchStringArray =  [NSMutableArray arrayWithCapacity:0];
    
    
    
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"wnjpn" ofType:@"db"];
    
	WordNetJPN *wordnet = [[WordNetJPN alloc] initWithPath:path];
    
	//語を与えて関連語セットを返す
	NSArray *synsets = [wordnet synsetArrayWithLemma:searchString];
	for (Synset* synset in synsets) {
		NSArray *words1 = [wordnet wordsOfSynset:synset.synset language:@"jpn"];
        
        
		for (Word *element in words1) {
			[searchStringArray addObject:element.lemma];
			//NSLog(@"%@,品詞:%@", element.lemma , element.pos);
		}
        
        //NSLog(@"count %d",[searchStringArray count]);
	}
	
    [searchStringArray addObject:searchString];
    
    
    
    
    
    
    
    //検索文字が含まれるかどうか
    for(NSString *aString in self.words) {
        
        
        // 形態素解析。今は品詞がとれないので使わない。
        /*
         NSString *targetScheme = NSLinguisticTagSchemeLexicalClass;//品詞。英語のみ,Verb,Noun,SentenceTerminator
         
         
         NSArray *aScheme = [NSArray arrayWithObject:targetScheme];
         NSLinguisticTagger *aTagger = [[NSLinguisticTagger alloc] initWithTagSchemes:aScheme options:0];
         
         //ブロック内での結果を得るためにNSArrayを作っておく
         __block NSMutableArray *tagArray =  [NSMutableArray arrayWithCapacity:0];
         
         [aTagger setString:searchString];
         [aTagger enumerateTagsInRange:NSMakeRange(0, [searchString length])
         scheme:targetScheme
         options:(NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation)
         usingBlock: ^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
         NSString *token = [searchString substringWithRange:tokenRange];
         NSString *sentence = [searchString substringWithRange:sentenceRange];
         //あとで使うためにNSDictionaryにいれて
         NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
         tag,@"tag",
         token,@"token",
         sentence,@"sentence",
         nil];
         //aDictionaryをNSArrayに入れる
         [tagArray addObject:aDictionary];
         
         }
         ];
         
         
         NSLog(@"%s", __FUNCTION__);
         for (NSDictionary *tempDic in tagArray) {
         NSLog(@"tag = %@,token = %@,sentence = %@",[tempDic objectForKey:@"tag"],
         [tempDic objectForKey:@"token"],
         [tempDic objectForKey:@"sentence"]);
         }
         */
        
        
        
        for(NSString *obj in searchStringArray) {
            
            NSRange range = [aString rangeOfString:obj options:NSLiteralSearch];
            
            
            
            if(range.location!=NSNotFound){
                //if ([synsets count]) {
                //NSLog(@"%@,%@", obj,aString);
                [selectedWords addObject:aString];
                //}
                break;
            }
            
        }
        
        
        
       
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
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
	[self.navigationController pushViewController:detailViewController animated:YES];
    
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
        aCell.textLabel.text = [self.selectedWords objectAtIndex:row ];
    }else{
        if (![searchField.text length]) {
            aCell.textLabel.text = [self.words objectAtIndex:row ];
        }
      //
        
    }

	return aCell;
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        //[[segue destinationViewController] setDetailItem:object];
    }
}
 */
@end
