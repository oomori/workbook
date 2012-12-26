//
//  OOOAppDelegate.m
//  NSExpression
//
//  Created by 大森 智史 on 2012/08/12.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate
#pragma mark NSExpression  expressionForFunction:  (sum:)
-(void)method001
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"sum:"
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    id result;
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method001] result: 180, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (average:)
-(void)method002
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"average:"
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    [numberArray addObject:[NSNumber numberWithInteger:50]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:70]];
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method002] result: 60, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (count:)
-(void)method003
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"count:"
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    [numberArray addObject:[NSNumber numberWithInteger:50]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:70]];
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method003] result: 3, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (min:)
-(void)method004
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"min:"
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    [numberArray addObject:[NSNumber numberWithInteger:50]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:70]];
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method004] result: 50, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (max:)
-(void)method005
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"max:"
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    [numberArray addObject:[NSNumber numberWithInteger:50]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:70]];
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method005] result: 70, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (median:)
-(void)method006
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"median:"
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    [numberArray addObject:[NSNumber numberWithInteger:50]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:70]];
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method006] result: 60, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (mode:)
-(void)method007
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"mode:"
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    [numberArray addObject:[NSNumber numberWithInteger:50]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:70]];
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method006] result: 60, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (stddev:)
-(void)method008
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"stddev:"
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    [numberArray addObject:[NSNumber numberWithInteger:80]];
    [numberArray addObject:[NSNumber numberWithInteger:3]];
    //
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method008] result: 8.164965809277261, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (add:to:)
-(void)method009
{

    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:70]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:80]], nil];

    NSExpression* expression =
    [NSExpression expressionForFunction:@"add:to:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method009] result: 150, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (from:subtract:)
-(void)method010
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:70]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:80]], nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"from:subtract:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method010] result: -10, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (multiply:by:)
-(void)method011
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:70]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:80]], nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"multiply:by:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method011] result: 5600, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (divide:by:)
-(void)method012
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:160]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:80]], nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"divide:by:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method012] result: 2, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (modulus:by:)
//余り
-(void)method013
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:13]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:2]], nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"modulus:by:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method013] result: 1, __NSCFNumber
}
#pragma mark NSExpression  expressionForFunction: (sqrt:)
//平方根
-(void)method014
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:4]], nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"sqrt:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method014] result: 2, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (log:)
//対数
-(void)method015
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:4]], nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"log:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    // -[OOOAppDelegate method015] result: 0.6020599913279624, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (ln:)
//自然対数
-(void)method016
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:8]], nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"ln:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //
}

#pragma mark NSExpression  expressionForFunction: (raise:toPower:)
//
-(void)method017
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:8]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:2]],nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"raise:toPower:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method013] result: 1, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (exp:)
//
-(void)method018
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:8]], nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"exp:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //
}

#pragma mark NSExpression  expressionForFunction: (ceiling:)
//配列内の値を下回らない最小の整数値
-(void)method019
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithFloat:8.3]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithFloat:1.4]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithFloat:5.9]],
                              
                              nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"ceiling:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method019] result: 9, __NSCFNumber
}


#pragma mark NSExpression  expressionForFunction: (abs:)
//
-(void)method020
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:-8]],
                                 
                              nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"abs:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method020] result: 8, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (trunc:)
//小数点切り捨て
-(void)method021
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:3.14125]],
                              
                              nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"trunc:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method021] result: 3, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (random)
//ランダム
-(void)method022
{
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"random"
                              arguments:nil];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method022] result: 0.5161684113554657, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (floor:)
//切り捨て
-(void)method023
{
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithFloat:5.9]],
                              nil];
    NSExpression* expression =
    [NSExpression expressionForFunction:@"floor:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method022] result: 0.5161684113554657, __NSCFNumber
}

#pragma mark NSExpression  expressionForFunction: (uppercase:)
//すべてを大文字に
-(void)method024
{
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               @"String"],
                              nil];
    NSExpression* expression =
    [NSExpression expressionForFunction:@"uppercase:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method024] result: STRING, __NSCFString
}

#pragma mark NSExpression  expressionForFunction: (now)
//現在の時刻
-(void)method025
{
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"now"
                              arguments:nil];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method025] result: 2012-09-23 00:44:50 +0000, __NSDate
}

#pragma mark NSExpression  expressionForFunction: (lowercase:)
//すべてを小文字に
-(void)method026
{
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               @"String"],
                              nil];
    NSExpression* expression =
    [NSExpression expressionForFunction:@"lowercase:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method026] result: string, __NSCFString
}

#pragma mark NSExpression  expressionForFunction: (bitwiseAnd:with:)
//ビットのAND演算
-(void)method027
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b00000011]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b00000111]],nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"bitwiseAnd:with:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method027] result: 3, __NSCFNumber
    //3は 0b00000011
}


#pragma mark NSExpression  expressionForFunction: (random:)
//
-(void)method028
{
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInt:5]],
                              nil];
    NSExpression* expression =
    [NSExpression expressionForFunction:@"random:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method022] result: 0.5161684113554657, __NSCFNumber
}
#pragma mark NSExpression  expressionForFunction: (bitwiseOr:with:)
//ビットのOR演算
-(void)method029
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b00001011]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b00000111]],nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"bitwiseOr:with:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method029] result: 15, __NSCFNumber
    //15は 0b00001111
}
#pragma mark NSExpression  expressionForFunction: (bitwiseXor:with:)
//ビットのXOR演算
-(void)method030
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b00001011]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b00000111]],nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"bitwiseXor:with:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method030] result: 12, __NSCFNumber
    //12は 0b00001100
}

