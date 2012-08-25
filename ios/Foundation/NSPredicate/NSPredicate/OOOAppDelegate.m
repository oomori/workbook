//
//  OOOAppDelegate.m
//  NSPredicate
//
//  Created by 大森 智史 on 12/04/17.
//  Copyright (c) 2012 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;
#pragma mark NSPredicate:predicateWithFormat:
-(void)method001
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"abc",@"def",@"ghi",
     @"ihg",@"fed",@"cba",
     @"aaa",@"bbb",@"ccc",nil];
    
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"SELF LIKE '*a*'"];
    NSArray *aResult = [anArray filteredArrayUsingPredicate:aPredicate];
    
    NSLog(@"001 %@",[aResult description]);
    
    
}

#pragma mark NSPredicate:predicateWithFormat:
-(void)method002
{
    NSDictionary *tanaka = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:30],@"age" ,
                            @"Tanaka",@"lastName",@"Taro",@"firstName",nil];
    NSDictionary *sato = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:43],@"age" ,
                            @"Sato",@"lastName",@"Satoko",@"firstName",nil];
    NSDictionary *suzuki = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:39],@"age" ,
                            @"Suzuki",@"lastName",@"Ichiro",@"firstName",nil];
    NSDictionary *yamada = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:12],@"age" ,
                            @"Yamada",@"lastName",@"Jiro",@"firstName",nil];
    
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:tanaka,sato,suzuki,yamada,nil];
    
    
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"age < 40"];
    NSArray *aResult = [anArray filteredArrayUsingPredicate:aPredicate];
    
    NSLog(@"%s - 1 %@",__FUNCTION__,[aResult description]);
    // -[OOOAppDelegate method002] - 1 ({age = 30;firstName = Taro;lastName = Tanaka;},{age = 39;firstName = Ichiro;lastName = Suzuki;},{age = 12;firstName = Jiro;lastName = Yamada;})
    
    
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:
                               @"(firstName like \"Tanaka\") OR (firstName like \"Jiro\")"];
    NSArray *bResult = [anArray filteredArrayUsingPredicate:bPredicate];
    
    NSLog(@"%s - 2 %@",__FUNCTION__,[bResult description]);
    //=>-[OOOAppDelegate method002] - 2 ({age = 12;firstName = Jiro;lastName = Yamada;})
    
    
}

#pragma mark NSPredicate:evaluateWithObject:
-(void)method003
{
    NSNumber *one = [NSNumber numberWithInteger:0];
    NSNumber *ten = [NSNumber numberWithInteger:19];
    NSPredicate *betweenPredicate = [NSPredicate predicateWithFormat: @"age BETWEEN %@",
                                     [NSArray arrayWithObjects:one, ten, nil]];
    
    NSNumber *five = [NSNumber numberWithInteger:18];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:five forKey:@"age"];
    
    BOOL between = [betweenPredicate evaluateWithObject:dictionary];
    
    if (between) {
        NSLog(@"child");
    }
    
    NSLog(@" %s %@", __FUNCTION__,[betweenPredicate predicateFormat]);
}

#pragma mark NSPredicate:predicateWithFormat:
-(void)method004
{
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"Abc",@"def",@"ghi",
     @"ihg",@"fed",@"cba",
     @"aaa",@"bbb",@"ccc",nil];
    
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"SELF LIKE '*a*'"];
    NSArray *aResult = [anArray filteredArrayUsingPredicate:aPredicate];
    NSLog(@"004 -1%@",[aResult description]);
    
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF LIKE[c] '*a*'"];
    NSArray *bResult = [anArray filteredArrayUsingPredicate:bPredicate];
    NSLog(@"004 -2%@",[bResult description]);
    
    
}

