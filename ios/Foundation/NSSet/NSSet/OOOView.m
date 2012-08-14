//
//  OOOView.m
//  NSSet
//
//  Created by 大森 智史 on 2012/08/04.
//
//

#import "OOOView.h"

@implementation OOOView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"OOOView !!touchesBegan");
    
    [self.nextResponder touchesBegan:touches withEvent:event];
    
    //どの指かタッチしたら
    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {
         //NSLog([shapePath containsPoint:CGPointMake([obj locationInView:self].x,[obj locationInView:self].y)]?@"YES":@"NO");
         
         
         
     }];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"OOOView !!touchesMoved");
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
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
