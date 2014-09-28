//
//  OOOMyScene.m
//  SKKitSample
//
//  Created by air on 2014/02/15.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

#import "OOOMyScene.h"

@implementation OOOMyScene

- (CIFilter *)blurFilter
{
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"]; // 3
    [filter setDefaults];
    [filter setValue:[NSNumber numberWithFloat:10] forKey:@"inputRadius"];
    return filter;
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
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {

        SKEffectNode *lightingNode = [[SKEffectNode alloc] init];
        SKTexture *texture = [SKTexture textureWithImage:[UIImage imageNamed:@"Spaceship"]];
        SKSpriteNode *light = [SKSpriteNode spriteNodeWithTexture:texture];
        self.filter = [self blurFilter];
        lightingNode.position = self.view.center;
        //lightingNode.blendMode = SKBlendModeAdd;
        [lightingNode addChild: light];
        //[self addChild:lightingNode];
        
        //位置設定
        //CGPoint location = [touch locationInNode:self];
        
        //スプライトノード作成
        //SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        //[myEffectNode addChild:sprite];
        //スプライトの位置
        //sprite.position = location;
        
        //アクションの作成
        CGVector aVector = CGVectorMake(0.0f, 50.0f);
        SKAction *action = [SKAction moveBy:aVector duration:1 ];

        //アクション実行
        [lightingNode runAction:[SKAction repeatActionForever:action]];
        //シーンにスプライトを追加
        [self addChild:lightingNode];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
