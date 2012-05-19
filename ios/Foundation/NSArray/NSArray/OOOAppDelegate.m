//
//  OOOAppDelegate.m
//  NSArray
//
//  Created by 大森 智史 on 12/04/15.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//  ARC ON

#import <mach/mach_time.h>
#import "OOOAppDelegate.h"

#import "CustomClass.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark initWithObjects:
-(void)method001
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:@"aaa",@"bbb",@"ccc",nil];
    
    NSLog(@"%s %@",__FUNCTION__,[anArray description]);
}

#pragma mark indexOfObjectPassingTest:
-(void)method002
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"aaa",@"bbb",@"ccc",
                                        @"aaa",@"bbb",@"ccc",
                                        @"aaa",@"bbb",@"ccc",nil];

    
    NSUInteger idx = [anArray indexOfObjectPassingTest:
                      ^ BOOL (id obj, NSUInteger idx, BOOL *stop)
                      {
                          //NSLog(@"002 %u,%@",idx,[obj description]);
                          
                          if (idx > 4) {
                              *stop = YES;
                          }
                          
                          if ([obj isEqualToString:@"bbb"]) {
                              return YES;    
                          }else {
                              return NO;
                          }
                          
                      }];
    
    if (idx == NSNotFound) {
        NSLog(@"Not Found");
    }else {
        NSLog(@"002 index = %u",idx);
    }

}
#pragma mark enumerateObjectsUsingBlock:
-(void)method003
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"aaa",@"bbb",@"ccc",
     @"ddd",@"eee",@"fff",
     @"ggg",@"hhh",@"iii",nil];
    
    [anArray enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"003==>%@", [obj description]);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;   
        }
    }];

}
#pragma mark sortedArrayUsingComparator:
-(void)method004
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"bbb",@"ggg",@"jjj",
     @"eee",@"fff",@"iii",
     @"ddd",@"hhh",@"aaa",nil];
    
    NSLog(@"004 %@",[anArray description]);
    
    NSArray *sortedArray = [anArray sortedArrayUsingComparator:
                            ^(id obj1,id obj2){
                                return [obj1 compare:obj2];
                            }];
    
    NSLog(@"004 %@",[sortedArray description]);
    
    
}

#pragma mark sortedArrayWithOptions:usingComparator:
-(void)method005
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"bbb",@"ggg",@"jjj",
     @"eee",@"fff",@"iii",
     @"ddd",@"hhh",@"aaa",nil];
    
    NSLog(@"005 %@",[anArray description]);
    
    NSArray *sortedArray = [anArray sortedArrayWithOptions:NSSortConcurrent//NSSortStable
                                           usingComparator:^(id obj1,id obj2){
                                return [obj1 compare:obj2];
                            }];
    //NSSortStableは元のソートが保持される
    //NSSortConcurrentは元のソートが保持されない代わりに高速
    NSLog(@"005 %@",[sortedArray description]);
    
    
}


#pragma mark filteredArrayUsingPredicate:
-(void)method006
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"abc",@"def",@"ghi",
     @"ihg",@"fed",@"cba",
     @"aaa",@"bbb",@"ccc",nil];
    
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"SELF LIKE '*a*'"];
    NSArray *aResult = [anArray filteredArrayUsingPredicate:aPredicate];
    
    NSLog(@"006 %@",[aResult description]);
    
    
}

#pragma mark arrayWithObjects:count:
-(void)method007
{
    NSString *strings[5];
    strings[0]=@"Jan";
    strings[1]=@"Feb";
    strings[2]=@"Mar";
    strings[3]=@"Apr";
    strings[4]=@"May";
    
    NSArray *anArray = [NSArray arrayWithObjects:strings count:3];
    NSLog(@"%@",[anArray description]);
    
    //=>(Jan,Feb,Mar)
}

#pragma mark arrayWithObjects:
-(void)method008
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",nil];
    NSLog(@"%@",[anArray description]);

    //=>(aaa,2,bbb,ccc)
}


#pragma mark arrayWithObject
-(void)method009
{
    
    NSArray *anArray = [NSArray arrayWithObject:@"aaa"];
    NSLog(@"%@",[anArray description]);

     //=>(aaa)
}

