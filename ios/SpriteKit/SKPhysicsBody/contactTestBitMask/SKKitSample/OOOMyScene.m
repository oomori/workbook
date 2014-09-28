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
        //衝突があったら呼び出される
        self.physicsWorld.contactDelegate = self;

        
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
        
        //スプライトノードの初期位置を設定
        sprite.position = location;
        
        //スプライトノードの
        CGSize aSize = CGSizeMake(100.0f, 100.0f);
        sprite.size = aSize ;
        SKPhysicsBody *pbody = [SKPhysicsBody bodyWithRectangleOfSize: aSize ];
        
        //スプライトの物理ボディをセット
        sprite.physicsBody = pbody ;
        //衝突検知のビットマスク
        pbody.contactTestBitMask = 1;
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

//衝突検知
-(void)didBeginContact:(SKPhysicsContact *)contact
{
    if (contact.collisionImpulse < 10.0f) {
        static SKEmitterNode* spark = nil;
        if (!spark) {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"FireParticle" ofType:@"sks"];
            spark = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
            spark.position = contact.contactPoint;
            spark.numParticlesToEmit = contact.collisionImpulse;
            [self addChild:spark];
        } else {
            spark.position = contact.contactPoint;
            spark.numParticlesToEmit = contact.collisionImpulse;
            [spark resetSimulation];
        }
    }
}

-(void)didEndContact:(SKPhysicsContact *)contact
{
    
}
@end
