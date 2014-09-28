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
        //パーティクルファイルのURL
        NSURL *particleURL = [[NSBundle mainBundle] URLForResource:@"FireParticle" withExtension:@"sks"];
        //パーティクルのデータを読み込み
        NSData *aData = [NSData dataWithContentsOfURL: particleURL ];
        //パーティクル作成
        SKEmitterNode *fireParticle = [NSKeyedUnarchiver unarchiveObjectWithData: aData ];
        fireParticle.position = location;
        fireParticle.numParticlesToEmit = 100;
        
        //シーンにパーティクルを追加
        [self addChild:fireParticle];
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