#pragma mark NSPredicate  predicateWithFormat:
-(void)method005
{
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:
     [NSNumber numberWithInteger:3],
     [NSNumber numberWithInteger:6],
     [NSNumber numberWithInteger:9],
     [NSNumber numberWithInteger:12],nil];
    
    NSMutableArray *secondArray = [[NSMutableArray alloc] init];

    [secondArray addObject:[NSNumber numberWithInteger:6]];
    [secondArray addObject:[NSNumber numberWithInteger:9]];
    NSPredicate *aPredicate = [NSPredicate
                                 predicateWithFormat:@"SELF == %@ OR SELF == %@"argumentArray:secondArray];

    //brand_id LIKE %@ AND brand_id LIKE %@ AND brand_id LIKE %@ AND brand_id LIKE %@ AND brand_id LIKE %@ AND item_category LIKE %@ AND item_make LIKE %@ AND item_gender LIKE %@ || item_price>%@ || item_price<%@
    
    NSArray *aResult = [anArray filteredArrayUsingPredicate:aPredicate];
    
    NSLog(@"%s %@",__FUNCTION__,[aResult description]);
    NSLog(@"%s %@", __FUNCTION__,[aPredicate predicateFormat]);
    
}

#pragma mark NSPredicate  predicateWithFormat:
va_list dynamicArgument(int arg_num , ...) {
	va_list args;
	int p , count;
	if (arg_num < 1) return nil;
	va_start(args , arg_num);
    
    //printf("項目数 = %d\n" , arg_num);
	for (count = 0 ; count < arg_num ; count++) {
		p = (int)va_arg(args , int *);
		//printf("第%d引数 = %d\n" , count + 2 , p);
        
	}
    
	va_end(args);
	return args;
}
-(void)method006
{
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:@"a",
     [NSNumber numberWithInteger:34],
     [NSNumber numberWithInteger:6],
     [NSNumber numberWithInteger:9],
     [NSNumber numberWithInteger:12],nil];
    
    NSString *format = @"SELF == %d OR SELF == %d";

    va_list ap = dynamicArgument('a' , 9 , 20 , 30 , 40, 100);

    
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat: format arguments: ap];
    
    NSArray *aResult = [anArray filteredArrayUsingPredicate:aPredicate];
    
    NSLog(@"%s %@",__FUNCTION__,[aResult description]);
    
}

#pragma mark NSPredicate predicateWithSubstitutionVariables
-(void)method007
{
    //ダミーの人データを作成、苗字・名前・年齢
    NSDictionary *tanaka = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:30],@"age" ,
                            @"Tanaka",@"lastName",@"Taro",@"firstName",nil];
    NSDictionary *sato = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:43],@"age" ,
                          @"Sato",@"lastName",@"Satoko",@"firstName",nil];
    NSDictionary *suzuki = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:39],@"age" ,
                            @"Suzuki",@"lastName",@"Ichiro",@"firstName",nil];
    NSDictionary *yamada = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:12],@"age" ,
                            @"Yamada",@"lastName",@"Jiro",@"firstName",nil];
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:tanaka,sato,suzuki,yamada,nil];
    
    
    //テンプレート作成
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"$minAge <= age AND age < $maxAge"];

    //年齢条件作成
    NSNumber *min = [NSNumber numberWithInteger:10];
    NSNumber *max = [NSNumber numberWithInteger:35];
    NSDictionary *variables = [NSDictionary dictionaryWithObjectsAndKeys:min, @"minAge", max, @"maxAge", nil];
    //テンプレートを利用して条件式を作成
    NSPredicate *bPredicate = [predicate predicateWithSubstitutionVariables:variables];
    //検索
    NSArray *bResult = [anArray filteredArrayUsingPredicate:bPredicate];
    NSLog(@"%s %@",__FUNCTION__,[bResult description]);
}

#pragma mark NSPredicate  predicateWithFormat:
-(void)method008
{
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:   @"abc",@"def",@"ghi",
     @"ihg",@"fed",@"cba",
     @"aaa",@"bbb",@"ccc",nil];
    
    NSPredicate *aPredicate = [NSPredicate predicateWithValue:YES];
    
    int max = 1000;
    int min = 10;
    int randomNumber = (arc4random() % max) + min;
    
    if (randomNumber > 500) {
        aPredicate = [NSPredicate predicateWithFormat:@"SELF LIKE '*a*'"];
    }
    NSArray *aResult = [anArray filteredArrayUsingPredicate:aPredicate];
    NSLog(@"%s %d %@",__FUNCTION__,randomNumber,[aResult description]);
    
}