#pragma mark arrayWithContentsOfURL:
-(void)method010
{
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    
    NSArray *anArray = [NSArray arrayWithContentsOfURL:url];
    NSLog(@"010 = %@",[anArray description]);
    
    //バンドル内のplistfile.plistファイルからNSArrayがつくられる。
    //=>(aaa,2,bbb,ccc)
}

#pragma mark writeToURL:atomically:
-(void)method011
{
    //書き込み用のNSArrayを作成
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",nil];

   //メインバンドル内のResourceにplistfile2.plistファイルを作成
    NSFileManager *myFile = [ NSFileManager defaultManager];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSDate date],NSFileModificationDate,
                         @"owner",@"NSFileOwnerAccountName",
                         @"group",@"NSFileGroupOwnerAccountName",
                         nil,@"NSFilePosixPermissions",
                         [NSNumber numberWithBool:YES],@"NSFileExtensionHidden",
                         nil];

    NSMutableData *dat1 = [[NSMutableData alloc] initWithCapacity:1];
    
    [myFile changeCurrentDirectoryPath:[[[NSBundle mainBundle] resourcePath] stringByExpandingTildeInPath]];
    [myFile createFileAtPath:@"plistfile2.plist" contents:dat1 attributes:dic];
    NSLog(@"myFile path = %@",[myFile currentDirectoryPath]);
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile2" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    //書き込み
    [anArray writeToURL:url atomically:YES];

    //ファイルから読み込んで、NSArrayを作成
    NSArray *readArray = [NSArray arrayWithContentsOfFile:resourcePath];
    NSLog(@"011 = %@",[readArray description]);
    
    //=>(aaa,2,bbb,ccc)
}


#pragma mark arrayWithContentsOfFile:
-(void)method012
{
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile" ofType:@"plist"];
    
    NSArray *anArray = [NSArray arrayWithContentsOfFile:resourcePath];
    NSLog(@"012 = %@",[anArray description]);
    
    //バンドル内のplistfile.plistファイルからNSArrayがつくられる。
    //ファイルがないと例外が投げられます。
    //=>(aaa,2,bbb,ccc)
}

//監視対象のオブジェクト通知
-(void )observeValueForKeyPath:(NSString *)keyPath ofObject:( id )object 
                           change:(NSDictionary *)change 
                          context:(void *)context
{
    NSLog( @"key = %@,object = %@,change = %@" ,keyPath,[object description],[change description]);
} 
#pragma mark addObserver:toObjectsAtIndexes:forKeyPath:options:context:
-(void)method013
{
    NSMutableString *aString = [NSMutableString stringWithCapacity:1];
    [aString appendString:@"aString"];
    NSMutableArray *anArray = [NSMutableArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"ggg",@"hhh",nil];
    
    [anArray addObject:aString];
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:3];
    [indexSet addIndex:4];
    [indexSet addIndex:5];
    [indexSet addIndex:6];
    [indexSet addIndex:7];
    [indexSet addIndex:8];
    [indexSet addIndex:9];
    
    //
    [anArray addObserver:self //(NSObject *)anObserver
        toObjectsAtIndexes:indexSet //(NSIndexSet *)indexes
        forKeyPath:@"selection" //(NSString *)keyPath
        options:NSKeyValueObservingOptionInitial //(NSKeyValueObservingOptions )options
        context:nil //(void *)context
     ];
    [aString appendString:@"+aString"];
    [anArray removeObjectAtIndex:9];
    //NSLog(@"013 = %@",[anArray description]);
    
    //=>
}

#pragma mark addObserver:toObjectsAtIndexes:forKeyPath:options:context:
-(void)method014
{
    NSMutableString *aString = [NSMutableString stringWithCapacity:1];
    [aString appendString:@"aString"];
    
    NSMutableArray *anArray = [NSMutableArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"ggg",@"hhh",nil];
    
    [anArray addObject:aString];
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:3];
    [indexSet addIndex:4];
    [indexSet addIndex:5];
    [indexSet addIndex:6];
    [indexSet addIndex:7];
    [indexSet addIndex:8];
    [indexSet addIndex:9];
    
    //
    [anArray addObserver:self //(NSObject *)anObserver
              forKeyPath:@"selection" //(NSString *)keyPath
                 options:NSKeyValueObservingOptionInitial //(NSKeyValueObservingOptions )options
                 context:nil //(void *)context
     ];
    [aString appendString:@"+aString"];
    [anArray removeObjectAtIndex:9];
    //NSLog(@"014 = %@",[anArray description]);
    
    //=>
}

