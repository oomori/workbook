//
//  AppDelegate.swift
//  NSApplication
//
//  Created by air on 2014/12/30.
//  Copyright (c) 2014年 oomori. All rights reserved.
//
//Swift2.0
import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

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
        let imageObj:NSImage = anApplication.applicationIconImage
        NSLog("Image Object: \(imageObj).")
        imageView.image = imageObj
        
    }
    
    //NSApplication terminate:
    //ボタンを押す
    @IBAction func function004(sender: AnyObject) {
        NSLog("function004 called")
        NSLog("I will terminate after 5 minutes")
        //タイマー作成
        //var timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("update"), userInfo: nil, repeats: false)

    }
    //タイマーが起動した時の実行メソッド
    func update() {
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
        let event:NSEvent = anApplication.currentEvent!
        let type:NSEventType = event.type
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
    func applicationShouldTerminate(sender: NSApplication) -> NSApplicationTerminateReply {
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


