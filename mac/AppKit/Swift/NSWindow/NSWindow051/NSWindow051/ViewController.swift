//
//  ViewController.swift
//  NSWindow051
//
//  Created by air on 2015/03/18.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController , NSWindowDelegate,NSTableViewDelegate,NSTableViewDataSource,NSToolbarDelegate {

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
        
        var theWindow : NSWindow = (sender as! NSButton).window!
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
    //Swift1.2
    func buttonAction053(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
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
    //Swift1.2
    func buttonAction056(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
        
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
    //Swift1.2
    func buttonAction057(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
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
    //Swift1.2
    func buttonAction058(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
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
        
        var theWindow : NSWindow = (sender as! NSButton).window!
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
        var theWindow : NSWindow = (sender as! NSButton).window!
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
    //Swift1.2
    func buttonAction061(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
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
    //Swift1.2
    func buttonAction062(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
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
    //Swift1.2
    func buttonAction063(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
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
    //Swift1.2
    func buttonAction064(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
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
        var theWindow : NSWindow = (sender as! NSButton).window!
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
    //NSWindow preservesContentDuringLiveResize
    //Swift1.2
    func buttonAction066(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        
        if (aWindow.preservesContentDuringLiveResize) {
            aWindow.preservesContentDuringLiveResize = false
            (sender as! NSButton).title = "NO"
        }else{
            aWindow.preservesContentDuringLiveResize = true
            (sender as! NSButton).title = "YES"
        }
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
        
        //ボタンの制約設定
        //falseを設定する
        theButton.translatesAutoresizingMaskIntoConstraints = false
        
        //先にaddSubviewする
        aWindow.contentView.addSubview(theButton)
        
        var viewDictionary:Dictionary = ["theButton": theButton]
        
        var constraints:NSMutableArray = NSMutableArray()
        
        //横方向の制限
        //ボタン真ん中に
        var constraintFormat1:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[theButton]-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary)
        constraints.addObjectsFromArray(constraintFormat1)
        
        aWindow.contentView.addConstraints(constraints as [AnyObject])
        
        
        //テーブルビューを作成
        //まずはスクロールビュー
        var scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //中身のテーブルビュー
        var theTableView : CustomTableView = CustomTableView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
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
        
        
        
        //テーブルの制約設定
        //スクロールビューの制約を手動に
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //ウインドウに対するスクロールビューの制約
        var scrollViewConstraints : NSMutableArray = NSMutableArray()
        var viewDictionary3 : Dictionary = ["scrollView": scrollView]
        var scrollViewConstraintV:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(11)-[scrollView]-(20)-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary3)
        scrollViewConstraints.addObjectsFromArray(scrollViewConstraintV)
        //横の制約　スクロールビューが親ビューに対して
        var scrollViewConstraintH:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(11)-[scrollView]-(20)-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary3)
        scrollViewConstraints.addObjectsFromArray(scrollViewConstraintH)
        
        //ウインドウに対するスクロールビューの制約の追加
        aWindow.contentView.addConstraints(scrollViewConstraints as [AnyObject])

        
        
        
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow
    //Swift1.2
    func buttonAction067(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        
        aWindow.setFrame(NSMakeRect(100.0, 100.0, 100.0, 100.0), display: true )
    }
    @IBAction func function067(sender: AnyObject) {
        var theWindow : MyWindow067 = MyWindow067(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction067:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
            Float(theWindow.frame.origin.y),
            Float(theWindow.frame.size.width),
            Float(theWindow.frame.size.height))

    }
    //NSWindow
    //Swift1.2
    func buttonAction068(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        
        if (aWindow.preservesContentDuringLiveResize) {
            aWindow.preservesContentDuringLiveResize = false
            (sender as! NSButton).title = "NO"
        }else{
            aWindow.preservesContentDuringLiveResize = true
            (sender as! NSButton).title = "YES"
        }
        //aWindow.setFrame(NSMakeRect(100.0, 100.0, 100.0, 100.0), display: true )
    }
    @IBAction func function068(sender: AnyObject) {
        var aWindow : MyWindow068 = MyWindow068(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
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
        theButton.action = Selector("buttonAction068:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        
        //ボタンの制約設定
        //falseを設定する
        theButton.translatesAutoresizingMaskIntoConstraints = false
        
        //先にaddSubviewする
        aWindow.contentView.addSubview(theButton)
        
        var viewDictionary:Dictionary = ["theButton": theButton]
        
        var constraints:NSMutableArray = NSMutableArray()
        
        //横方向の制限
        //ボタン真ん中に
        var constraintFormat1:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[theButton]-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary)
        constraints.addObjectsFromArray(constraintFormat1)
        
        aWindow.contentView.addConstraints(constraints as [AnyObject])
        
        
        
        //テーブルビューを作成
        //まずはスクロールビュー
        var scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //中身のイメージビュー
        var theImageView : MyImageView068 = MyImageView068(frame: NSMakeRect(0.0,30.0,1000.0,1000.0))
        
        theImageView.image = NSImage(named: "testImage")
        
        scrollView.documentView = theImageView
        scrollView.hasVerticalRuler = true
        scrollView.hasHorizontalScroller = true
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalRuler = true
        aWindow.contentView.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //ウインドウに対するスクロールビューの制約
        var scrollViewConstraints : NSMutableArray = NSMutableArray()
        var viewDictionary3 : Dictionary = ["scrollView": scrollView]
        var scrollViewConstraintV:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(5)-[scrollView]-(30)-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary3)
        scrollViewConstraints.addObjectsFromArray(scrollViewConstraintV)
        //横の制約　スクロールビューが親ビューに対して
        var scrollViewConstraintH:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(5)-[scrollView]-(5)-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary3)
        scrollViewConstraints.addObjectsFromArray(scrollViewConstraintH)
        
        //ウインドウに対するスクロールビューの制約の追加
        aWindow.contentView.addConstraints(scrollViewConstraints as [AnyObject])
        
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(aWindow.frame.origin.x ),
            Float(aWindow.frame.origin.y),
            Float(aWindow.frame.size.width),
            Float(aWindow.frame.size.height))
    }
    //NSWindow contentAspectRatio
    func buttonAction069(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        
        aWindow.contentAspectRatio = NSMakeSize(100.0, 200.0)
    }
    @IBAction func function069(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        

        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction069:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
            Float(theWindow.frame.origin.y),
            Float(theWindow.frame.size.width),
            Float(theWindow.frame.size.height))
    }
    //NSWindow contentMinSize
    //NSWindow contentMaxSize
    //Swift1.2
    func buttonAction070(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        
        aWindow.contentMinSize = NSMakeSize(200.0, 100.0)
        aWindow.contentMaxSize = NSMakeSize(500.0, 300.0)
    }
    @IBAction func function070(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction070:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
            Float(theWindow.frame.origin.y),
            Float(theWindow.frame.size.width),
            Float(theWindow.frame.size.height))
    }
    //NSWindow contentResizeIncrements
    //Swift1.2
    func buttonAction071(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        
        aWindow.contentResizeIncrements = NSSize(width: 10.0,height: 10.0)
        
    }
    @IBAction func function071(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction071:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        
        NSLog("x = %.2f,y = %.2f,w = %.2f,h = %.2f", Float(theWindow.frame.origin.x ),
            Float(theWindow.frame.origin.y),
            Float(theWindow.frame.size.width),
            Float(theWindow.frame.size.height))
    }
    //NSWindow orderOut()
    //Swift1.2
    func buttonAction072(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.orderOut(self)
    }
    @IBAction func function072(sender: AnyObject) {
        var theWindow1 : NSWindow = NSWindow(contentRect: NSMakeRect(100.0, 100.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow1.title = "ウインドウタイトル1"//タイトル設定
        theWindow1.orderFront(self)//前面に
        theWindow1.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton1.title = "Action"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction072:")
        theButton1.target = self
        theWindow1.contentView.addSubview(theButton1)
        
        var theWindow2 : NSWindow = NSWindow(contentRect: NSMakeRect(140.0, 140.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow2) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow2.title = "ウインドウタイトル2"//タイトル設定
        theWindow2.orderFront(self)//前面に
        theWindow2.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton2.title = "Action"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction072:")
        theButton2.target = self
        theWindow2.contentView.addSubview(theButton2)
        
        var theWindow3 : NSWindow = NSWindow(contentRect: NSMakeRect(180.0, 180.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow3) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow3.title = "ウインドウタイトル3"//タイトル設定
        theWindow3.orderFront(self)//前面に
        theWindow3.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton3 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton3.title = "Action"
        theButton3.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton3.action = Selector("buttonAction072:")
        theButton3.target = self
        theWindow3.contentView.addSubview(theButton3)
        
    }
    //NSWindow orderBack
    //Swift1.2
    func buttonAction073(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.orderBack(self )
    }
    @IBAction func function073(sender: AnyObject) {
        var theWindow1 : NSWindow = NSWindow(contentRect: NSMakeRect(100.0, 100.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow1.title = "ウインドウタイトル1"//タイトル設定
        theWindow1.orderFront(self)//前面に
        theWindow1.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton1.title = "Action"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction073:")
        theButton1.target = self
        theWindow1.contentView.addSubview(theButton1)
        
        var textField1 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow1.contentView.addSubview(textField1)
        
        var theWindow2 : NSWindow = NSWindow(contentRect: NSMakeRect(140.0, 140.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow2) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow2.title = "ウインドウタイトル2"//タイトル設定
        theWindow2.orderFront(self)//前面に
        theWindow2.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton2.title = "Action"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction073:")
        theButton2.target = self
        theWindow2.contentView.addSubview(theButton2)
        
        var textField2 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow2.contentView.addSubview(textField2)
        
        var theWindow3 : NSWindow = NSWindow(contentRect: NSMakeRect(180.0, 180.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow3) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow3.title = "ウインドウタイトル3"//タイトル設定
        theWindow3.orderFront(self)//前面に
        theWindow3.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton3 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton3.title = "Action"
        theButton3.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton3.action = Selector("buttonAction073:")
        theButton3.target = self
        theWindow3.contentView.addSubview(theButton3)
        
        var textField3 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow3.contentView.addSubview(textField3)
    }
    //NSWindow orderFront
    //Swift1.2
    func buttonAction074(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.orderFront(self)
    }
    @IBAction func function074(sender: AnyObject) {
        var theWindow1 : NSWindow = NSWindow(contentRect: NSMakeRect(100.0, 100.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow1.title = "ウインドウタイトル1"//タイトル設定
        theWindow1.orderFront(self)//前面に
        theWindow1.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton1.title = "Action"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction074:")
        theButton1.target = self
        theWindow1.contentView.addSubview(theButton1)
        
        var textField1 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow1.contentView.addSubview(textField1)
        
        var theWindow2 : NSWindow = NSWindow(contentRect: NSMakeRect(140.0, 140.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow2) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow2.title = "ウインドウタイトル2"//タイトル設定
        theWindow2.orderFront(self)//前面に
        theWindow2.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton2.title = "Action"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction074:")
        theButton2.target = self
        theWindow2.contentView.addSubview(theButton2)
        
        var textField2 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow2.contentView.addSubview(textField2)
        
        var theWindow3 : NSWindow = NSWindow(contentRect: NSMakeRect(180.0, 180.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow3) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow3.title = "ウインドウタイトル3"//タイトル設定
        theWindow3.orderFront(self)//前面に
        theWindow3.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton3 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton3.title = "Action"
        theButton3.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton3.action = Selector("buttonAction074:")
        theButton3.target = self
        theWindow3.contentView.addSubview(theButton3)
        
        var textField3 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow3.contentView.addSubview(textField3)
    }
    //NSWindow orderWindow
    //Swift1.2
    func buttonAction075(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.orderWindow( NSWindowOrderingMode.Above , relativeTo: 2)
    }
    @IBAction func function075(sender: AnyObject) {
        var theWindow1 : NSWindow = NSWindow(contentRect: NSMakeRect(100.0, 100.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow1.title = "ウインドウタイトル1"//タイトル設定
        theWindow1.orderFront(self)//前面に
        theWindow1.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton1.title = "Action"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction075:")
        theButton1.target = self
        theWindow1.contentView.addSubview(theButton1)
        
        var textField1 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow1.contentView.addSubview(textField1)
        
        var theWindow2 : NSWindow = NSWindow(contentRect: NSMakeRect(140.0, 140.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow2) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow2.title = "ウインドウタイトル2"//タイトル設定
        theWindow2.orderFront(self)//前面に
        theWindow2.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton2.title = "Action"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction075:")
        theButton2.target = self
        theWindow2.contentView.addSubview(theButton2)
        
        var textField2 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow2.contentView.addSubview(textField2)
        
        var theWindow3 : NSWindow = NSWindow(contentRect: NSMakeRect(180.0, 180.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow3) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow3.title = "ウインドウタイトル3"//タイトル設定
        theWindow3.orderFront(self)//前面に
        theWindow3.makeKeyAndOrderFront(self)//表示
        //ボタンを作成
        var theButton3 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton3.title = "Action"
        theButton3.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton3.action = Selector("buttonAction075:")
        theButton3.target = self
        theWindow3.contentView.addSubview(theButton3)
        
        var textField3 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow3.contentView.addSubview(textField3)
    }
    //NSWindow　level
    //Swift1.2
    func buttonAction076(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.level = Int(CGWindowLevelForKey(Int32(kCGNumberOfWindowLevelKeys)))
        NSLog("%d",Float(aWindow.level))

        /*
        var kCGBaseWindowLevelKey: Int { get }
        var kCGMinimumWindowLevelKey: Int { get }
        var kCGDesktopWindowLevelKey: Int { get }
        var kCGBackstopMenuLevelKey: Int { get }
        var kCGNormalWindowLevelKey: Int { get }
        var kCGFloatingWindowLevelKey: Int { get }
        var kCGTornOffMenuWindowLevelKey: Int { get }
        var kCGDockWindowLevelKey: Int { get }
        var kCGMainMenuWindowLevelKey: Int { get }
        var kCGStatusWindowLevelKey: Int { get }
        var kCGModalPanelWindowLevelKey: Int { get }
        var kCGPopUpMenuWindowLevelKey: Int { get }
        var kCGDraggingWindowLevelKey: Int { get }
        var kCGScreenSaverWindowLevelKey: Int { get }
        var kCGMaximumWindowLevelKey: Int { get }
        var kCGOverlayWindowLevelKey: Int { get }
        var kCGHelpWindowLevelKey: Int { get }
        var kCGUtilityWindowLevelKey: Int { get }
        var kCGDesktopIconWindowLevelKey: Int { get }
        var kCGCursorWindowLevelKey: Int { get }
        var kCGAssistiveTechHighWindowLevelKey: Int { get }
        var kCGNumberOfWindowLevelKeys: Int { get }
        */
    }
    @IBAction func function076(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction076:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)

    }
    //NSWindow occlusionState
    //Swift1.2
    func buttonAction077(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        
    }
    func timer077(timer:NSTimer!) {
        
        var aWindow : NSWindow = (timer.userInfo as! NSWindow)

        //NSLog("default %u",NSWindowOcclusionState.Visible.rawValue)
        //NSLog("default %u",aWindow.occlusionState.rawValue)
        switch (aWindow.occlusionState.rawValue){
        case 8194: //Visible:
            NSLog("Visible")
        case 8192: //Occlusion:
            NSLog("Occlusion")
        default:
            NSLog("default")
        }
    }
    @IBAction func function077(sender: AnyObject) {
        var theWindow : MyWindow077 = MyWindow077(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        theWindow.delegate = theWindow
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction077:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        //タイマー
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timer077:"), userInfo: theWindow, repeats: true )
        
        //タイマー、モーダルに入るとタイマーが動かなくなるので、ランループに追加する
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)


    }
    //NSWindow saveFrameUsingName
    //NSWindow setFrameUsingName
    //NSWindow frameAutosaveName()
    //NSWindow setFrameAutosaveName()
    //NSWindow removeFrameUsingName
    //NSWindow setFrameFromString
    //Swift1.2
    func buttonAction078_save(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.setFrameAutosaveName("")//自動保存中止
        aWindow.saveFrameUsingName("window078")
        aWindow.title = "フレームを保存しました"
        NSLog("stringWithSavedFrame %@", aWindow.stringWithSavedFrame)
    }
    func buttonAction078_set(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        if (aWindow.setFrameUsingName("window078")){
            aWindow.title = "保存したフレームにしました"
        }else{
            aWindow.title = "保存なし"
        }
    }
    func buttonAction078_auto(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.setFrameAutosaveName("window078")
        aWindow.title = "自動保存"
        NSLog("frameAutosaveName %@", aWindow.frameAutosaveName()!)
    }
    func buttonAction078_remove(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        NSWindow.removeFrameUsingName("window078")
        aWindow.title = "フレームを保存をクリア"
    }
    func buttonAction078_string(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
       aWindow.setFrameFromString("293 426 300 222 0 0 1366 745")
    }
    @IBAction func function078(sender: AnyObject) {
        var theWindow : MyWindow078 = MyWindow078(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "フレーム未保存"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        theWindow.delegate = theWindow
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(0.0, 2.0, 70.0, 30.0))
        theButton1.title = "Save"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction078_save:")
        theButton1.target = self
        theWindow.contentView.addSubview(theButton1)
        
        //ボタンを作成
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(70.0, 2.0, 70.0, 30.0))
        theButton2.title = "Set"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction078_set:")
        theButton2.target = self
        theWindow.contentView.addSubview(theButton2)
        
        //ボタンを作成
        var theButton3 : NSButton = NSButton(frame: NSMakeRect(140.0, 2.0, 70.0, 30.0))
        theButton3.title = "auto"
        theButton3.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton3.action = Selector("buttonAction078_auto:")
        theButton3.target = self
        theWindow.contentView.addSubview(theButton3)
        
        //ボタンを作成
        var theButton4 : NSButton = NSButton(frame: NSMakeRect(210.0, 2.0, 70.0, 30.0))
        theButton4.title = "remove"
        theButton4.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton4.action = Selector("buttonAction078_remove:")
        theButton4.target = self
        theWindow.contentView.addSubview(theButton4)
        
        //ボタンを作成
        var theButton5 : NSButton = NSButton(frame: NSMakeRect(280.0, 2.0, 70.0, 30.0))
        theButton5.title = "str"
        theButton5.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton5.action = Selector("buttonAction078_string:")
        theButton5.target = self
        theWindow.contentView.addSubview(theButton5)
        
    }
    //NSWindow canBecomeKeyWindow
    //NSWindow makeKeyWindow
    //Swift1.2
    func buttonAction079(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        if (aWindow.canBecomeKeyWindow){
            NSLog("YES")
            aWindow.makeKeyWindow()
        }else{
            NSLog("NO")
        }
    }
    @IBAction func function079(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction079:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        var textField1 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow.contentView.addSubview(textField1)

    }
    //NSWindow makeKeyAndOrderFront
    //Swift1.2
    func buttonAction080(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        if (aWindow.canBecomeKeyWindow){
            NSLog("YES")
            aWindow.makeKeyAndOrderFront(self)
        }else{
            NSLog("NO")
        }
    }
    @IBAction func function080(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction080:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        var textField1 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow.contentView.addSubview(textField1)
        
    }
    //NSWindow
    //Swift1.2
    func buttonAction081(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
    }
    @IBAction func function081(sender: AnyObject) {
        var theWindow : MyWindow081 = MyWindow081(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウ1"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction081:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        var textField1 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow.contentView.addSubview(textField1)
        
        var theWindow2 : MyWindow081 = MyWindow081(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow2) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        theWindow2.center()//ウインドウをスクリーンの中心に
        theWindow2.title = "ウインドウ2"//タイトル設定
        theWindow2.orderFront(self)//前面に
        theWindow2.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton2.title = "Action"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction081:")
        theButton2.target = self
        theWindow2.contentView.addSubview(theButton2)
        
        var textField2 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow2.contentView.addSubview(textField2)

    }
    //NSWindow canBecomeMainWindow
    //NSWindow makeMainWindow
    //Swift1.2
    func buttonAction082(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        if (aWindow.canBecomeMainWindow){
            NSLog("YES")
            aWindow.makeMainWindow()
        }else{
            NSLog("NO")
        }
    }
    @IBAction func function082(sender: AnyObject) {
        var theWindow : MyWindow082 = MyWindow082(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction082:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        var textField1 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow.contentView.addSubview(textField1)
    }
    //NSWindow toolbar
    //NSWindow toggleToolbarShown
    //NSWindow runToolbarCustomizationPalette
    //Swift1.2
    func buttonAction083_toggle(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.toggleToolbarShown(self)
    }
    func buttonAction083_custom(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.runToolbarCustomizationPalette(self)
        NSLog("custom")
    }
    func toolBarAction083(sender: AnyObject){
        NSLog("!!!")
    }
    
    //NSToolbarDelegate にはこの3つのメソッドが必要
    var toolBarArray : [String] = ["toolBarItem1",NSToolbarSeparatorItemIdentifier,"SearchDocToolbarItemIdentifier"]
    func toolbarAllowedItemIdentifiers(toolbar: NSToolbar) -> [AnyObject] {
        return toolBarArray
    }
    func toolbarDefaultItemIdentifiers(toolbar: NSToolbar) -> [AnyObject] {
        return toolBarArray
    }
    func toolbar(toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: String, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        var aToolBarItem : NSToolbarItem = NSToolbarItem()
        if ( itemIdentifier == "SearchDocToolbarItemIdentifier"){
            
            aToolBarItem  = NSToolbarItem(itemIdentifier: "SearchDocToolbarItemIdentifier")
            aToolBarItem.label = "Search"
            aToolBarItem.paletteLabel = "Search"
            aToolBarItem.toolTip = "Search item"

            //検索
            let searchFieldOutlet : NSSearchField = NSSearchField(frame: NSMakeRect(0.0, 0.0, 100.0,30.0))
            aToolBarItem.view = searchFieldOutlet
            

        }else if( itemIdentifier == "toolBarItem1" ){
            aToolBarItem = NSToolbarItem(itemIdentifier: "toolBarItem1")
            aToolBarItem.label = "item 1"
            aToolBarItem.paletteLabel = "item 1"
            aToolBarItem.toolTip = "toolbar item 1 "
            aToolBarItem.image = NSImage(named: "toolbarImage")
            aToolBarItem.action = Selector("toolBarAction083:")
            aToolBarItem.target = self 
        }else{
            
        }
        return aToolBarItem
    }

    @IBAction func function083(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        let theButton1 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 100.0, 30.0))
        theButton1.title = "Toggle"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction083_toggle:")
        theButton1.target = self
        theWindow.contentView.addSubview(theButton1)
        
        //ボタンを作成
        let theButton2 : NSButton = NSButton(frame: NSMakeRect(150.0, 2.0, 100.0, 30.0))
        theButton2.title = "Custom"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction083_custom:")
        theButton2.target = self
        theWindow.contentView.addSubview(theButton2)
        
        //ツールバーを作成
        let theToolBar : MyToolbar083 = MyToolbar083(identifier: "mainToolBar")
        theToolBar.delegate = self 
        
        //ツールバーの表示モード
        theToolBar.displayMode = NSToolbarDisplayMode.IconAndLabel //アイコントラベル
        //theToolBar.displayMode = NSToolbarDisplayMode.IconOnly //アイコンのみ
        
        //カスタマイズを許可する
        theToolBar.allowsUserCustomization = true
        
        theWindow.toolbar = theToolBar
        
        //ウインドウの表示
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        
    }
    //NSWindow addChildWindow
    //NSWindow childWindows
    //NSWindow parentWindow
    //Swift1.2
    func buttonAction084(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        if (aWindow.childWindows != nil) {
            for value  in aWindow.childWindows! {
                NSLog("title = %@", ((value as! NSWindow).title)!)
                
                let pWindow : NSWindow = value as! NSWindow
                
                NSLog("parent window = %@", pWindow.parentWindow!.title!)
                
                
            }
        }
    }
    @IBAction func function084(sender: AnyObject) {
        var parentWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(parentWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        parentWindow.center()//ウインドウをスクリーンの中心に
        parentWindow.title = "親ウインドウ"//タイトル設定
        parentWindow.orderFront(self)//前面に
        parentWindow.makeKeyAndOrderFront(self)//表示
        
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton1.title = "Action"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction084:")
        theButton1.target = self
        parentWindow.contentView.addSubview(theButton1)
        
        //子ウインドウを作成
        var childWindow1 : NSWindow = NSWindow(contentRect: NSMakeRect( parentWindow.frame.origin.x+310.0, parentWindow.frame.origin.y+20.0, 200, 100), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(childWindow1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        childWindow1.title = "子ウインドウ1"//タイトル設定
        childWindow1.orderFront(self)//前面に
        childWindow1.makeKeyAndOrderFront(self)//表示
        
        //子ウインドウを作成
        var childWindow2 : NSWindow = NSWindow(contentRect: NSMakeRect( parentWindow.frame.origin.x-210.0, parentWindow.frame.origin.y+20.0, 200, 100), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(childWindow1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        childWindow2.title = "子ウインドウ2"//タイトル設定
        childWindow2.orderFront(self)//前面に
        childWindow2.makeKeyAndOrderFront(self)//表示
        
        parentWindow.addChildWindow(childWindow1, ordered: NSWindowOrderingMode.Above)
        parentWindow.addChildWindow(childWindow2, ordered: NSWindowOrderingMode.Above)
        
    }
    //NSWindow removeChildWindow
    //Swift1.2
    var childWindows085 : [AnyObject?] = []
    func buttonAction085(sender: AnyObject){
        var parentWindow : NSWindow = (sender as! NSButton).window!

        if (parentWindow.childWindows?.count > 0) {

            (sender as! NSButton).title = "Set child"
            for value  in parentWindow.childWindows! {
                NSLog("title = %@", ((value as! NSWindow).title)!)

                parentWindow.removeChildWindow(value as! NSWindow)
  
            }
        }else{
            (sender as! NSButton).title = "Remove"
            for value  in childWindows085 {
                parentWindow.addChildWindow(value as! NSWindow, ordered: NSWindowOrderingMode.Above)
            }
        }
    }
    @IBAction func function085(sender: AnyObject) {
        var parentWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(parentWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        parentWindow.center()//ウインドウをスクリーンの中心に
        parentWindow.title = "親ウインドウ"//タイトル設定
        parentWindow.orderFront(self)//前面に
        parentWindow.makeKeyAndOrderFront(self)//表示
        
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton1.title = "Remove"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction085:")
        theButton1.target = self
        parentWindow.contentView.addSubview(theButton1)
        
        //子ウインドウを作成
        var childWindow1 : NSWindow = NSWindow(contentRect: NSMakeRect( parentWindow.frame.origin.x+310.0, parentWindow.frame.origin.y+20.0, 200, 100), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(childWindow1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        childWindow1.title = "子ウインドウ1"//タイトル設定
        childWindow1.orderFront(self)//前面に
        childWindow1.makeKeyAndOrderFront(self)//表示
        
        //子ウインドウを作成
        var childWindow2 : NSWindow = NSWindow(contentRect: NSMakeRect( parentWindow.frame.origin.x-210.0, parentWindow.frame.origin.y+20.0, 200, 100), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(childWindow2) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        childWindow2.title = "子ウインドウ2"//タイトル設定
        childWindow2.orderFront(self)//前面に
        childWindow2.makeKeyAndOrderFront(self)//表示
        
        parentWindow.addChildWindow(childWindow1, ordered: NSWindowOrderingMode.Above)
        parentWindow.addChildWindow(childWindow2, ordered: NSWindowOrderingMode.Above)
        childWindows085.append(childWindow1)
        childWindows085.append(childWindow2)
        
    }
    //NSWindow
    //必要なところだけ書き換える
    var aButton086 : NSButton?
    var aView086 : MyView086?
    var increment : Float = 1.0
    
    func theTimer086(timer:NSTimer!) {
        let anApplication = NSApplication.sharedApplication()
        //準備
        let aButton = aButton086
        var aWindow : NSWindow = (aView086! as MyView086).window!
        
        if (aView086!.delta < -50.0){
            increment = 1.0
        }
        if (aView086!.delta > 100.0){
            increment = -1.0
        }
        aView086!.delta = aView086!.delta + increment
        //aWindow.flushWindow()
        
        //必要なところだけ描画
        var counter : Int = aView086!.needDisplayAreaArray.count
        while (counter-- > 0){
            let aRect : NSRect = aView086!.needDisplayAreaArray[counter]
            aView086!.setNeedsDisplayInRect(aRect)
        }

    }
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction086(sender : AnyObject?){
        let aButton = aButton086
        var aWindow : NSWindow = (sender as! NSButton).window!
   
    }

    @IBAction func function086(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示

        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction086:")
        theButton.target = self
        
        theWindow.contentView.addSubview(theButton)
        
        var theView : MyView086 = MyView086(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        theWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton086 = theButton    //ボタン
        self.aView086 = theView        //テストビュー
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        //タイマー
        var timer = NSTimer.scheduledTimerWithTimeInterval( 0.05 , target: self, selector: Selector("theTimer086:"), userInfo: ["window": theWindow,"view":theButton] , repeats: true )
        
        timer.fire()
        
    }
    //NSWindow
    //Swift1.2
    //画面書き換え停止
    var textFieldArray : [NSTextField] = []
    func buttonAction087_noflush(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.disableFlushWindow()
            for textField in textFieldArray {
                aWindow.makeFirstResponder(textField)
                textField.flushBufferedKeyEvents()// display()
                textField.stringValue = "n"
            }
        aWindow.enableFlushWindow()
        //aWindow.flushWindowIfNeeded()
        aWindow.flushWindow()
    }
    //画面書き換えする
    func buttonAction087_flush(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        //aWindow.disableFlushWindow()
        for textField in textFieldArray {
            aWindow.makeFirstResponder(textField)
            textField.display()
            textField.stringValue = "f"
        }
        //aWindow.enableFlushWindow()
    }
    //リセット
    func buttonAction087_reset(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        for textField in textFieldArray {
            textField.stringValue = ""
        }
    }
    @IBAction func function087(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(0.0, 2.0, 100.0, 30.0))
        theButton1.title = "Not Flush"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction087_noflush:")
        theButton1.target = self
        theWindow.contentView.addSubview(theButton1)
        
        //ボタンを作成 flushしない
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(200.0, 2.0, 100.0, 30.0))
        theButton2.title = "Flush"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction087_flush:")
        theButton2.target = self
        theWindow.contentView.addSubview(theButton2)
        
        //ボタンを作成 リセット
        var theButton3 : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton3.title = "Reset"
        theButton3.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton3.action = Selector("buttonAction087_reset:")
        theButton3.target = self
        theWindow.contentView.addSubview(theButton3)
        
        for (var u = 0 ; u < 15 ; u++ ){
            for (var i = 0 ; i < 8 ; i++ ){
                let tfRect : NSRect = NSMakeRect((20.0 * CGFloat(u) ),
                                            (20.0 * CGFloat(i)+30.0 ), 20.0, 20.0)
            let textField : NSTextField = NSTextField(frame: tfRect)
                theWindow.contentView.addSubview(textField)
                textFieldArray.append(textField)
            }
        }
        
    }
    //NSWindow setDefaultButtonCell
    //NSWindow defaultButtonCell
    func buttonAction088_a(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        NSLog("type A")
    }
    func buttonAction088_b(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        NSLog("type B")
    }
    @IBAction func function088(sender: AnyObject) {
        var theWindow : MyWindow082 = MyWindow082(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 100.0, 30.0))
        theButton1.title = "Type A"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction088_a:")
        theButton1.target = self
        theWindow.contentView.addSubview(theButton1)
        
        //ボタンを作成
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(150.0, 2.0, 100.0, 30.0))
        theButton2.title = "Type B"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction088_b:")
        theButton2.target = self
        theWindow.contentView.addSubview(theButton2)
        
        //デフォルトボタンにする
        theWindow.setDefaultButtonCell(theButton2.cell() as? NSButtonCell)
        let aCell : NSButtonCell = theWindow.defaultButtonCell()!

        NSLog("%@",aCell.title)
        
        var textField1 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow.contentView.addSubview(textField1)
    }
    
    
    //NSWindow　disableKeyEquivalentForDefaultButtonCell()
    //NSWindow　enableKeyEquivalentForDefaultButtonCell()
    //Swift1.2
    func buttonAction089(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!

        NSLog("Button push!")
    }
    func buttonAction089_b(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        NSLog("type B")
    }
    @IBAction func function089(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 100.0, 30.0))
        theButton1.title = "Action"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction089:")
        theButton1.target = self
        theWindow.contentView.addSubview(theButton1)
        

        //ボタンを作成
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(150.0, 2.0, 100.0, 30.0))
        theButton2.title = "Other"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction088_b:")
        theButton2.target = self
        theWindow.contentView.addSubview(theButton2)
        
        //デフォルトボタンにする
        theWindow.setDefaultButtonCell(theButton1.cell() as? NSButtonCell)

        var textField1 : MyTextField089 = MyTextField089(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        theWindow.contentView.addSubview(textField1)
        
    }
    
    
    
    //NSWindow
    //Swift1.2
    func buttonAction090(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        
        //aWindow.flushBufferedKeyEvents()
        aWindow.disableKeyEquivalentForDefaultButtonCell()
        for textField in textFieldArray {
            aWindow.makeFirstResponder(textField)
            textField.display()
            textField.stringValue = "f"
        }
        aWindow.enableKeyEquivalentForDefaultButtonCell()
        
    }
    func buttonAction090_b(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        NSLog("type B")
    }
    @IBAction func function090(sender: AnyObject) {
        var theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 100.0, 30.0))
        theButton1.title = "Action"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction090:")
        theButton1.target = self
        theWindow.contentView.addSubview(theButton1)
        
        
        //ボタンを作成
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(150.0, 2.0, 100.0, 30.0))
        theButton2.title = "Other"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction090_b:")
        theButton2.target = self
        theWindow.contentView.addSubview(theButton2)
        
        //デフォルトボタンにする
        theWindow.setDefaultButtonCell(theButton1.cell() as? NSButtonCell)
        
        
        for (var u = 0 ; u < 15 ; u++ ){
            for (var i = 0 ; i < 8 ; i++ ){
                let tfRect : NSRect = NSMakeRect((20.0 * CGFloat(u) ),
                    (20.0 * CGFloat(i)+30.0 ), 20.0, 20.0)
                let textField : NSTextField = NSTextField(frame: tfRect)
                theWindow.contentView.addSubview(textField)
                textFieldArray.append(textField)
            }
        }
        
    }

    //NSWindow
    var textField091 : NSTextField?
    func buttonAction091(sender: AnyObject){
        var aWindow : NSWindow = (sender as! NSButton).window!
        let aText : NSText =  aWindow.fieldEditor(true , forObject: nil)!
        NSLog("%@",aText.description);
        
        aText.frame = NSMakeRect(0.0,0.0,200.0,30)
        
        if aWindow.makeFirstResponder(aWindow) {
            NSLog("!!!");
        }else{
            aWindow.endEditingFor(nil)
        }
        
    }
    @IBAction func function091(sender: AnyObject) {
        var theWindow : MyWindow082 = MyWindow082(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction091:")
        theButton.target = self
        theWindow.contentView.addSubview(theButton)
        
        //var textField1 : NSTextField = NSTextField(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
        //theWindow.contentView.addSubview(textField1)
        
        //self.textField091 = textField1        //テストビュー
        
        var cFrame = theWindow.contentView.frame //NSMakeRect(50.0,50.0,100.0,30.0)
        //まずはスクロールビュー
        var scrollView : NSScrollView = NSScrollView(frame: cFrame)
        var contentSize : NSSize = scrollView.contentSize
        scrollView.borderType = NSBorderType.NoBorder
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true
        scrollView.autoresizingMask = NSAutoresizingMaskOptions.ViewWidthSizable
        
        //中身のテキストビュー
        let textView : NSTextView = NSTextView(frame: cFrame)
        textView.minSize = NSMakeSize(0.0, contentSize.height)
        textView.verticallyResizable = true
        textView.horizontallyResizable = true
        scrollView.documentView = textView
        theWindow.contentView.addSubview(textView)
        //[theTextView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
        //[theTextView setAutoresizingMask:NSViewWidthSizable];
        //[[theTextView textContainer]
        //    setContainerSize:NSMakeSize(contentSize.width, FLT_MAX)];
        //[[theTextView textContainer] setWidthTracksTextView:YES];


        theWindow.contentView.addSubview(scrollView)
        theWindow.makeKeyAndOrderFront(nil)
        theWindow.makeFirstResponder(textView)
        
//        [theWindow makeFirstResponder:theTextView];

        
        
        
        
        
    }
    //NSWindow
    @IBAction func function092(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function093(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function094(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function095(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function096(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function097(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function098(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function099(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function100(sender: AnyObject) {

    }

    //NSWindow
    func windowWillReturnFieldEditor(sender: NSWindow, toObject client: AnyObject?) -> AnyObject? {
        NSLog("windowWillReturnFieldEditor　%@",sender.description)
        return client
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

