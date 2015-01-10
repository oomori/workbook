//  NSApplicationのサブクラス
//  MyApplication.swift
//  NSApplication
//
//  Created by air on 2014/12/30.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

import AppKit
@objc(MyApplication)

class MyApplication: NSApplication {
    //finishLaunchingメソッドのオーバーライド
    override func finishLaunching(){
    super.finishLaunching()
    NSLog("finishLaunching")
    }

    override func replyToApplicationShouldTerminate(shouldTerminate: Bool) {
        
        NSLog("replyToApplicationShouldTerminate2")
        super.replyToApplicationShouldTerminate(shouldTerminate)
    }


}
