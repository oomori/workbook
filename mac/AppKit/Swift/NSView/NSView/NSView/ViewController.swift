//
//  ViewController.swift
//  NSView
//
//  Created by air on 2015/03/01.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//  convert Swift 1.1 -> 2.0 2015/10/22

import Cocoa

class ViewController: NSViewController {

    //ウインドウを保持しておくための配列
    var windowArray : NSMutableArray = []
    
    //NSView
    var aButton001 : NSButton?
    var aView001 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction001(sender : AnyObject?){
        //準備
        //let aButton = aButton001
        let aView   = aView001
        //var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        aView?.lockFocus()
        let backgroundColor = NSColor.greenColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        aView?.unlockFocus()
        NSLog("!!! %@",aView!.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function001(sender: AnyObject) {
        windowArray.removeAllObjects()
        let aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "View アクション"//タイトル設定
        //ボタン
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 10.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction001:")
        theButton.target = self
        
        aWindow.contentView!.addSubview(theButton)
        //ビュー
        let theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 180.0))
                theView.wantsLayer = true
        aWindow.contentView!.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton001 = theButton    //ボタン
        self.aView001 = theView        //テストビュー
        
        //var viewDictionary:Dictionary<NSObject, NSObject> = ["view": theView,"button":theButton]
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSView initWithFrame:
    //UIパーツ受け渡し用
    var aButton002 : NSButton?
    var aView002 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction002(sender : AnyObject?){
        //準備
        //let aButton = aButton002
        let aView   = aView002
        //var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        aView?.lockFocus()
        let backgroundColor = NSColor.greenColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        aView?.unlockFocus()
        NSLog("!!! %@",aView!.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function002(sender: AnyObject) {
        //let aButton = aButton002
        //let aView   = aView002
        let aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "View アクション"//タイトル設定
        //ボタン
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 10.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction002:")
        theButton.target = self
        
        aWindow.contentView!.addSubview(theButton)
        //ビュー
        let theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 180.0))
                theView.wantsLayer = true
        //実験ウインドウにUIパーツを渡す
        self.aButton002 = theButton    //ボタン
        self.aView002 = theView        //テストビュー
        aWindow.contentView!.addSubview(theView)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSView prepareForReuse
    //UIパーツ受け渡し用
    var aButton003_1 : NSButton?
    var aButton003_2 : NSButton?
    var aView003 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction003_1(sender : AnyObject?){
        //準備
        //let aButton = aButton003
        let aView   = aView003
        //var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        aView?.hidden = true
        NSLog("!!! %@",aView!.description)
    }
    func viewAction003_2(sender : AnyObject?){
        //準備
        let aView   = aView003
        //準備ここまで
        
        aView?.prepareForReuse()
        aView?.display()
        NSLog("!!! %@",aView!.description)
    }
    @IBAction func function003(sender: AnyObject) {
        let aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "NSView Sample"//タイトル設定
        //ボタン1
        let theButton1 : NSButton = NSButton(frame: NSMakeRect(10.0, 0.0, 60.0, 30.0))
        theButton1.title = "Action"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("viewAction003_1:")
        theButton1.target = self
        //ボタン2
        let theButton2 : NSButton = NSButton(frame: NSMakeRect(120.0, 0.0, 60.0, 30.0))
        theButton2.title = "reset"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("viewAction003_2:")
        theButton2.target = self
        
        aWindow.contentView!.addSubview(theButton1)
        aWindow.contentView!.addSubview(theButton2)
        //ビュー
        let theView : TestView002 = TestView002(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView!.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton003_1 = theButton1    //ボタン
        self.aButton003_2 = theButton2    //ボタン
        self.aView003 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

    }
    //NSView
    @IBAction func function004(sender: AnyObject) {
    }
    //NSView
    @IBAction func function005(sender: AnyObject) {
    }
    //NSView
    @IBAction func function006(sender: AnyObject) {
    }
    //NSView
    @IBAction func function007(sender: AnyObject) {
    }
    //NSView
    @IBAction func function008(sender: AnyObject) {
    }
    //NSView
    @IBAction func function009(sender: AnyObject) {
    }
    //NSView
    @IBAction func function010(sender: AnyObject) {
    }



    
    override func viewWillDisappear(){
        super.viewWillDisappear()
        windowArray.removeAllObjects()
        NSLog("release")
        
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

