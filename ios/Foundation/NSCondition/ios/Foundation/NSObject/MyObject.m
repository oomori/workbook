//
//  MyObject.m
//  NSObject
//
//  Created by 大森 智史 on 2012/09/01.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "MyObject.h"
#import "OOOProxy.h"
#import "MyObject2.h"
#import <objc/runtime.h>

@implementation MyObject


- (id)initWithCoder:(NSCoder *)decoder
{
    NSLog(@"%s initWithCoder",__FUNCTION__);
    self = [super init];
    if(self)
    {
        
        string = [decoder decodeObjectForKey:@"stringKey"];
        
    }
    return  self;
}

//エンコードする
- (void)encodeWithCoder:(NSCoder *)encoder
{
    NSLog(@"%s encodeWithCoder",__FUNCTION__);

    [encoder encodeObject:string forKey:@"stringKey"];
    [(NSKeyedArchiver *)encoder finishEncoding];


}
-(NSString*)description{
    NSLog(@"%s description",__FUNCTION__);
    return [NSString stringWithFormat:@"%@ :%p ,%@>",[self class],self,string];
}

- (id)copyWithZone:(NSZone *)zone
{
    MyObject* result = [[[self class] allocWithZone:zone] init];
    
    if (result)
    {
        
        //result->stringValue = [stringValue copyWithZone:zone];
        //result->arrayValues = [[NSArray allocWithZone:zone] initWithArray:arrayValues copyItems:YES];
    }
    
    return result;
}
-(void)messageWith:(NSString *)message
{
    NSLog(@"%s %@",__FUNCTION__,message);
    
}
-(void)messageA
{
    NSLog(@"%s messageA",__FUNCTION__);
    
}
-(void)messageB
{
    NSLog(@"%s messageB",__FUNCTION__);
    
}

-(void)testMethod
{
    NSLog(@"%s testMethod",__FUNCTION__);    
    
}
+(void)initialize
{    
    NSLog(@"%s initialize",__FUNCTION__);
  
}

+(void)load
{
    NSLog(@"%s load",__FUNCTION__);
}

- (BOOL)beginContentAccess
{
    NSLog(@"%s",__FUNCTION__);
    return YES;
}
- (void)endContentAccess
{
    NSLog(@"%s",__FUNCTION__);
}
- (void)discardContentIfPossible
{
    NSLog(@"%s",__FUNCTION__);
    
}
- (BOOL)isContentDiscarded
{
    NSLog(@"%s",__FUNCTION__);
    return NO;
}
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"%s",__FUNCTION__);
    if (aSelector == @selector(messageWith)) {
        
        MyObject2 *obj2 = [[MyObject2 alloc] init];
        return obj2;
    }else{
        return self;
    }
    //return [super forwardingTargetForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"%s",__FUNCTION__);
    if ([self respondsToSelector: [anInvocation selector]]){
        //[anInvocation invokeWithTarget:someOtherObject];
    }else{
        [super forwardInvocation:anInvocation];
    }
}
void dynamicMethodIMP(id self, SEL _cmd)

{
    
    // implementation ....
    printf("dynamicMethodIMP");
    
}
void dynamicClassMethodIMP(id self, SEL _cmd)

{
    
    // implementation ....
    printf("dynamicClassMethodIMP");
    
}
+ (BOOL) resolveInstanceMethod:(SEL)aSEL

{
    
    if (aSEL == @selector(resolveThisMethodDynamically))
        
    {
        
        class_addMethod([self class], aSEL, (IMP) dynamicMethodIMP, "v@:");
        
        return YES;
        
    }
    
    return [super resolveInstanceMethod:aSEL];
    
}
+ (BOOL)resolveClassMethod:(SEL)sel
{
    if (sel == @selector(dynamicClassMethodIMP))
        
    {
        
        class_addMethod([self class], sel, (IMP) dynamicMethodIMP, "v@:");
        
        return YES;
        
    }
    
    return [super resolveInstanceMethod:sel];
    
}
- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    NSLog(@"%s ",__FUNCTION__);
    
    return self;
}
- (Class)classForCoder
{
    NSLog(@"%s %@",__FUNCTION__,[self class]);
    return [self class];
}




+ (Class)classForKeyedUnarchiver
{
    NSLog(@"%s ",__FUNCTION__);
    return [self class];
    
}



//アーカイブの時に呼ばれる
- (id)replacementObjectForKeyedArchiver:(NSKeyedArchiver *)archiver
{
    NSLog(@"%s ",__FUNCTION__);
    return self;
}
//アーカイブの時にreplacementObjectForKeyedArchiver:の後に呼ばれる
- (Class)classForKeyedArchiver
{
    NSLog(@"%s %@",__FUNCTION__,[self class]);
    return [self class];
}

//アーカイブの時classForKeyedArchiverの後に呼ばれる
+ (NSArray *)classFallbacksForKeyedArchiver
{
    NSLog(@"%s ",__FUNCTION__);
    NSArray *retArray = [NSArray arrayWithObjects:[self class],[NSString class], nil];
    return retArray;
}

- (id)archiver:(NSKeyedArchiver *)archiver willEncodeObject:(id)object
{
    NSLog(@"%s ",__FUNCTION__);
    return self;
}
- (void)archiver:(NSKeyedArchiver *)archiver willReplaceObject:(id)object withObject:(id)newObject
{
    NSLog(@"%s ",__FUNCTION__);
    
}
@end
