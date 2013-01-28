//
//  OOOError.m
//  NSError
//
//  Created by 大森 智史 on 2012/09/08.
//
//

#import "OOOError.h"

@implementation OOOError


- (NSString *)localizedDescription
{
    if ([self.domain isEqual:@"NSCocoaErrorDomain"]) {
        switch (self.code) {
            case 260:
                return @"そんなファイルは存在しない";
                break;
            case 3000:
                return @"アプリケーションの有効な“$1” エンタイトルメント文字列が見つかりません";
                break;
                
                
                
            default:
                break;
        }
    }
    
    NSLog(@"!!!");
    return @"";
    
}
@end
