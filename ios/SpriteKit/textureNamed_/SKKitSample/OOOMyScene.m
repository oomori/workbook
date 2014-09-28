//
//  OOOMyScene.m
//  SKKitSample
//
//  Created by air on 2014/02/15.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

#import "OOOMyScene.h"

@implementation OOOMyScene
{
    SKSpriteNode *_plate;
    NSArray *_plateFrames;
}
//板が回転するアニメーション
-(void)rollPlate
{
    [_plate runAction:[SKAction repeatActionForever:
                      [SKAction animateWithTextures:_plateFrames
                                       timePerFrame:0.1f
                                             resize:NO
                                            restore:YES]] withKey:@"Plate"];
    return;
}
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
        
        
        NSMutableArray *plateFrames = [NSMutableArray array];
        SKTextureAtlas *plateAnimatedAtlas = [SKTextureAtlas atlasNamed:@"teppan"];
        
        NSUInteger numImages = plateAnimatedAtlas.textureNames.count;
        for (int i=0; i < numImages; i++) {
            NSString *textureName = [NSString stringWithFormat:@"%03d", i];
            SKTexture *temp = [plateAnimatedAtlas textureNamed:textureName];
            [plateFrames addObject:temp];
        }
        _plateFrames = plateFrames;
        
        SKTexture *temp = _plateFrames[0];
        _plate = [SKSpriteNode spriteNodeWithTexture:temp];
        _plate.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:_plate];
        
        self.physicsWorld.contactDelegate = self;

        [self rollPlate];
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
        CGPoint aPoint = CGPointMake(100.0f, 20.0f);
        SKAction *action = [SKAction moveTo:aPoint duration:1 ];
        
        CGSize aSize = CGSizeMake(100.0f, 100.0f);
        sprite.size = aSize ;
        SKPhysicsBody *pbody = [SKPhysicsBody bodyWithRectangleOfSize: aSize ];
        
        //スプライトの物理ボディをセット
        sprite.physicsBody = pbody ;
        //衝突検知のビットマスク
        pbody.contactTestBitMask = 1;

        //アクション実行
        [sprite runAction:action];
        //シーンにスプライトを追加
        [self addChild:sprite];
        
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


-(void)didBeginContact:(SKPhysicsContact *)contact
{
    if (contact.collisionImpulse < 1.0f) {
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