#pragma mark NSPredicate  predicateWithBlock:
-(void)method009
{
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:   @"abc",@"def",@"ghi",
     @"ihg",@"fed",@"cba",
     @"aaa",@"bbb",@"ccc",nil];

     NSPredicate* aPredicate = [NSPredicate predicateWithBlock:
                      ^BOOL(id obj, NSDictionary *d) {
                          NSString* s = obj;
                          //NSLog(@"%s %@",__FUNCTION__,[d description]);
                          return ([s rangeOfString:@"a"
                                           options:NSCaseInsensitiveSearch].location != NSNotFound);
                      }];
    
    
    NSArray *aResult = [anArray filteredArrayUsingPredicate:aPredicate];
    NSLog(@"%s %@",__FUNCTION__,[aResult description]);
    
}

#pragma mark NSPredicate evaluateWithObject
-(void)method010
{
    //指定単語かのチェック
    NSPredicate *aPredicate1 = [NSPredicate predicateWithFormat:@"SELF matches %@", @"[aaa|bbb]+"];
    NSString *string1 = @"aaa";
    NSLog(@" %s %@", __FUNCTION__,([aPredicate1 evaluateWithObject:string1])?@"YES":@"NO");
    
    //英数だけかどうかのチェック
    NSPredicate *aPredicate2 = [NSPredicate predicateWithFormat:@"SELF MATCHES '[a-zA-Z0-9]+'"];
    NSString *string2 = @"aaa";
    NSLog(@" %s %@", __FUNCTION__,([aPredicate2 evaluateWithObject:string2])?@"YES":@"NO");
    NSString *string3 = @"あ";
    NSLog(@" %s %@", __FUNCTION__,([aPredicate2 evaluateWithObject:string3])?@"YES":@"NO");

    
}

#pragma mark NSPredicate evaluateWithObject
-(void)method011
{
    NSString *string1 = @"bbb";
    
    //テンプレート作成
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"SELF matches  $string1"];
    
    //変数辞書作成
    NSDictionary *variables1 = [NSDictionary dictionaryWithObjectsAndKeys:@"bbb", @"minAge", @"aaa", @"string1", nil];
    NSDictionary *variables2 = [NSDictionary dictionaryWithObjectsAndKeys:@"bbb", @"minAge", @"bbb", @"string1", nil];
    
    //テンプレートを利用して条件式を作成
    NSPredicate *bPredicate = [aPredicate predicateWithSubstitutionVariables:variables1];
    NSPredicate *cPredicate = [aPredicate predicateWithSubstitutionVariables:variables2];
    
    //チェック用
    NSLog(@" %s %@", __FUNCTION__,([aPredicate evaluateWithObject:string1 substitutionVariables:variables1])?@"YES":@"NO");
    NSLog(@" %s %@", __FUNCTION__,([aPredicate evaluateWithObject:string1 substitutionVariables:variables2])?@"YES":@"NO");
    //デバッグ用
    NSLog(@" %s %@", __FUNCTION__,[bPredicate predicateFormat]);
    NSLog(@" %s %@", __FUNCTION__,[cPredicate predicateFormat]);
}

#pragma mark NSPredicate evaluateWithObject
-(void)method012
{
    NSPredicate *betweenPredicate =
    [NSPredicate predicateWithFormat: @"attributeName BETWEEN %@", [NSArray arrayWithObjects:    [NSNumber numberWithInteger:1],    [NSNumber numberWithInteger:10], nil]];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:5],@"attributeName", nil];
    BOOL between = [betweenPredicate evaluateWithObject:dictionary];
    if (between) {
        NSLog(@"%s between",__FUNCTION__);
    }
    
    
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