#pragma mark arrayByAddingObject:
-(void)method015
{
    
    NSArray *oldArray = [NSArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",nil];
    
    NSMutableString *aString = [NSMutableString stringWithCapacity:1];
    [aString appendString:@"aString"];
    
    
    
    NSLog(@"015 oldArray= <0x%08x>,%@",(unsigned int)oldArray,[oldArray description]);
    NSArray *newArray = [oldArray arrayByAddingObject:aString];
    
    NSLog(@"015 oldArray= <0x%08x>,%@",(unsigned int)oldArray,[oldArray description]);
    NSLog(@"015 newArray= <0x%08x>,%@",(unsigned int)newArray,[newArray description]);
    //=>015 oldArray= <0x0685d8b0>, (aaa,2,bbb,ccc)
    //=>015 oldArray= <0x0685d8b0>, (aaa,2,bbb,ccc)
    //=>015 newArray= <0x06a782d0>, (aaa,2,bbb,ccc,aString)
    
    
    //新しい配列(newArray)は古い配列(oldArray)をコピーしたので含まれる要素は同じもの
    //個々の要素が複製されているわけではない。
    NSLog(@"015 index0 of oldArray= <0x%08x>,%@",(unsigned int)[oldArray objectAtIndex:0],[oldArray objectAtIndex:0]);
    NSLog(@"015 index0 of newArray= <0x%08x>,%@",(unsigned int)[newArray objectAtIndex:0],[newArray objectAtIndex:0]);
    //=>015 index0 of oldArray= <0x0000671c>,aaa
    //=>015 index0 of newArray= <0x0000671c>,aaa

    //配列は変更不可でも、5番目の要素(indexは4)は変更可能文字列なので、変更できる
    NSLog(@"015 index4 of newArray= <0x%08x>,%@",(unsigned int)[newArray objectAtIndex:4],[newArray objectAtIndex:4]);
    //=>015 index4 of newArray= <0x068718d0>,aaa
    
    [aString appendString:@"+fff"];
    NSLog(@"015 index4 of newArray= <0x%08x>,%@",(unsigned int)[newArray objectAtIndex:4],[newArray objectAtIndex:4]);
    //=>015 index4 of newArray= <0x068718d0>,aString+fff
}

#pragma mark arrayByAddingObjectsFromArray:
-(void)method016
{
    
    NSArray *oldArray = [NSArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",nil];
    
    NSArray *otherArray = [NSArray arrayWithObjects:@"ddd",@"eee",@"fff",nil];
    
    NSLog(@"016 oldArray= <0x%08x>,%@",(unsigned int)oldArray,[oldArray description]);
    
    NSArray *newArray = [oldArray arrayByAddingObjectsFromArray:otherArray];
    
    NSLog(@"016 oldArray= <0x%08x>,%@",(unsigned int)oldArray,[oldArray description]);
    NSLog(@"016 newArray= <0x%08x>,%@",(unsigned int)newArray,[newArray description]);
    

    
    //=>016 oldArray= <0x0684f7b0>, (aaa,2,bbb,ccc)
    //=>016 oldArray= <0x0684f7b0>, (aaa,2,bbb,ccc)
    //=>016 newArray= <0x06a19140>, (aaa,2,bbb,ccc,ddd,eee,fff)

    
}

#pragma mark componentsJoinedByString:
-(void)method017
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",@"bbb",@"ccc",nil];
    NSString *aString = [anArray componentsJoinedByString:@":"];
    
    NSLog(@"017 %@",aString);
    //=>017 aaa:bbb:ccc
}

#pragma mark containsObject:
-(void)method018
{
    //比較用文字列作成
    NSMutableString *aaaMutable = [NSMutableString stringWithCapacity:1];
    [aaaMutable appendString:@"aaa"];
    NSString *aaaImmutable = [NSString stringWithString:@"aaa"];
    
    //NSMutableStringのaaaが含まれている配列か
    NSArray *array1 = [NSArray arrayWithObjects:aaaMutable,@"bbb",@"ccc",nil];
    NSLog(@"018 aaa contain ? = %@",[array1 containsObject:@"aaa"]?@"YES":@"NO");
    //=>018 aaa contain ? = YES

    //NSStringのaaaが含まれている配列か
    NSArray *array2 = [NSArray arrayWithObjects:aaaImmutable,@"bbb",@"ccc",nil];
    NSLog(@"018 aaa contain ? = %@",[array2 containsObject:@"aaa"]?@"YES":@"NO");
    //=>018 aaa contain ? = YES
    
    //NSNumberのint 3が含まれている配列か
    NSArray *array3 = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],@"bbb",@"ccc",nil];
    NSLog(@"018 3 contain ? = %@",[array3 containsObject:[NSNumber numberWithInt:3]]?@"YES":@"NO");
    //=>018 3 contain ? = YES
    
}

