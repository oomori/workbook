//
//  ViewController.swift
//  NSWindow051
//
//  Created by air on 2015/03/18.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController , NSWindowDelegate,NSTableViewDelegate,NSTableViewDataSource {

    var windowArray : NSMutableArray = []
    var dataArray : NSMutableArray = []
    //NSWindow  frame
    @IBAction func function051(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
                            Float(theWindow.frame.origin.y),
                            Float(theWindow.frame.size.width),
                            Float(theWindow.frame.size.height))
    }
    //NSWindow setFrameOrigin
    func buttonAction052(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as NSButton).window!
        NSLog("!!")
        theWindow.setFrameOrigin(NSMakePoint(100.0, 200.0))
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
            Float(theWindow.frame.origin.y),
            Float(theWindow.frame.size.width),
            Float(theWindow.frame.size.height))
        
    }
    @IBAction func function052(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
                            styleMask:  NSTitledWindowMask |
                                        NSClosableWindowMask |
                                        NSMiniaturizableWindowMask |
                                        NSResizableWindowMask,
                            backing:    .Buffered,
                            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction052:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow setFrameTopLeftPoint()
    func buttonAction053(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as NSButton).window!
        NSLog("!!")
        theWindow.setFrameTopLeftPoint(NSMakePoint(100.0, 200.0))
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
            Float(theWindow.frame.origin.y),
            Float(theWindow.frame.size.width),
            Float(theWindow.frame.size.height))
        
    }
    @IBAction func function053(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction053:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow constrainFrameRect:toScreen:
    //サブクラスでオーバーライド
    @IBAction func function054(sender: AnyObject) {
        var theWindow : MyWindow = MyWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
            Float(theWindow.frame.origin.y),
            Float(theWindow.frame.size.width),
            Float(theWindow.frame.size.height))
        
    }
    //NSWindow cascadeTopLeftFromPoint()
    @IBAction func function055(sender: AnyObject) {
        var theWindow1 : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        var theWindow2 : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow2) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        theWindow1.center()//ウインドウをスクリーンの中心に
        theWindow1.title = "ウインドウ1"//タイトル設定
        theWindow1.orderFront(self)//前面に
        theWindow1.makeKeyAndOrderFront(self)//表示
        
        //theWindow2.setFrameTopLeftPoint(theWindow1.cascadeTopLeftFromPoint(NSZeroPoint))
        //->theWindow1の位置は動かさない
        theWindow2.setFrameTopLeftPoint(theWindow1.cascadeTopLeftFromPoint(NSMakePoint(0.0, 200.0)))
        //->theWindow1の左上位置を(0.0,200.0)に動かして、その後次のウインドウの位置を計算して返す
        theWindow2.title = "ウインドウ2"//タイトル設定
        theWindow2.orderFront(self)//前面に
        theWindow2.makeKeyAndOrderFront(self)//表示
        
    }
    //NSWindow setFrame:display:
    func buttonAction056(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as NSButton).window!
        
        theWindow.setFrame(NSMakeRect(100.0, 100.0, 500.0, 300.0), display: true)
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
            Float(theWindow.frame.origin.y),
            Float(theWindow.frame.size.width),
            Float(theWindow.frame.size.height))
        
    }
    @IBAction func function056(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction056:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow setFrame:animate:
    //NSWindow animationResizeTime:
    func buttonAction057(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as NSButton).window!
        var animeTime : NSTimeInterval = theWindow.animationResizeTime(NSMakeRect(100.0, 100.0, 500.0, 300.0))
        NSLog("animeTime = %.2f sec",animeTime)
        theWindow.setFrame(NSMakeRect(100.0, 100.0, 500.0, 300.0), display: true ,animate: true)
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
            Float(theWindow.frame.origin.y),
            Float(theWindow.frame.size.width),
            Float(theWindow.frame.size.height))
    }
    @IBAction func function057(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction057:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow aspectRatio
    func buttonAction058(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as NSButton).window!
        theWindow.aspectRatio = NSMakeSize(1.78,1.0)//(16:9)
    
    }
    @IBAction func function058(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction058:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow　minSize
    func buttonAction059(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as NSButton).window!
        //ウインドウの最小サイズを(400.0,300.0)にする
        theWindow.minSize = NSMakeSize(400.0,300.0)
    }
    @IBAction func function059(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction059:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow maxSize
    func buttonAction060(sender: AnyObject){
        var theWindow : NSWindow = (sender as NSButton).window!
        //ウインドウの最大サイズを(400.0,300.0)にする
        theWindow.maxSize = NSMakeSize(400.0,300.0)
    }
    @IBAction func function060(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction060:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow performZoom()
    func buttonAction061(sender: AnyObject){
        var theWindow : NSWindow = (sender as NSButton).window!
        theWindow.performZoom(self)
    }
    @IBAction func function061(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Zoom"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction061:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow zoom()
    func buttonAction062(sender: AnyObject){
        var theWindow : NSWindow = (sender as NSButton).window!
        theWindow.zoom(self)
    }
    @IBAction func function062(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Zoom"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction062:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow
    func buttonAction063(sender: AnyObject){
        var theWindow : NSWindow = (sender as NSButton).window!
        theWindow.zoom(self)
    }
    @IBAction func function063(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Zoom"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction063:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.delegate = self
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    //NSWindow showsResizeIndicator
    func buttonAction064(sender: AnyObject){
        var theWindow : NSWindow = (sender as NSButton).window!
        if (theWindow.showsResizeIndicator) {
            theWindow.showsResizeIndicator = false
        }else{
           theWindow.showsResizeIndicator = true
        }
    }
    @IBAction func function064(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction064:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow resizeIncrements
    func buttonAction065(sender: AnyObject){
        var theWindow : NSWindow = (sender as NSButton).window!
        if (theWindow.resizeIncrements.width > 1.0) {
            theWindow.resizeIncrements = NSMakeSize(1.3, 1.0)
        }else{
            theWindow.resizeIncrements = NSMakeSize(20.0, 20.0)
        }
    }
    @IBAction func function065(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction065:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow　テーブルのあるビュー
    func buttonAction066(sender: AnyObject){
        var theWindow : NSWindow = (sender as NSButton).window!
    }
    @IBAction func function066(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction066:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //テーブルビューを作成
        //まずはスクロールビュー
        var scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //中身のテーブルビュー
        var theTableView : NSTableView = NSTableView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //列
        var tableColumn1 : NSTableColumn = NSTableColumn(identifier: "col1")
        var tableColumn2 : NSTableColumn = NSTableColumn(identifier: "col2")
        tableColumn1.width = 170
        tableColumn2.width = 130
        //列をテーブルにセット
        theTableView.addTableColumn(tableColumn1)
        theTableView.addTableColumn(tableColumn2)
        //データソースとデリゲートをセット
        var dataObj : TableData066 = TableData066()
        dataArray.addObject(dataObj)
        
        theTableView.setDataSource(dataObj )
        theTableView.setDelegate(dataObj )
        theTableView.reloadData()
        
        scrollView.documentView = theTableView
        scrollView.hasVerticalRuler = true
        aWindow.contentView.addSubview(scrollView)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow
    //http://www.knowstack.com/swift-nstableview-sample-code/


    @IBAction func function067(sender: AnyObject) {
        
    }
    //NSWindow
    @IBAction func function068(sender: AnyObject) {
        
    }
    //NSWindow
    @IBAction func function069(sender: AnyObject) {
        
    }
    //NSWindow
    @IBAction func function070(sender: AnyObject) {
        
    }
    //NSWindow
    @IBAction func function071(sender: AnyObject) {
        
    }
    //NSWindow
    @IBAction func function072(sender: AnyObject) {
        
    }
    //NSWindow
    @IBAction func function073(sender: AnyObject) {
        
    }

    //NSWindow　resizeFlags
    func windowWillResize(sender: NSWindow, toSize frameSize: NSSize) -> NSSize {
        NSLog("%u",sender.resizeFlags)

        if ((sender.resizeFlags & 0b000001)>0){
            NSLog("Controll")
        }
        if (((sender.resizeFlags & 0b000010) >> 1)>0){
            NSLog("Left Shift")
        }
        if (((sender.resizeFlags & 0b000100) >> 2)>0){
            NSLog("Right Shift")
        }
        if (((sender.resizeFlags & 0b001000) >> 3)>0){
            NSLog("Left Command")
        }
        if (((sender.resizeFlags & 0b010000) >> 4)>0){
            NSLog("Right Command")
        }
        if (((sender.resizeFlags & 0b100000) >> 5)>0){
            NSLog("Option")
        }
        if (((sender.resizeFlags & 0b00001000000) >> 6)>0){
            NSLog("7")
        }
        if (((sender.resizeFlags & 0b00010000000) >> 7)>0){
            NSLog("8")
        }
        if (((sender.resizeFlags & 0b00100000000) >> 8)>0){
            NSLog("capslock")
        }
        if (((sender.resizeFlags & 0b01000000000) >> 9)>0){
            NSLog("10")
        }
        if (((sender.resizeFlags & 0b10000000000) >> 10)>0){
            NSLog("11")
        }
        if (((sender.resizeFlags & 0b0000100000000000) >> 11)>0){
            NSLog("12")
        }
        if (((sender.resizeFlags & 0b0001000000000000) >> 12)>0){
            NSLog("13")
        }
        if (((sender.resizeFlags & 0b0010000000000000) >> 13)>0){
            NSLog("14")
        }
        if (((sender.resizeFlags & 0b0100000000000000) >> 14)>0){
            NSLog("15")
        }
        if (((sender.resizeFlags & 0b1000000000000000) >> 15)>0){
            NSLog("16")
        }
        if (((sender.resizeFlags & 0b00010000000000000000) >> 16)>0){
            NSLog("17")
        }
        

        return frameSize
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

