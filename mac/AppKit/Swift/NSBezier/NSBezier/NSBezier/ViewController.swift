//
//  ViewController.swift
//  NSBezier
//
//  Created by air on 2015/03/01.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    //ウインドウを保持しておくための配列
    var windowArray : NSMutableArray = []
    
    //NSBezierPath init()
    //NSBezierPath curveToPoint:controlPoint1:controlPoint2:
    //NSBezierPath closePath
    var aButton001 : NSButton?
    var aView001 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction001(sender : AnyObject?){
        //準備
        let aButton = aButton001
        let aView   = aView001
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 176.95,y: 44.90))
        aBezier.curveToPoint(CGPoint(x: 166.71,y: 145.89),
            controlPoint1: CGPoint(x: 76.63,y: 76.78),
            controlPoint2: CGPoint(x: 82.59,y: 206.70))
        aBezier.curveToPoint(CGPoint(x: 176.95,y: 44.90),
            controlPoint1: CGPoint(x: 237.55,y: 224.76),
            controlPoint2: CGPoint(x: 276.83,y: 95.98))
        aBezier.closePath()
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function001(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction001:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton001 = theButton    //ボタン
        self.aView001 = theView        //テストビュー
           aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSBezierPath init(ovalInRect:)
    var aButton002 : NSButton?
    var aView002 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction002(sender : AnyObject?){
        //準備
        let aButton = aButton002
        let aView   = aView002
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //楕円のベジェパスを作成
        let aBezier : NSBezierPath =
            NSBezierPath(ovalInRect: NSMakeRect(100.0, 100.0, 120.0, 80.0))

        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function002(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction002:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton002 = theButton    //ボタン
        self.aView002 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath init(rect:)
    var aButton003 : NSButton?
    var aView003 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction003(sender : AnyObject?){
        //準備
        let aButton = aButton003
        let aView   = aView003
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //四角のベジェパスを作成
        let aBezier : NSBezierPath =
        NSBezierPath(rect: NSMakeRect(90.0, 80.0, 120.0, 80.0))
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function003(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction003:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton003 = theButton    //ボタン
        self.aView003 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath init(roundedRect: )
    var aButton004 : NSButton?
    var aView004 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction004(sender : AnyObject?){
        //準備
        let aButton = aButton004
        let aView   = aView004
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //角丸四角のベジェパスを作成
        let aBezier : NSBezierPath =
        NSBezierPath(roundedRect: NSMakeRect(90.0, 80.0, 120.0, 80.0),
            xRadius: 20.0,
            yRadius: 20.0)
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function004(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction004:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton004 = theButton    //ボタン
        self.aView004 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    //NSBezierPath　bezierPathByFlatteningPath
    //NSBezierPath　setDefaultFlatness
    var aButton005 : NSButton?
    var aView005 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction005(sender : AnyObject?){
        //準備
        let aButton = aButton005
        let aView   = aView005
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 176.95,y: 44.90))
        aBezier.curveToPoint(CGPoint(x: 166.71,y: 145.89),
            controlPoint1: CGPoint(x: 76.63,y: 76.78),
            controlPoint2: CGPoint(x: 82.59,y: 206.70))
        aBezier.curveToPoint(CGPoint(x: 176.95,y: 44.90),
            controlPoint1: CGPoint(x: 237.55,y: 224.76),
            controlPoint2: CGPoint(x: 276.83,y: 95.98))
        aBezier.closePath()
        
        //フラット化
        NSBezierPath.setDefaultFlatness(5.0)
        let fBezier : NSBezierPath = aBezier.bezierPathByFlatteningPath
        
        fBezier.fill()
        fBezier.lineWidth = 2.0
        fBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function005(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction005:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton005 = theButton    //ボタン
        self.aView005 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath bezierPathByReversingPath
    var aButton006 : NSButton?
    var aView006 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction006(sender : AnyObject?){
        //準備
        let aButton = aButton006
        let aView   = aView006
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 176.95,y: 44.90))
        aBezier.curveToPoint(CGPoint(x: 166.71,y: 145.89),
            controlPoint1: CGPoint(x: 76.63,y: 76.78),
            controlPoint2: CGPoint(x: 82.59,y: 206.70))
        aBezier.curveToPoint(CGPoint(x: 176.95,y: 44.90),
            controlPoint1: CGPoint(x: 237.55,y: 224.76),
            controlPoint2: CGPoint(x: 276.83,y: 95.98))
        aBezier.closePath()
        
        let oBezier : NSBezierPath =
        NSBezierPath(ovalInRect: NSMakeRect(120.0, 100.0, 50.0, 50.0))
        
        //くり抜き用を追加
        //くり抜かれる
        //aBezier.appendBezierPath(oBezier)
        //くり抜かれない
        aBezier.appendBezierPath(oBezier.bezierPathByReversingPath)
        
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function006(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction006:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton006 = theButton    //ボタン
        self.aView006 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath moveToPoint
    var aButton007 : NSButton?
    var aView007 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction007(sender : AnyObject?){
        //準備
        let aButton = aButton007
        let aView   = aView007
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 176.95-50,y: 44.90))
        aBezier.curveToPoint(CGPoint(x: 166.71-50,y: 145.89),
            controlPoint1: CGPoint(x: 76.63-50,y: 76.78),
            controlPoint2: CGPoint(x: 82.59-50,y: 206.70))
        aBezier.curveToPoint(CGPoint(x: 176.95-50,y: 44.90),
            controlPoint1: CGPoint(x: 237.55-50,y: 224.76),
            controlPoint2: CGPoint(x: 276.83-50,y: 95.98))
        
        aBezier.moveToPoint(CGPoint(x: 176.95+50,y: 44.90))
        aBezier.curveToPoint(CGPoint(x: 166.71+50,y: 145.89),
            controlPoint1: CGPoint(x: 76.63+50,y: 76.78),
            controlPoint2: CGPoint(x: 82.59+50,y: 206.70))
        aBezier.curveToPoint(CGPoint(x: 176.95+50,y: 44.90),
            controlPoint1: CGPoint(x: 237.55+50,y: 224.76),
            controlPoint2: CGPoint(x: 276.83+50,y: 95.98))
        
        aBezier.closePath()
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function007(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction007:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton007 = theButton    //ボタン
        self.aView007 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath lineToPoint:
    var aButton008 : NSButton?
    var aView008 : NSView?
    //実験用ウインドウのボタンを押した時に実行されるところ
    func viewAction008(sender : AnyObject?){
        //準備
        let aButton = aButton008
        let aView   = aView008
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 125.00,y: 45.00))
        //線を引く
        aBezier.lineToPoint(CGPoint(x: 185.00,y: 49.00))
        aBezier.lineToPoint(CGPoint(x: 230.00,y: 123.00))

        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function008(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction008:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton008 = theButton    //ボタン
        self.aView008 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath　relativeMoveToPoint:
    //NSBezierPath　relativelineToPoint:
    var aButton009 : NSButton?
    var aView009 : NSView?
    //実験用ウインドウのボタンを押した時に実行されるところ
    func viewAction009(sender : AnyObject?){
        //準備
        let aButton = aButton009
        let aView   = aView009
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 125.00,y: 45.00))
        //線を引く
        aBezier.lineToPoint(CGPoint(x: 185.00,y: 49.00))
        aBezier.lineToPoint(CGPoint(x: 230.00,y: 123.00))
        //現在位置からの移動
        aBezier.relativeMoveToPoint(NSMakePoint(0.00, 20.00))
        aBezier.relativeLineToPoint(NSMakePoint(-50.00, 10.00))
        aBezier.relativeCurveToPoint(NSMakePoint(-50.00,-50.00),
            controlPoint1: NSMakePoint(-30.00, 0.00),
            controlPoint2: NSMakePoint(-30.00, 0.00))
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function009(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction009:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton009 = theButton    //ボタン
        self.aView009 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

    }
    //NSBezierPath　appendBezierPath:
    var aButton010 : NSButton?
    var aView010 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction010(sender : AnyObject?){
        //準備
        let aButton = aButton010
        let aView   = aView010
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let rBezier : NSBezierPath =
        NSBezierPath(ovalInRect: NSMakeRect(100.0, 100.0, 50.0, 50.0))
        
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 176.95,y: 44.90))
        aBezier.curveToPoint(CGPoint(x: 166.71,y: 145.89),
            controlPoint1: CGPoint(x: 76.63,y: 76.78),
            controlPoint2: CGPoint(x: 82.59,y: 206.70))
        aBezier.curveToPoint(CGPoint(x: 176.95,y: 44.90),
            controlPoint1: CGPoint(x: 237.55,y: 224.76),
            controlPoint2: CGPoint(x: 276.83,y: 95.98))
        aBezier.closePath()
        //ここ
        aBezier.appendBezierPath(rBezier)
        
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function010(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction010:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton010 = theButton    //ボタン
        self.aView010 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath
    var aButton011 : NSButton?
    var aView011 : NSView?
    func blankof<T>(type:T.Type) -> T {
        var ptr = UnsafeMutablePointer<T>.alloc(sizeof(T))
        var val = ptr.memory
        ptr.destroy()
        return val
    }
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction011(sender : AnyObject?){
        //準備
        let aButton = aButton011
        let aView   = aView011
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 80.0,y: 50.0))

        //ここから
        var points:[NSPoint] = [NSMakePoint(220.0, 50.0),
                                NSMakePoint(220.0,120.0),
                                NSMakePoint(150.0,180.0),
                                NSMakePoint( 80.0,120.0),
                                NSMakePoint( 80.0, 50.0)]
        aBezier.appendBezierPathWithPoints( &points, count: points.count)
        //ここまで
        aBezier.closePath()
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function011(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction011:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton011 = theButton    //ボタン
        self.aView011 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath appendBezierPathWithOvalInRect
    var aButton012 : NSButton?
    var aView012 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction012(sender : AnyObject?){
        //準備
        let aButton = aButton012
        let aView   = aView012
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 176.95,y: 44.90))
        aBezier.curveToPoint(CGPoint(x: 166.71,y: 145.89),
            controlPoint1: CGPoint(x: 76.63,y: 76.78),
            controlPoint2: CGPoint(x: 82.59,y: 206.70))
        aBezier.curveToPoint(CGPoint(x: 176.95,y: 44.90),
            controlPoint1: CGPoint(x: 237.55,y: 224.76),
            controlPoint2: CGPoint(x: 276.83,y: 95.98))
        aBezier.closePath()
        
        aBezier.appendBezierPathWithOvalInRect(NSMakeRect(90.0, 35.0, 30.0, 30.0))
        
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function012(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction012:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton012 = theButton    //ボタン
        self.aView012 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSBezierPath appendBezierPathWithArcFromPoint
    var aButton013 : NSButton?
    var aView013 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction013(sender : AnyObject?){
        //準備
        let aButton = aButton013
        let aView   = aView013
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        
        //角丸四角形　今は別のメソッドがあるけど
        let aRect : NSRect =  NSMakeRect(100.0, 100.0,100.0,60.0)
        let topMid : NSPoint = NSMakePoint(NSMidX(aRect), NSMaxY(aRect))
        let topLeft : NSPoint = NSMakePoint(NSMinX(aRect), NSMaxY(aRect))
        let topRight : NSPoint = NSMakePoint(NSMaxX(aRect), NSMaxY(aRect))
        let bottomRight : NSPoint = NSMakePoint(NSMaxX(aRect), NSMinY(aRect))
        let radius : CGFloat = 10.0
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(topMid)
        aBezier.appendBezierPathWithArcFromPoint(topLeft, toPoint: aRect.origin, radius: radius)
        aBezier.appendBezierPathWithArcFromPoint(aRect.origin, toPoint: bottomRight, radius: radius)
        aBezier.appendBezierPathWithArcFromPoint(bottomRight, toPoint: topRight , radius: radius)
        aBezier.appendBezierPathWithArcFromPoint(topRight, toPoint: topLeft , radius: radius)
        aBezier.closePath()
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function013(sender: AnyObject) {
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
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction013:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton013 = theButton    //ボタン
        self.aView013 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath
    @IBAction func function014(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function015(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function016(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function017(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function018(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function019(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function020(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function021(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function022(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function023(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function024(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function025(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function026(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function027(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function028(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function029(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function030(sender: AnyObject) {
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

