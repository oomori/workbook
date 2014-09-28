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
        //CGPoint location = [touch locationInNode:self];
        
        //スプライトノード作成
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        
        SKSpriteNode *mask = [SKSpriteNode spriteNodeWithColor:[SKColor blackColor] size: CGSizeMake(100, 100)];
        //100✕100の四角形でクロップする
        //SKSpriteNode *mask = [SKSpriteNode spriteNodeWithImageNamed:@"CropImage"];
        //画像でクロップする場合
        SKCropNode *cropNode = [SKCropNode node];
        [cropNode addChild: sprite];
        [cropNode setMaskNode: mask];
        [self addChild: cropNode];
        cropNode.position = CGPointMake( CGRectGetMidX (self.frame), CGRectGetMidY (self.frame));
        
        
        //アクションの作成
        SKAction *action1 = [SKAction rotateByAngle:M_PI duration:1];

        SKAction *action2 = [SKAction moveToX:100.0f duration:1 ];
        
        //アクション実行
        SKAction *groupAction = [SKAction group:@[action1,action2]];
        
        [sprite runAction:groupAction];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
