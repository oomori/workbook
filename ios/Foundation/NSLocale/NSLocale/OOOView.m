//
//  OOOView.m
//  NSLocale
//
//  Created by 大森 智史 on 2012/08/17.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOView.h"

@implementation OOOView
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    
    //
    NSLog(@"currentLocale--%@",[aLocale localeIdentifier]);
    
    //こちらは環境設定を変えたら自動的に反映される
    NSLog(@"autoupdatingCurrentLocale--%@",[bLocale localeIdentifier]);
    NSLog(@"systemLocale--%@",[aLocale objectForKey:@"NSLocaleCountryCode"]);
    NSString *displayNameString = [bLocale displayNameForKey:NSLocaleIdentifier value:@"ja_JP"];
    NSLog(@"current--%@",displayNameString);
    
    //
}
-(void)awakeFromNib
{
    aLocale = [NSLocale currentLocale];
    bLocale = [NSLocale autoupdatingCurrentLocale];
    cLocale = [NSLocale systemLocale];
    
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
