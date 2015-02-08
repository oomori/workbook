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
    //preventWindowOrderingメソッドのオーバーライド
    override func preventWindowOrdering() {
        super.preventWindowOrdering()
        NSLog("preventWindowOrdering")
    }
    //arrangeInFront
    override func arrangeInFront(sender: AnyObject?) {
        super.arrangeInFront(sender)
        NSLog("arrangeInFront")
    }
    
    //updateWindowsItem
    override func updateWindowsItem(win: NSWindow) {
        super.updateWindowsItem(win )
        //メニューアイテムの更新のログを取るとき
        //NSLog("updateWindowsItem")
    }
    
    override func replyToOpenOrPrint(reply: NSApplicationDelegateReply) {
        NSLog("replyToOpenOrPrint")
    }
    
    //サービスメニューを開こうとしたら呼び出される
    //どのタイプを受けるか
    /*
    override func validRequestorForSendType(sendType: String, returnType: String) -> AnyObject? {
        NSLog("validRequestorForSendType !!!")
        var retArray = ["NSPDFPboardType","NSPICTPboardType","NSPostScriptPboardType","NSTIFFPboardType"]
        super.validRequestorForSendType(sendType, returnType: returnType)
        return nil
    }
*/
    override func replyToApplicationShouldTerminate(shouldTerminate: Bool) {
        
        NSLog("replyToApplicationShouldTerminate2")
        super.replyToApplicationShouldTerminate(shouldTerminate)
    }


}
