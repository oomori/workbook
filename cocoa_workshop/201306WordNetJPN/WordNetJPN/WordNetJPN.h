//
//  WordNetJPN.h
//
//  Created by 大森 智史 on 09/03/31.
//  Copyright 2009 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
//********************* Synset *************************
//関連性
//Synset 1:多 Sense
//Synset 1:多 Synlink
//Synset 1:多 SynsetDef


@interface Synset : NSObject {
	NSString *pos;		//品詞（名詞=n、動詞=v、形容詞=a、=r）
	NSString *synset;	//関連ID（"06589574-n"）
	NSString *src;		//（"eng30"）	
	NSString *name;		//名称（"publication"）

}

	@property (nonatomic, strong) NSString *synset;
	@property (nonatomic, strong) NSString *pos;
	@property (nonatomic, strong) NSString *name;
	@property (nonatomic, strong) NSString *src;
@end


//********************* Sense *************************
//概念クラス
//Sense 多:1 Word
//Sense 多:1 Synset
@interface Sense : NSObject {
	int rank;			//
	int lexid;			//
	NSString *__unsafe_unretained synset;	//
	int freq;			//
	NSString *__unsafe_unretained src;		//
	NSString *__unsafe_unretained lang;		//言語（日本語=jpn、英語=eng）
	int wordid;			//語 ID（1から始まる整数）
}
	//nonatomic　マルチスレッド環境を考慮しない代わりに高速。
	//retain retainする。
	//asign 参照を持つだけ
	@property (nonatomic, assign) int rank;	//ランク
	@property (nonatomic, assign) int lexid;	//
	@property (nonatomic, unsafe_unretained) NSString *synset;
	@property (nonatomic, assign) int freq;	//
	@property (nonatomic, unsafe_unretained) NSString *src;
	@property (nonatomic, unsafe_unretained) NSString *lang;
	@property (nonatomic, assign) int wordid;
@end

//語クラス
//********************* Word *************************
@interface Word : NSObject {
	int wordid;		//語 ID（1から始まる整数）
	NSString *__unsafe_unretained lang;	//言語（日本語=jpn、英語=eng）
	NSString *__unsafe_unretained lemma;//語（"理性的"、"アルデヒド"）
	NSString *__unsafe_unretained pron;	//
	NSString *__unsafe_unretained pos;	//品詞（名詞=n、動詞=v、形容詞=a、=r）
    
	NSString *__unsafe_unretained gloss;	// kaisetu 

}
	@property (nonatomic, assign) int wordid;
	@property (nonatomic, unsafe_unretained) NSString *lang;
	@property (nonatomic, unsafe_unretained) NSString *lemma;
	@property (nonatomic, unsafe_unretained) NSString *pron;
	@property (nonatomic, unsafe_unretained) NSString *pos;
    @property (nonatomic, unsafe_unretained) NSString *gloss;

@end


//********************* Synlink *************************
@interface Synlink : NSObject {
	NSString *__unsafe_unretained synset1;
	NSString *__unsafe_unretained synset2;
	NSString *__unsafe_unretained link;
	NSString *__unsafe_unretained src;

}
	@property (nonatomic, unsafe_unretained) NSString *synset1;
	@property (nonatomic, unsafe_unretained) NSString *synset2;
	@property (nonatomic, unsafe_unretained) NSString *link;
	@property (nonatomic, unsafe_unretained) NSString *src;
@end




@interface WordNetJPN : NSObject {
	//データベースファイルのファイルパス
    NSString *path;
    //データベース
	sqlite3 *database;
}

-(NSArray *)synsetArrayWithString:(NSString *)synset;
-(NSArray *)wordsArrayWithWordID:(int)wordid;
-(NSArray *)senseArrayWithWordsArray:(NSArray *)words;
-(NSArray *)synLinksArrayWithSence:(Sense *)sense link:(NSString *)link;
-(NSArray *)senseArrayWithWords:(NSArray *)words;
-(NSArray *)wordsArrayWithLemma:(NSString *)lemma;

//
- (id) initWithPath:(NSString *)aPath;

//Synsetと言語で、Wordの配列を返します。
-(NSArray *)wordsOfSynset:(NSString *)synset language:(NSString *)lang;


//語を与えてsynset（同じ意味合いの語のグループ）を得ます。
-(NSArray *)synsetArrayWithLemma:(NSString *)lemma;



@property (nonatomic, strong) NSString *path;

@end