#pragma mark count
-(void)method019
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",@"bbb",@"ccc",nil];
    
    NSLog(@"019 %d",[anArray count]);
    //=>019 3
}

#pragma mark filteredArrayUsingPredicate:
-(void)method020
{
    
    NSArray *aArray = [NSArray arrayWithObjects:@"aaa",@"bbb", @"ccc", @"aaa",@"abc",@"これが",nil];
    
    NSPredicate *aPredicate1 = [NSPredicate predicateWithFormat:@"SELF IN %@",[NSArray arrayWithObjects:@"aaa", @"bbb", nil]];						
    NSPredicate *aPredicate2 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"aaa"];
    NSPredicate *aPredicate3 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"s"];
	NSPredicate *aPredicate4 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"a*"];
    
	NSPredicate *aPredicate5 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"*が*"];
    
    NSLog(@"020 %@",[[aArray filteredArrayUsingPredicate: aPredicate1 ] description]);
    //=>020 (aaa, bbb,aaa)
    NSLog(@"020 %@",[[aArray filteredArrayUsingPredicate: aPredicate2 ] description]);
    //=>020 (aaa,aaa)
    NSLog(@"020 %@",[[aArray filteredArrayUsingPredicate: aPredicate3 ] description]);
    //=>020 ()
    NSLog(@"020 %@",[[aArray filteredArrayUsingPredicate: aPredicate4 ] description]);
    //=>020 (aaa,aaa,abc)
    NSLog(@"020 %@",[[aArray filteredArrayUsingPredicate: aPredicate5 ] description]);
    //=>020 ("\U3053\U308c\U304c")
    
}


#pragma mark sortedArrayUsingSelector:

-(void)method021
{
    
    NSArray *ar =[[NSArray alloc] initWithObjects:@"aaa",@"cccc",@"bbb",@"a",nil] ;
    
    NSArray *retArr = [NSArray alloc] ;
    
    //普通に
    retArr = [ar sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"021 compare: %@",[retArr description]);
    // 021 compare: (a,aaa,bbb,cccc)
    
    //NSString+Extractとしてカテゴリを作っている。comparePlus:というメソッドを作成済み。
    //これは単に文字の長さが長いかを比べるメソッド
    retArr = [ar sortedArrayUsingSelector:@selector(compareLength:)];
    
    NSLog(@"021 %@",[retArr description]);
    //=>021 (cccc,aaa,bbb,a)
}

#pragma mark description
-(void)method022
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",@"bbb",@"ccc",nil];

    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method022]  : (aaa,bbb,ccc)

}

#pragma mark writeToFile:atomically:
-(void)method023
{
    //書き込み用のNSArrayを作成
    NSArray *anArray = [NSArray arrayWithObjects:@"file",[NSNumber numberWithFloat:3.0],@"bbb",@"ccc",nil];
    
    //メインバンドル内のResourceにplistfile2.plistファイルを作成
    NSFileManager *myFile = [ NSFileManager defaultManager];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSDate date],NSFileModificationDate,
                         @"owner",@"NSFileOwnerAccountName",
                         @"group",@"NSFileGroupOwnerAccountName",
                         nil,@"NSFilePosixPermissions",
                         [NSNumber numberWithBool:YES],@"NSFileExtensionHidden",
                         nil];
    
    NSMutableData *dat1 = [[NSMutableData alloc] initWithCapacity:1];
    
    [myFile changeCurrentDirectoryPath:[[[NSBundle mainBundle] resourcePath] stringByExpandingTildeInPath]];
    [myFile createFileAtPath:@"plistfile3.plist" contents:dat1 attributes:dic];
    NSLog(@"myFile path = %@",[myFile currentDirectoryPath]);
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile3" ofType:@"plist"];
    //書き込み
    [anArray writeToFile:resourcePath atomically:YES];
    
    //ファイルから読み込んで、NSArrayを作成
    NSArray *readArray = [NSArray arrayWithContentsOfFile:resourcePath];
    NSLog(@"%s : %@", __FUNCTION__,[readArray description]);
    
    //=>[OOOAppDelegate method023] : (file,3,bbb,ccc)

}

