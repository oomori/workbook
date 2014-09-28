//
//  OOOMyScene.m
//  SKKitSample
//
//  Created by air on 2014/02/15.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

#import "OOOMyScene.h"

@implementation OOOMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //シーンのバックグラウンドカラー設定
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        //ラベルノード作成
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        //ラベルノードの設定
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        //シーンにラベルノードを追加
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        //位置設定
        CGPoint location = [touch locationInNode:self];
        
        //スプライトノード作成
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        //スプライトの位置
        sprite.position = location;
        
        //アクションの作成
        CGMutablePathRef aPath = CGPathCreateMutable();
        CGPathMoveToPoint(aPath, NULL,0.0, 0.0);
        CGPathAddArcToPoint(aPath, NULL,
                            200.0,
                            200.0,
                            450.0,
                            0.0,
                            300.0);
        SKAction *action = [SKAction followPath:aPath duration:1];
        
        
        
        SKShapeNode *wheel = [[SKShapeNode alloc]init];
        UIBezierPath *path = [[UIBezierPath alloc] init];
        [path moveToPoint:CGPointMake(0.0, 0.0)];
        [path addArcWithCenter:CGPointMake(0.0, 0.0) radius:50.0 startAngle:0.0 endAngle:(M_PI*2.0) clockwise:YES];
        wheel.path = path.CGPath;
        wheel.fillColor = [SKColor whiteColor];
        wheel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        
        //アクション実行
        [wheel runAction:action];
        
        [self addChild:wheel];
        
        //シーンにスプライトを追加
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
