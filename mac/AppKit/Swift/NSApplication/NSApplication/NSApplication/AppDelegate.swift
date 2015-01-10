//
//  AppDelegate.swift
//  NSApplication
//
//  Created by air on 2014/12/30.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var discardCheckBox: NSButton!
    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var newWindow: NSWindow!
    //NSApplication.sharedApplication()
    func function001()  {
        
        let anApplication = NSApplication.sharedApplication()
        
        NSLog("Shared Application Object: \(anApplication).")
        
    }
    //NSApplication delegate
    func function002()  {
        
        let anApplication = NSApplication.sharedApplication()
        let obj = anApplication.delegate
        NSLog("Delegate Object: \(obj).")
        
    }

    
    //NSApplication applicationIconImage
    @IBOutlet weak var imageView: NSImageView!
    @IBAction func function003(sender: AnyObject) {
        NSLog("function003 called")
        let anApplication = NSApplication.sharedApplication()
        var imageObj:NSImage = anApplication.applicationIconImage
        NSLog("Image Object: \(imageObj).")
        imageView.image = imageObj
        
    }
    
    //NSApplication terminate:
    //ボタンを押す
    @IBAction func function004(sender: AnyObject) {
        NSLog("function004 called")
        NSLog("I will terminate after 5 minutes")
        //タイマー作成
        var timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("update:"), userInfo: nil, repeats: false)

    }
    //タイマーが起動した時の実行メソッド
    func update(timer:NSTimer!) {
        NSLog("good bye")//ここは実行される
        let anApplication = NSApplication.sharedApplication()
        //アプリケーション終了
        anApplication.terminate(self)
        NSLog("end")//ここは実行されない
        
        //anApplication.replyToApplicationShouldTerminate(true )
    }
    
    //NSApplication currentEvent
    @IBAction func function005(sender: AnyObject) {
        NSLog("function005 called")
        let anApplication = NSApplication.sharedApplication()
        var event:NSEvent = anApplication.currentEvent!
        var type:NSEventType = event.type
        switch type {
        case .LeftMouseDown :       //NSEventType.LeftMouseDownでも良い
            NSLog("LeftMouseDown")
            break
        case NSEventType.LeftMouseUp :  //.LeftMouseUpだけでも良い
            NSLog("LeftMouseUp")
        default :
            break
        }
    }
    
    //NSApplication discardEventsMatchingMask
    @IBAction func function006(sender: AnyObject) {
        NSLog("function006 called")
        let anApplication = MyApplication.sharedApplication()
        var event:NSEvent = anApplication.currentEvent!

        let maskUp = NSEventMask.LeftMouseUpMask.rawValue
        let maskDragged = NSEventMask.LeftMouseDraggedMask.rawValue
        let mask = Int( maskUp | maskDragged ) // cast from UInt
        //var theEvent:NSEvent? = nil;
        NSLog("1 %@",event)
        anApplication.discardEventsMatchingMask(mask,beforeEvent: event)
        var newEvent:NSEvent = anApplication.currentEvent!
        NSLog("2 %@",newEvent)
        var type:NSEventType = newEvent.type
        switch type {
        case .LeftMouseDragged :       //NSEventType.LeftMouseDownでも良い
            NSLog("LeftMouseDragged")
            break
        case NSEventType.LeftMouseUp :  //.LeftMouseUpだけでも良い
            NSLog("LeftMouseUp")
        default :
            break
        }
        
    }
    
    
    //NSApplication running
    @IBAction func function007(sender: AnyObject) {
        
        let anApplication = MyApplication.sharedApplication()
        if anApplication.running {
            NSLog("YES")
        }else{
            NSLog("NO")
        }
    }
    //Modal windowの表示
    //リターンコードの設定
    private let RETURN_NO  :Int = 0 // モーダルの戻り判定 NO
    private let RETURN_YES :Int = 1 // モーダルの戻り判定 YES

    //NSApplication runModalForWindow
    @IBAction func function008(sender: AnyObject) {
        //newWindowはNIBで作られているwindow
        //@IBOutlet weak var newWindow: NSWindow!
        let anApplication = MyApplication.sharedApplication()
        var result = anApplication.runModalForWindow(newWindow)
        
        //モーダルが閉じられた場合の結果が帰ってくる
        
        switch result {
        case RETURN_NO :
            NSLog("NO")
            break
        case RETURN_YES :
            NSLog("YES")
        default :
            break
        }
        
    }
    //NSApplication stopModal
    @IBAction func function009(sender: AnyObject) {
        NSLog("%@",newWindow)
        let anApplication = MyApplication.sharedApplication()
        anApplication.stopModal()
        newWindow.orderOut(self)
    }
    //NSApplication stopModalWithCode:
    //モーダルを終了する。コードは任意の整数。押されたボタンを判定するときなどに使う
    @IBAction func function010(sender: AnyObject) {
        NSLog("stopModalWithCode")
        let anApplication = MyApplication.sharedApplication()
        anApplication.stopModalWithCode(RETURN_YES)
        newWindow.orderOut(self)
    }
    
    //NSApplication abortModal
    //時間が来たらモーダルを停止する
    func abortTimer(timer:NSTimer!) {
        NSLog("abort modal")
        let anApplication = NSApplication.sharedApplication()
        //modal
        anApplication.abortModal()
    }
    
    @IBAction func function011(sender: AnyObject) {
        NSLog("abortModal")
        let anApplication = MyApplication.sharedApplication()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("abortTimer:"), userInfo: nil, repeats: false)

        //タイマー、モーダルに入るとタイマーが動かなくなるので、ランループに追加する
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)

        //モーダル開始
        var result:NSModalResponse = anApplication.runModalForWindow(newWindow)
        
        //モーダルが閉じられた場合の結果が帰ってくる
        switch result {
        case -1000 :    //NSModalResponseStop
            NSLog("NSModalResponseStop")
            break
        case -1001 :    //NSModalResponseAbort
            NSLog("NSModalResponseAbort")
        case -1002 :
            NSLog("NSModalResponseContinue")
        default :
            break
        }
        //帰ってきたらウインドウ閉じる
        newWindow.orderOut(self)
    }
    
    //NSApplication orderFrontColorPanel
    @IBAction func function012(sender: AnyObject) {
        NSLog("orderFrontColorPanel")
        let anApplication = MyApplication.sharedApplication()
        anApplication.orderFrontColorPanel(self)
    }
    //NSApplication orderFrontStandardAboutPanel
    @IBAction func function013(sender: AnyObject) {
        NSLog("orderFrontStandardAboutPanel")
        let anApplication = MyApplication.sharedApplication()
        anApplication.orderFrontStandardAboutPanel(self)
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSLog("applicationDidFinishLaunching")
        function001()
        function002()
    }
    func applicationWillFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSLog("applicationWillFinishLaunching")
        
    }
    func applicationShouldTerminate(sender: NSApplication!) -> NSApplicationTerminateReply {
        NSLog("applicationShouldTerminate")
        
        //return .TerminateCancel //アプリケーション終了をキャンセル
        //return .TerminateLater      //あとで
        return .TerminateNow    //アプリケーション終了する
        
    }

    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        NSLog("applicationWillTerminate")
        
    }


}