#pragma mark enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block
-(void)method024
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",@"bbb",@"ccc",nil];
    NSString *itemToFind = @"ccc";
    __block BOOL foundIt = NO;//ブロック内で変更できるように__blockを付ける
    //配列anArrayにcccが含まれるかどうかを探す。
    [anArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列 
                                         //NSEnumerationReverse  //逆向き
                                 usingBlock:^(id s,NSUInteger idx,BOOL *stop){
                                     
                                     if ([(NSString*)s isEqual:itemToFind]) {
                                         foundIt=YES; //見つけたらfoundItをYESに
                                         *stop=YES;     //見つけたら検索をストップ
                                     }
                                     return;
                                     
                                 }]; 
    
    NSLog(@"%s : %@", __FUNCTION__,foundIt?@"YES":@"NO");
    //=>[OOOAppDelegate method024] : YES
    
}
#pragma mark enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block
-(void)method025
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",@"bbb",@"ccc",nil];
    NSString *itemToFind = @"ccc";
    __block BOOL foundIt = NO;//ブロック内で変更できるように__blockを付ける
    //配列anArrayにcccが含まれるかどうかを探す。
    [anArray enumerateObjectsUsingBlock:^(id s,NSUInteger idx,BOOL *stop){
                                  
                                  if ([(NSString*)s isEqual:itemToFind]) {
                                      foundIt=YES; //見つけたらfoundItをYESに
                                      *stop=YES;     //見つけたら検索をストップ
                                  }
                                  return;
                                  
                              }]; 
    
    NSLog(@"%s : %@", __FUNCTION__,foundIt?@"YES":@"NO");
    //=>[OOOAppDelegate method025] : YES
    
}

#pragma mark sortedArrayUsingComparator:
-(void)method026
{

    NSArray *anArray = [NSArray arrayWithObjects:@"ccc",@"aaa",@"bbb",nil];    
    NSArray *sortedArray =[anArray sortedArrayUsingComparator:^(id obj1, id obj2) {
        return (NSComparisonResult)[obj1 compare:obj2];
        }
     ];
    
    NSLog(@"%s : %@", __FUNCTION__,[sortedArray description]);
    //=>[OOOAppDelegate method026] : (aaa,bbb,ccc)
    
}

#pragma mark sortedArrayUsingFunction:context:
NSInteger intSort(id val1, id val2, void *context)
{
    int iVal1 = [val1 integerValue];
    int iVal2 = [val2 integerValue];
    if (iVal1 < iVal2)
        return NSOrderedAscending;
    else if (iVal1 > iVal2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}
-(void)method027
{
    
    NSArray *anArray =[[NSArray alloc] initWithObjects:
                       [NSNumber numberWithInteger:345],
                       [NSNumber numberWithInteger:1233],
                       [NSNumber numberWithInteger:567],
                       [NSNumber numberWithInteger:912],
                       [NSNumber numberWithInteger:1],
                       nil] ;
    NSArray *retArr = [anArray sortedArrayUsingFunction:intSort context:NULL];
    
    NSLog(@"%s : %@", __FUNCTION__,[retArr description]);
    //=>[OOOAppDelegate method027] : (1,345,567,912,1233)
    
}

#pragma mark initWithArray:
-(void)method028
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:aaa,bbb,ccc,nil];
    
    NSArray *anotherArray = 
    [[NSArray alloc] initWithArray:anArray];
    
    id obj1 = [anArray objectAtIndex:1];
    NSLog(@"028 newArray= <0x%08x>,%@",(NSUInteger)obj1,obj1);
    id obj2 = [anotherArray objectAtIndex:1];
    NSLog(@"028 newArray= <0x%08x>,%@",(NSUInteger)obj2,obj2);
    //=>028 newArray= <0x06868170>,bbb
    //=>028 newArray= <0x06868170>,bbb
    
    //bbbに+を追加してみる
    [bbb appendString:@"+"];
    
    NSLog(@"028 newArray= <0x%08x>,%@",(NSUInteger)obj1,obj1);
    NSLog(@"028 newArray= <0x%08x>,%@",(NSUInteger)obj2,obj2);
    //obj1もobj2も同じbbbを示しているのでbbb+に変わっている
    //=>028 newArray= <0x06868170>,bbb+
    //=>028 newArray= <0x06868170>,bbb+
}