#pragma mark NSExpression  expressionForFunction: (leftshift:by:)
//ビット左シフト
-(void)method031
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b00000011]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:2]],nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"leftshift:by:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method031] result: 12, __NSCFNumber
    //12は 0b00001100
}

#pragma mark NSExpression  expressionForFunction: (rightshift:by:)
//ビット右シフト
-(void)method032
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b00001101]],
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:2]],nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"rightshift:by:"
                              arguments:quantityPrice];
    
    
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method032] result: 3, __NSCFNumber
    //3は 0b00000011
}

#pragma mark NSExpression  expressionForFunction: (onesComplement:)
//補数表現
-(void)method033
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b101]],nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"onesComplement:"
                              arguments:quantityPrice];
    
    NSLog(@"%ld",sizeof(NSInteger));
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method032] result: 3, __NSCFNumber
    //5は 0b101
    //-6は0b1111
}

#pragma mark NSExpression  expressionForFunction: (noindex:)
//
-(void)method034
{
    
    NSArray *quantityPrice = [NSArray arrayWithObjects:
                              [NSExpression expressionForConstantValue:
                               [NSNumber numberWithInteger:0b101]],nil];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"noindex:"
                              arguments:quantityPrice];
    
    NSLog(@"%ld",sizeof(NSInteger));
    id result;
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method032] result: 3, __NSCFNumber
    //5は 0b101
}

#pragma mark NSExpression  expressionForFunction:  (sum:)
-(void)method035
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForFunction:@"sum:"
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    id result;
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    NSLog(@"%s result: %@", __FUNCTION__, [expression arguments]);
    //-[OOOAppDelegate method035] result: ("{60, 60, 60}")
    
    NSLog(@"%s result: %@", __FUNCTION__, [expression function]);
    //-[OOOAppDelegate method035] result: sum:
    
    

    NSLog(@"%s result: %u", __FUNCTION__, [expression expressionType]);
    
    switch ([expression expressionType]) {
        case NSConstantValueExpressionType:
            NSLog(@"NSConstantValueExpressionType");
            break;
        case NSEvaluatedObjectExpressionType:
            NSLog(@"NSEvaluatedObjectExpressionType");
            break;
        case NSVariableExpressionType:
            NSLog(@"NSVariableExpressionType");
            break;
        case NSKeyPathExpressionType:
            NSLog(@"NSKeyPathExpressionType");
            break;
        case NSFunctionExpressionType:
            NSLog(@"NSFunctionExpressionType");
            break;
        case NSUnionSetExpressionType:
            NSLog(@"NSUnionSetExpressionType");
            break;
        case NSIntersectSetExpressionType:
            NSLog(@"NSIntersectSetExpressionType");
            break;
        case NSMinusSetExpressionType:
            NSLog(@"NSMinusSetExpressionType");
            break;
        case NSAggregateExpressionType:
            NSLog(@"NSAggregateExpressionType");
            break;
        case NSBlockExpressionType:
            NSLog(@"NSBlockExpressionType");
            break;
        default:
            break;
    }

    //NSLog(@"%s result: %@", __FUNCTION__, [expression operand]);
    //
    
    //NSLog(@"%s result: %@", __FUNCTION__, [expression variable]);
    //

    //NSExpression *resultExpression = [expression operand];
    //NSLog(@"%s result: %@", __FUNCTION__, [resultExpression constantValue]);
    //
}

#pragma mark NSExpression  expressionForBlock:  ()
//作成中
-(void)method036
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    
    [NSExpression expressionForBlock:^id(id evaluatedObject, NSArray *expressions, NSMutableDictionary *context){
            NSLog(@"%s result: %@, %@", __FUNCTION__, expressions,[evaluatedObject class]);
            return evaluatedObject;}
                              arguments:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    id result;
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method001] result: 180, __NSCFNumber
}

#pragma mark NSExpression  expressionForAggregate:

-(void)method037
{
    NSMutableArray *numberArray = [NSMutableArray array];
    
    NSExpression* expression =
    [NSExpression expressionForAggregate:
     [NSArray arrayWithObject:
      [NSExpression expressionForConstantValue:numberArray]]];
    
    id result;
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    [numberArray addObject:[NSNumber numberWithInteger:60]];
    
    result= [expression expressionValueWithObject:nil
                                          context:nil];
    
    NSLog(@"%s result: %@, %@", __FUNCTION__, result,[result class]);
    //-[OOOAppDelegate method037] result: ((60,60,60)), __NSArrayM
    
    NSLog(@"%s result: %@", __FUNCTION__, [expression collection]);
    // -[OOOAppDelegate method037] result: ("{60, 60, 60}")

    
}

#pragma mark NSExpression  expressionForAggregate:
-(void)method038
{


}

#pragma mark NSExpression  expressionForFunction: (random:)
//
-(void)method099
{
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"abs(hg-%f)<0.000001",[@"123.45" floatValue]];
    
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
    [self method014];
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
    
    //[self method028];
    
    [self method029];
    [self method030];
    [self method031];
    [self method032];
    
    [self method033];
    [self method034];
    
    [self method035];
    [self method036];
    [self method037];
    [self method038];
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
