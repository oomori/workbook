//
//  ViewController.swift
//  NSControl
//
//  Created by air on 2015/08/23.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var windowArray : NSMutableArray = []   //ウインドウ保持用
    
    //NSControl initWithFrame:
    //Swift1.2
    func buttonAction001(sender: AnyObject?){
        var theWindow : NSWindow = (sender as! NSButton).window!
        NSLog("!!!")
    }
    @IBAction func method001(sender: AnyObject) {
        var aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        //
        var theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction001:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        //.SwitchButton
        //.PushOnPushOffButton
        aWindow.contentView.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSControl enabled
    //Swift1.2
    func buttonAction002(sender: AnyObject?){
        var theWindow : NSWindow = (sender as! NSButton).window!
        if (sender as! NSButton).enabled == true
        {
            (sender as! NSButton).enabled = false
        }
    }
    @IBAction func method002(sender: AnyObject) {
        var aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        //
        var theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        //.SwitchButton
        //.PushOnPushOffButton
        aWindow.contentView.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSControl enabled
    //Swift1.2
    func buttonAction002(sender: AnyObject?){
        var theWindow : NSWindow = (sender as! NSButton).window!
        if (sender as! NSButton).enabled == true
        {
            (sender as! NSButton).enabled = false
        }
    }
    @IBAction func method003(sender: AnyObject) {
    }

    @IBAction func method004(sender: AnyObject) {
    }

    @IBAction func method005(sender: AnyObject) {
    }

    @IBAction func method006(sender: AnyObject) {
    }

    @IBAction func method007(sender: AnyObject) {
    }

    @IBAction func method008(sender: AnyObject) {
    }

    @IBAction func method009(sender: AnyObject) {
    }

    @IBAction func method010(sender: AnyObject) {
    }

    @IBAction func method011(sender: AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