#pragma mark initWithArray:copyItems:
-(void)method029
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:aaa,bbb,ccc,nil];
    
    NSArray *anotherArray = 
    [[NSArray alloc] initWithArray:anArray copyItems:YES];
    
    id obj1 = [anArray objectAtIndex:1];
    NSLog(@"029 obj1= <0x%08x>,%@",(NSUInteger)obj1,obj1);
    id obj2 = [anotherArray objectAtIndex:1];
    NSLog(@"029 obj2= <0x%08x>,%@",(NSUInteger)obj2,obj2);
    //コピーされているので違うオブジェクトを含んでいる
    //=>029 obj1= <0x06838ee0>,bbb
    //=>029 obj2= <0x06838f80>,bbb
    
    //bbbに+を追加してみる
    [bbb appendString:@"+"];
    
    NSLog(@"029 obj1= <0x%08x>,%@",(NSUInteger)obj1,obj1);
    NSLog(@"029 obj2= <0x%08x>,%@",(NSUInteger)obj2,obj2);
    //obj1とobj2は違うNSString示しているのでobj2はbbbのまま
    //=>029 obj1= <0x06838ee0>,bbb+
    //=>029 obj2= <0x06838f80>,bbb

}

#pragma mark initWithContentsOfURL:
-(void)method030
{
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile" ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    
    NSArray *anArray = [[NSArray alloc] initWithContentsOfURL:url];
    NSLog(@"%s = %@",__FUNCTION__,[anArray description]);
    //バンドル内のplistfile.plistファイルからNSArrayがつくられる。
    //=>(aaa,2,bbb,ccc)
    
    //
    NSMutableArray *muArray = [[NSMutableArray alloc] initWithContentsOfURL:url];
    NSLog(@"%s = %@",__FUNCTION__,[muArray description]);
    [muArray removeObjectAtIndex:1];
    NSLog(@"%s = %@",__FUNCTION__,[muArray description]);
    
}

#pragma mark initWithContentsOfFile:
-(void)method031
{
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"plistfile" ofType:@"plist"];
    
    NSArray *anArray = [[NSArray alloc] initWithContentsOfFile:resourcePath];
    NSLog(@"%s = %@",__FUNCTION__,[anArray description]);
    
    //バンドル内のplistfile.plistファイルからNSArrayがつくられる。
    //ファイルがないと例外が投げられます。
    //=>(aaa,2,bbb,ccc)
}

#pragma mark NSArray:高速列挙は高速か？
-(void)method032
{
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",nil];
	
	//Enumeratorを使う場合	
	id obj;
	NSEnumerator *aEnumerator;
	
	
	//ナノ秒レベルの時間計測
    //<mach/mach_time.h>が必要
    //Saki さん Thanks!
    //http://blog.livedoor.jp/yousuke_saki/archives/51494672.html
    uint64_t start, elapsed;
    start = mach_absolute_time();
    //↓計測対象
    aEnumerator = [anArray objectEnumerator];
    while ((obj = [aEnumerator nextObject]) != nil) {
		//NSLog(@"%@",(NSString *)obj);
	}
	//↑計測対象
    elapsed = mach_absolute_time() - start;
    mach_timebase_info_data_t base;
    mach_timebase_info(&base);
    uint64_t nsec1 = elapsed * base.numer / base.denom;
    NSLog(@"%llu nano second",nsec1);
    //時間計測終了
    
	
    start = mach_absolute_time();
    //↓計測対象
    //高速列挙を使う
	id fastObj;
	for (fastObj in anArray) {
		//NSLog(@"%@",(NSString *)fastObj);
	}
    
    //↑計測対象
    elapsed = mach_absolute_time() - start;
    //mach_timebase_info_data_t base;
    mach_timebase_info(&base);
    uint64_t nsec2 = elapsed * base.numer / base.denom;
    NSLog(@"%llu nano second",nsec2);
    
    NSLog(@"%.2f %%",(((float)nsec2/(float)nsec1))*100);
    //時間計測終了
    
    
}

