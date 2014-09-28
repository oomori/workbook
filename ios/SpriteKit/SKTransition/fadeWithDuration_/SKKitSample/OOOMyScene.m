//
//  OOOMyScene.m
//  SKKitSample
//
//  Created by air on 2014/02/15.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

#import "OOOMyScene.h"
#import "OOOScoreScene.h"

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
        CGPoint aPoint = CGPointMake(100.0f, 20.0f);
        SKAction *action = [SKAction moveTo:aPoint duration:1 ];
        
        //アクション実行
        [sprite runAction:action];
        //シーンにスプライトを追加
        [self addChild:sprite];
        
        
        // Create and configure the scene.
        SKView * skView = (SKView *)self.view;
        //skView.showsFPS = YES;
        //skView.showsNodeCount = YES;
        
        SKScene * scoreScene = [OOOScoreScene sceneWithSize:skView.bounds.size];
        scoreScene.scaleMode = SKSceneScaleModeAspectFill;
        
        //シーンの切り替え
        [skView presentScene:scoreScene transition:[SKTransition fadeWithDuration:1]];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
