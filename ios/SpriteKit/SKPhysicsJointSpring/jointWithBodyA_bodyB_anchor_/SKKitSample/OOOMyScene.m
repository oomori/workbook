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
        
        //物理枠を設定
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:(CGRect){CGPointZero, size}];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        //位置設定
        CGPoint locationA = [touch locationInNode:self];
        CGPoint locationB = CGPointMake(locationA.x+50.0, locationA.y+0.0);
        //スプライトノード作成
        SKSpriteNode *spriteA = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        SKSpriteNode *spriteB = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        //スプライトノードの初期位置を設定
        spriteA.position = locationA;
        spriteB.position = locationB;
        
        //スプライトノードの
        CGSize aSize = CGSizeMake(100.0f, 100.0f);
        spriteA.size = aSize ;
        spriteB.size = aSize ;
        SKPhysicsBody *aBody = [SKPhysicsBody bodyWithRectangleOfSize: aSize ];
        SKPhysicsBody *bBody = [SKPhysicsBody bodyWithRectangleOfSize: aSize ];
        //スプライトの物理ボディをセット
        spriteA.physicsBody = aBody ;
        spriteB.physicsBody = bBody ;
        
        [self addChild:spriteA];
        [self addChild:spriteB];
        
        CGPoint anchor = CGPointMake(100, 100);
        SKPhysicsJointSpring *springJoint = [SKPhysicsJointSpring jointWithBodyA:aBody
                                                                           bodyB:bBody
                                                                         anchorA:CGPointMake(50, 50) anchorB:anchor];
        
        [self.scene.physicsWorld addJoint:springJoint];
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