#pragma mark initWithKey:
//NSArrayをソートする
-(void)method033
{
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    
    
    [arr addObject: @"aaa4" ];
    [arr addObject: @"aaa2" ];
    [arr addObject: @"aaa3" ];
    [arr addObject: @"aaa1" ];
    
    NSSortDescriptor *descriptor=[[NSSortDescriptor alloc] initWithKey:nil
                                                             ascending:YES];
    
    NSArray *sortedArray = [arr sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]] ;
    
    NSLog(@"%s %@",__FUNCTION__,[arr description]);
    //=>-[OOOAppDelegate method003] (aaa4,aaa2,aaa3,aaa1)
    
    NSLog(@"%s %@",__FUNCTION__,[sortedArray description]);
    
    //=>-[OOOAppDelegate method003] (aaa1,aaa2,aaa3,aaa4)
    
}
#pragma mark makeObjectsPerformSelector:
//各オブジェクトにメッセージを送信
-(void)method034
{
    CustomClass *customClass1 = [[CustomClass alloc] init];
        NSMutableString *muStr1 = [[NSMutableString alloc] initWithCapacity:0];
        [muStr1 appendString:@"aaa"];
        [customClass1 setCustomClassValue:muStr1];
    CustomClass *customClass2 = [[CustomClass alloc] init];
        NSMutableString *muStr2 = [[NSMutableString alloc] initWithCapacity:0];
        [muStr2 appendString:@"bbb"];
        [customClass2 setCustomClassValue:muStr2];
    CustomClass *customClass3 = [[CustomClass alloc] init];
        NSMutableString *muStr3 = [[NSMutableString alloc] initWithCapacity:0];
        [muStr3 appendString:@"ccc"];
        [customClass3 setCustomClassValue:muStr3];
    
    NSArray *arr =[[NSArray alloc] initWithObjects:customClass1,
                                                    customClass2,
                                                    customClass3,
                   nil];
    NSLog(@"%s %@,%@,%@",__FUNCTION__,[arr objectAtIndex:0],[arr objectAtIndex:1],[arr objectAtIndex:2]);
    //=>-[OOOAppDelegate method034] aaa,bbb,ccc
    [arr makeObjectsPerformSelector: @selector(appendSomeString)];
    //appendSomeStringは末尾に ! を付けるだけのメソッド
    
    NSLog(@"%s %@,%@,%@",__FUNCTION__,[arr objectAtIndex:0],[arr objectAtIndex:1],[arr objectAtIndex:2]);
    //=>-[OOOAppDelegate method034] aaa!,bbb!,ccc!
    
}

#pragma mark setValue:forKey:
-(void)method035
{
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    
    NSMutableDictionary *dic1 = 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa4",@"key1",@"bbb1",@"key2",@"ccc1",@"key3",nil];
    NSMutableDictionary *dic2 = 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa2",@"key1",@"bbb2",@"key2",@"ccc2",@"key3",nil];
    NSMutableDictionary *dic3 = 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa1",@"key1",@"bbb3",@"key2",@"ccc3",@"key3",nil];
    NSMutableDictionary *dic4 = 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa3",@"key1",@"bbb4",@"key2",@"ccc4",@"key3",nil];
    
    [arr addObject: dic1 ];
    [arr addObject: dic2 ];
    [arr addObject: dic3 ];
    [arr addObject: dic4 ];
    
    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,[[arr objectAtIndex:0] valueForKey:@"key1"],
          [[arr objectAtIndex:1] valueForKey:@"key1"],
          [[arr objectAtIndex:2] valueForKey:@"key1"],
          [[arr objectAtIndex:3] valueForKey:@"key1"]);
    //=>-[OOOAppDelegate method035] aaa4,aaa2,aaa1,aaa3
    [arr setValue:@"xxx" forKey:@"key1"];
    
    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,[[arr objectAtIndex:0] valueForKey:@"key1"],
          [[arr objectAtIndex:1] valueForKey:@"key1"],
          [[arr objectAtIndex:2] valueForKey:@"key1"],
          [[arr objectAtIndex:3] valueForKey:@"key1"]);
    
    //=>-[OOOAppDelegate method035] xxx,xxx,xxx,xxx
    
}
#pragma mark indexOfObject:inSortedRange:options:usingComparator:
-(void)method036
{
    // テストデータの範囲
    NSUInteger amount = 900000;
    // 探すデータ
    NSNumber* number = [NSNumber numberWithInt:724242];
    
    // Create some array.
    NSMutableArray* anArray = [NSMutableArray arrayWithCapacity:amount];
    for (NSUInteger i = 0; i < amount; ++i) {;
        [anArray addObject:[NSNumber numberWithUnsignedInteger:i]];
    }

    //
    NSUInteger index1 = [anArray indexOfObject:number 
                        inSortedRange:NSMakeRange(0, [anArray count]) 
                              options:NSBinarySearchingFirstEqual 
                      usingComparator:^(id obj1,id obj2) {
                          NSInteger iVal1 = [obj1 integerValue];
                          NSInteger iVal2 = [obj2 integerValue];
                          if (iVal1 < iVal2)
                              return NSOrderedAscending;
                          else if (iVal1 > iVal2)
                              return NSOrderedDescending;
                          else
                              return NSOrderedSame;
                      }];
    NSLog(@"%s %d",__FUNCTION__ ,index1);
                            
}
#pragma mark indexOfObject:inSortedRange:options:usingComparator:
-(void)method037
{
    // テストデータの範囲
    NSUInteger amount = 900000;
    NSMutableArray* anArray = [NSMutableArray arrayWithCapacity:amount];
    for (NSUInteger i = 0; i < amount; ++i) {;
        CustomClass *customClass = [[CustomClass alloc] init];
        NSMutableString *muStr = [[NSMutableString alloc] initWithCapacity:0];
        [muStr appendFormat:@"string%d",i];
        [customClass setCustomClassValue:muStr];
        
        [customClass setCustomNumber:[NSNumber numberWithUnsignedInteger:i]];
        [anArray addObject:customClass];
    }
    // 探すデータ
    
    NSNumber* number = [NSNumber numberWithInt:824242];
    CustomClass *searchObj = [[CustomClass alloc] init];
    NSMutableString *muStr = [[NSMutableString alloc] initWithCapacity:0];
    [muStr appendFormat:@"string%d",[number integerValue]];
    [searchObj setCustomClassValue:muStr];    
    [searchObj setCustomNumber:number];

    
    //
    NSUInteger index1 = [anArray indexOfObject:searchObj 
                                 inSortedRange:NSMakeRange(0, [anArray count]) 
                                       options:NSBinarySearchingFirstEqual 
                               usingComparator:^(id obj1,id obj2) {
                                   NSInteger iVal1 = [[obj1 customNumber] integerValue];
                                   NSInteger iVal2 = [[obj2 customNumber] integerValue];
                                   if (iVal1 < iVal2)
                                       return NSOrderedAscending;
                                   else if (iVal1 > iVal2)
                                       return NSOrderedDescending;
                                   else
                                       return NSOrderedSame;
                               }];
    NSLog(@"%s %@",__FUNCTION__ ,[(CustomClass *)[anArray objectAtIndex:index1] customClassValue]);
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self method001];
    [self method002];
    [self method003];
    [self method004];
    [self method005];
    [self method006];
    [self method007];
    [self method008];
    [self method009];
    [self method010];
    [self method011];
    [self method012];
    [self method013];
    //[self method014];
    [self method015];  
    [self method016];
    [self method017];
    [self method018];
    [self method019];
    [self method020];
    [self method021];
    [self method022];
    [self method023];
    [self method024];
    [self method025];
    [self method026];
    [self method027];
    [self method028];
    [self method029];
    [self method030];
    [self method031];
    [self method032];
    [self method033];
    [self method034];
    [self method035];
    [self method036];
    [self method037];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
