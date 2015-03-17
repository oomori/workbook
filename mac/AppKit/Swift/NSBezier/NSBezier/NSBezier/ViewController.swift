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
    //NSBezierPath lineWidth
    //NSBezierPath stroke
    //NSBezierPath fill
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
    //NSBezierPath　defaultFlatness
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
        NSLog("defaultFlatness %f",Float(NSBezierPath.defaultFlatness()) )
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
    
    //NSBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:
    var aButton014 : NSButton?
    var aView014 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction014(sender : AnyObject?){
        //準備
        let aButton = aButton014
        let aView   = aView014
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
        aBezier.appendBezierPathWithArcWithCenter(NSMakePoint(100.0, 100.0),
                                    radius: 50.0,
                                    startAngle: 0,
                                    endAngle: 250)

        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function014(sender: AnyObject) {
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
        theButton.action = Selector("viewAction014:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton014 = theButton    //ボタン
        self.aView014 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise
    var aButton015 : NSButton?
    var aView015 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction015(sender : AnyObject?){
        //準備
        let aButton = aButton015
        let aView   = aView015
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
        aBezier.appendBezierPathWithArcWithCenter(NSMakePoint(100.0, 100.0),
            radius: 50.0,
            startAngle: 0,
            endAngle: 250,
            clockwise: true)
        
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function015(sender: AnyObject) {
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
        theButton.action = Selector("viewAction015:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton015 = theButton    //ボタン
        self.aView015 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath appendBezierPathWithGlyphs:inFont:
    var aButton016 : NSButton?
    var aView016 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction016(sender : AnyObject?){
        //準備
        let aButton = aButton016
        let aView   = aView016
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
        
        let myFont : NSFont = NSFont(name: "HiraMaruPro-W4", size: 69.0)!
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        //let aGlyph : NSGlyph = myFont.glyphWithName("gid5002")
        let aGlyph : NSGlyph = myFont.glyphWithName("gid1800")
        NSLog("glyph = %u",aGlyph)
        
        aBezier.moveToPoint(CGPoint(x: 125.0,y: 75.0))
        aBezier.appendBezierPathWithGlyph(aGlyph,  inFont: myFont)
        
        aBezier.fill()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function016(sender: AnyObject) {
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
        theButton.action = Selector("viewAction016:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton016 = theButton    //ボタン
        self.aView016 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath　appendBezierPathWithGlyphs:count:inFont:
    var aButton017 : NSButton?
    var aView017 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction017(sender : AnyObject?){
        //準備
        let aButton = aButton017
        let aView   = aView017
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
        
        let myFont : NSFont = NSFont(name: "HiraMaruPro-W4", size: 69.0)!
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        var aGlyphs : [NSGlyph] = [myFont.glyphWithName("gid1800"),myFont.glyphWithName("gid1801")]
        
        aBezier.moveToPoint(CGPoint(x: 100.0,y: 75.0))
        aBezier.appendBezierPathWithGlyphs( &aGlyphs , count: 2, inFont: myFont)
        
        aBezier.fill()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function017(sender: AnyObject) {
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
        theButton.action = Selector("viewAction017:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton017 = theButton    //ボタン
        self.aView017 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath 調査中
    //NSBezierPath 調査中
    var aButton018 : NSButton?
    var aView018 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction018(sender : AnyObject?){
        //準備
        let aButton = aButton018
        let aView   = aView018
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

        var my_s_pointer :UnsafeMutablePointer<NSGlyph> = UnsafeMutablePointer<NSGlyph>.alloc(1)
        var val = my_s_pointer.memory
        //var val : NSGlyph = NSGlyph(4546)
        let myFont : NSFont = NSFont(name: "HiraMaruPro-W4", size: 69.0)!

        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        //var aGlyphs : [NSGlyph] = [myFont.glyphWithName("gid1800"),myFont.glyphWithName("gid1801")]
        //var aGlyph : NSGlyph = myFont.glyphWithName("gid1800")
        var aGlyph : UnsafeMutablePointer<NSGlyph> = UnsafeMutablePointer<NSGlyph>.alloc(4*1+1) // allocate
        var packedGlyphs : CChar
//        let ret : Int = NSConvertGlyphsToPackedGlyphs(glBuf: &aGlyph,
//            count: Int(1),
//            packing:Int(1) , //.NSNativeShortGlyphPacking
//            packedGlyphs :&packedGlyphs)


        
//NSMultibyteGlyphPacking
        aBezier.moveToPoint(CGPoint(x: 100.0,y: 75.0))
        //aBezier.appendBezierPathWithGlyphs( &aGlyphs , count: 2, inFont: myFont)

        //aBezier.appendBezierPathWithPackedGlyphs(&packedGlyphs)
        aBezier.fill()
        
        my_s_pointer.destroy()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function018(sender: AnyObject) {
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
        theButton.action = Selector("viewAction018:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton018 = theButton    //ボタン
        self.aView018 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath　appendBezierPathWithRect
    var aButton019 : NSButton?
    var aView019 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction019(sender : AnyObject?){
        //準備
        let aButton = aButton019
        let aView   = aView019
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
        
        aBezier.appendBezierPathWithRect(NSMakeRect(20.0, 20.0, 30.0, 20.0))
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function019(sender: AnyObject) {
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
        theButton.action = Selector("viewAction019:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton019 = theButton    //ボタン
        self.aView019 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

    }
    //NSBezierPath appendBezierPathWithRoundedRect:xRadius:yRadius:
    var aButton020 : NSButton?
    var aView020 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction020(sender : AnyObject?){
        //準備
        let aButton = aButton020
        let aView   = aView020
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
        //ここから
        aBezier.appendBezierPathWithRoundedRect(NSMakeRect(90.0, 35.0, 160.0, 150.0),
            xRadius: 20.0,
            yRadius: 20.0)
        //ここまで
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function020(sender: AnyObject) {
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
        theButton.action = Selector("viewAction020:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton020 = theButton    //ボタン
        self.aView020 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSBezierPath defaultWindingRule
    //NSBezierPath setDefaultWindingRule
    var aButton021 : NSButton?
    var aView021 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction021(sender : AnyObject?){
        //準備
        let aButton = aButton021
        let aView   = aView021
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
        
        switch (NSBezierPath.defaultWindingRule() ){
        case .EvenOddWindingRule:
            NSLog("defaultWindingRule EvenOdd")
        case .NonZeroWindingRule:
            NSLog("defaultWindingRule Non Zero")
        default:
            NSLog("default")
        }
        //->defaultWindingRule Non Zero

        NSBezierPath.setDefaultWindingRule( .EvenOddWindingRule)
        switch (NSBezierPath.defaultWindingRule() ){
        case .EvenOddWindingRule:
            NSLog("defaultWindingRule EvenOdd")
        case .NonZeroWindingRule:
            NSLog("defaultWindingRule Non Zero")
        default:
            NSLog("default")
        }
        //->defaultWindingRule EvenOdd
        
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        //NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function021(sender: AnyObject) {
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
        theButton.action = Selector("viewAction021:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton021 = theButton    //ボタン
        self.aView021 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath windingRule
    var aButton022 : NSButton?
    var aView022 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction022(sender : AnyObject?){
        //準備
        let aButton = aButton022
        let aView   = aView022
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
        //let aBezier : NSBezierPath = NSBezierPath()
        
        
        
        //->defaultWindingRule Non Zero
        let aBezier : NSBezierPath =
        NSBezierPath(ovalInRect: NSMakeRect(100.0, 100.0, 200.0, 100.0))
        let o1Bezier : NSBezierPath =
        NSBezierPath(ovalInRect: NSMakeRect(120.0, 100.0, 50.0, 50.0))
        let o2Bezier : NSBezierPath =
        NSBezierPath(ovalInRect: NSMakeRect(220.0, 100.0, 50.0, 50.0))
        
        aBezier.windingRule = .NonZeroWindingRule
        o1Bezier.windingRule = .NonZeroWindingRule
        o2Bezier.windingRule = .NonZeroWindingRule
        
        
        aBezier.appendBezierPath(o1Bezier)
        aBezier.appendBezierPath(o2Bezier.bezierPathByReversingPath)
        
        switch (aBezier.windingRule ){
        case .EvenOddWindingRule:
            NSLog("windingRule EvenOdd")
        case .NonZeroWindingRule:
            NSLog("windingRule Non Zero")
        default:
            NSLog("default")
        }
        
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        //NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function022(sender: AnyObject) {
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
        theButton.action = Selector("viewAction022:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton022 = theButton    //ボタン
        self.aView022 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath
    var aButton023 : NSButton?
    var aView023 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction023(sender : AnyObject?){
        //準備
        let aButton = aButton023
        let aView   = aView023
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        //ここ
        //NSBezierPath.setDefaultLineCapStyle(.ButtLineCapStyle)
        //NSBezierPath.setDefaultLineCapStyle(.RoundLineCapStyle)
        NSBezierPath.setDefaultLineCapStyle(.SquareLineCapStyle)
        NSColor.magentaColor().setStroke()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 95.00,y: 45.00))
        //線を引く
        aBezier.lineToPoint(CGPoint(x: 185.00,y: 60.00))
        aBezier.lineToPoint(CGPoint(x: 130.00,y: 150.00))

        aBezier.lineWidth = 40.0
        aBezier.stroke()
        
        //ガイド
        aBezier.appendBezierPathWithOvalInRect(NSMakeRect(130-30.0, 150.0-30.0, 60.0, 60.0))
        aBezier.lineWidth = 2.0
        NSColor.redColor().setStroke()
        aBezier.stroke()
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function023(sender: AnyObject) {
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
        theButton.action = Selector("viewAction023:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton023 = theButton    //ボタン
        self.aView023 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

    }
    //NSBezierPath
    var aButton024 : NSButton?
    var aView024 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction024(sender : AnyObject?){
        //準備
        let aButton = aButton024
        let aView   = aView024
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        //ここ
        //NSBezierPath.setDefaultLineCapStyle(.ButtLineCapStyle)
        //NSBezierPath.setDefaultLineCapStyle(.RoundLineCapStyle)
        NSBezierPath.setDefaultLineCapStyle(.SquareLineCapStyle)
        NSColor.magentaColor().setStroke()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 95.00,y: 45.00))
        //線を引く
        aBezier.lineToPoint(CGPoint(x: 185.00,y: 60.00))
        aBezier.lineToPoint(CGPoint(x: 130.00,y: 150.00))
        
        aBezier.lineWidth = 40.0
        aBezier.stroke()
        
        //ガイド
        aBezier.appendBezierPathWithOvalInRect(NSMakeRect(130-30.0, 150.0-30.0, 60.0, 60.0))
        aBezier.lineWidth = 2.0
        NSColor.redColor().setStroke()
        aBezier.stroke()
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function024(sender: AnyObject) {
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
        theButton.action = Selector("viewAction024:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton024 = theButton    //ボタン
        self.aView024 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath　lineCapStyle
    var aButton025 : NSButton?
    var aView025 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction025(sender : AnyObject?){
        //準備
        let aButton = aButton025
        let aView   = aView025
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        //ここ
        //NSBezierPath.setDefaultLineCapStyle(.ButtLineCapStyle)
        //NSBezierPath.setDefaultLineCapStyle(.RoundLineCapStyle)
        NSBezierPath.setDefaultLineCapStyle(.SquareLineCapStyle)
        NSColor.magentaColor().setStroke()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 95.00,y: 45.00))
        //線を引く
        aBezier.lineToPoint(CGPoint(x: 185.00,y: 60.00))
        aBezier.lineToPoint(CGPoint(x: 130.00,y: 150.00))
        
        //SquareLineCapStyleで描画
        aBezier.lineWidth = 40.0
        aBezier.stroke()
        
        //同じ線をButtLineCapStyleで描画
        NSColor.yellowColor().setStroke()
        aBezier.lineCapStyle = .ButtLineCapStyle
        aBezier.stroke()
        
        //ガイド
        aBezier.appendBezierPathWithOvalInRect(NSMakeRect(130-30.0, 150.0-30.0, 60.0, 60.0))
        aBezier.lineWidth = 2.0
        NSColor.redColor().setStroke()
        aBezier.stroke()
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        switch (aBezier.lineCapStyle ){
        case .ButtLineCapStyle:
            NSLog("ButtLineCapStyle")
        case .RoundLineCapStyle:
            NSLog("RoundLineCapStyle")
        case .SquareLineCapStyle:
            NSLog("SquareLineCapStyle")
        default:
            NSLog("default")
        }
        
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function025(sender: AnyObject) {
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
        theButton.action = Selector("viewAction025:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton025 = theButton    //ボタン
        self.aView025 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath setDefaultLineJoinStyle
    var aButton026 : NSButton?
    var aView026 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction026(sender : AnyObject?){
        //準備
        let aButton = aButton026
        let aView   = aView026
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        
        //NSBezierPath.setDefaultLineCapStyle(.ButtLineCapStyle)
        //NSBezierPath.setDefaultLineCapStyle(.RoundLineCapStyle)
        NSBezierPath.setDefaultLineCapStyle(.SquareLineCapStyle)
        
        //ここ
        NSBezierPath.setDefaultLineJoinStyle( .MiterLineJoinStyle)
        //NSBezierPath.setDefaultLineJoinStyle( .RoundLineJoinStyle)
        //NSBezierPath.setDefaultLineJoinStyle( .BevelLineJoinStyle)

        NSColor.magentaColor().setStroke()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 95.00,y: 90.00))
        //線を引く
        aBezier.lineToPoint(CGPoint(x: 185.00,y: 90.00))
        aBezier.lineToPoint(CGPoint(x: 130.00,y: 150.00))
        
        //SquareLineCapStyleで描画
        aBezier.lineWidth = 40.0
        aBezier.stroke()
        
        
        //ガイド
        aBezier.appendBezierPathWithOvalInRect(NSMakeRect(185-50.0, 90.0-50.0, 100.0, 100.0))
        aBezier.lineWidth = 2.0
        NSColor.redColor().setStroke()
        aBezier.stroke()
        //ビューからフォーカスを外す
        aView?.unlockFocus()

        switch (NSBezierPath.defaultLineJoinStyle() ){
        case .MiterLineJoinStyle:
            NSLog("MiterLineJoinStyle")
        case .RoundLineJoinStyle:
            NSLog("RoundLineJoinStyle")
        case .BevelLineJoinStyle:
            NSLog("BevelLineJoinStyle")
        default:
            NSLog("default")
        }
        
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function026(sender: AnyObject) {
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
        theButton.action = Selector("viewAction026:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton026 = theButton    //ボタン
        self.aView026 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath　lineJoinStyle
    var aButton027 : NSButton?
    var aView027 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction027(sender : AnyObject?){
        //準備
        let aButton = aButton027
        let aView   = aView027
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
    
        NSBezierPath.setDefaultLineJoinStyle( .MiterLineJoinStyle)
        //NSBezierPath.setDefaultLineJoinStyle( .RoundLineJoinStyle)
        //NSBezierPath.setDefaultLineJoinStyle( .BevelLineJoinStyle)
        
        
        NSColor.magentaColor().setStroke()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 95.00,y: 90.00))
        //線を引く
        aBezier.lineToPoint(CGPoint(x: 185.00,y: 90.00))
        aBezier.lineToPoint(CGPoint(x: 130.00,y: 150.00))
        //ここ（線を引く前に線の設定をする）
        aBezier.lineJoinStyle = NSLineJoinStyle.RoundLineJoinStyle
        aBezier.lineWidth = 40.0
        aBezier.stroke()
        

        //ガイド
        aBezier.appendBezierPathWithOvalInRect(NSMakeRect(185-50.0, 90.0-50.0, 100.0, 100.0))
        aBezier.lineWidth = 2.0
        NSColor.redColor().setStroke()
        aBezier.stroke()
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        
        switch (aBezier.lineJoinStyle ){
        case .MiterLineJoinStyle:
            NSLog("MiterLineJoinStyle")
        case .RoundLineJoinStyle:
            NSLog("RoundLineJoinStyle")
        case .BevelLineJoinStyle:
            NSLog("BevelLineJoinStyle")
        default:
            NSLog("default")
        }
        
        //NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function027(sender: AnyObject) {
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
        theButton.action = Selector("viewAction027:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton027 = theButton    //ボタン
        self.aView027 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath setDefaultLineWidth
    //NSBezierPath defaultLineWidth
    
    var aButton028 : NSButton?
    var aView028 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction028(sender : AnyObject?){
        //準備
        let aButton = aButton028
        let aView   = aView028
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
        
        //ここ
        NSBezierPath.setDefaultLineWidth(10.0)
        NSLog("defaultLineWidth %f", Float(NSBezierPath.defaultLineWidth()))
        
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
        //aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        //NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function028(sender: AnyObject) {
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
        theButton.action = Selector("viewAction028:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton028 = theButton    //ボタン
        self.aView028 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath
    var aButton029 : NSButton?
    var aView029 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func anAction029(sender : AnyObject?){
        NSLog("!!!")
    }
    @IBAction func function029(sender: AnyObject) {
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
        theButton.action = Selector("viewAction029:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : TestView029 = TestView029(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton029 = theButton    //ボタン
        self.aView029 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        //NSLog("%@", aView040.layer.description!)
    }
    
    //NSBezierPath flatness
    var aButton030 : NSButton?
    var aView030 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction030(sender : AnyObject?){
        //準備
        let aButton = aButton030
        let aView   = aView030
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
        NSLog("flatness %f",Float(aBezier.flatness) )
        
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function030(sender: AnyObject) {
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
        theButton.action = Selector("viewAction030:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton030 = theButton    //ボタン
        self.aView030 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath　setLineDash
    var aButton031 : NSButton?
    var aView031 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction031(sender : AnyObject?){
        //準備
        let aButton = aButton031
        let aView   = aView031
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
        
        //線の設定
        var lineDashArray : [CGFloat] = [0.0,0.0,0.0,0.0]
        lineDashArray[0] = 18.0 //塗る
        lineDashArray[1] = 13.0 //塗らない
        lineDashArray[2] = 20.0 //塗る
        lineDashArray[3] = 13.0 //塗らない
        
        //もちろんこれでもよい
        //let lineDashArray : [CGFloat] = [18.0,13.0,20.0,13.0]
        
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
        
        aBezier.setLineDash(lineDashArray, count: 4, phase: CGFloat(0.0))
            
        aBezier.fill()
        aBezier.lineWidth = 20.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
        
        var resultLineDashArray : [CGFloat] = []
        var resultCount : Int = 0
        var resultPhase : CGFloat = 0.0
        aBezier.getLineDash(&resultLineDashArray, count: &resultCount, phase: &resultPhase)
// MARK: - FIX　値が入ってこない
        NSLog("Count %d Phase=%.2f %@",resultCount,Float(resultPhase),resultLineDashArray.description)
        for (index, value) in enumerate(resultLineDashArray) {
            println("index: \(index), value: \(value)")
        }
//        for (var i = 0; i<resultCount; i++){
//            NSLog("%d LineDash=%.2f",i,resultLineDashArray[1])
//        }
        
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function031(sender: AnyObject) {
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
        theButton.action = Selector("viewAction031:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton031 = theButton    //ボタン
        self.aView031 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath fillRect()
    //NSBezierPath strokeRect()
    var aButton032 : NSButton?
    var aView032 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction032(sender : AnyObject?){
        //準備
        let aButton = aButton032
        let aView   = aView032
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 200.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
    
        NSBezierPath.fillRect(CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0))
        NSBezierPath.strokeRect(CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0))
        //ビューからフォーカスを外す
        aView?.unlockFocus()
    }
    @IBAction func function032(sender: AnyObject) {
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
        theButton.action = Selector("viewAction032:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton032 = theButton    //ボタン
        self.aView032 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath strokeLineFromPoint
    var aButton033 : NSButton?
    var aView033 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction033(sender : AnyObject?){
        //準備
        let aButton = aButton033
        let aView   = aView033
        var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 200.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        
        NSBezierPath.strokeLineFromPoint(CGPoint(x: 50.0,y: 50.0),
            toPoint:CGPoint(x: 200.0,y: 150.0))
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
    }
    @IBAction func function033(sender: AnyObject) {
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
        theButton.action = Selector("viewAction033:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton033 = theButton    //ボタン
        self.aView033 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
// MARK: NSBezierPath addClip
    var aButton034 : NSButton?
    var aView034 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction034(sender : AnyObject?){
        //準備
        let aButton = aButton034
        let aView   = aView034
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
        
        let myFont : NSFont = NSFont(name: "HiraMaruPro-W4", size: 69.0)!
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        var aGlyphs : [NSGlyph] = [myFont.glyphWithName("gid1800"),myFont.glyphWithName("gid1801")]
        
        aBezier.moveToPoint(CGPoint(x: 100.0,y: 75.0))
        aBezier.appendBezierPathWithGlyphs( &aGlyphs , count: 2, inFont: myFont)
        
        //NSBezierPath.clipRect(CGRect(x: 50,y: 30,width: 80,height: 80))
        let cBezier : NSBezierPath = NSBezierPath()
       cBezier.appendBezierPathWithOvalInRect(CGRect(x: 80,y: 80,width: 120,height: 120))
        cBezier.addClip()
        
        aBezier.fill()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function034(sender: AnyObject) {
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
        theButton.action = Selector("viewAction034:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton034 = theButton    //ボタン
        self.aView034 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath
    var aButton035 : NSButton?
    var aView035 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func anAction035(sender : AnyObject?){
        NSLog("!!!")
    }
    @IBAction func function035(sender: AnyObject) {
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
        theButton.action = Selector("viewAction035:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : TestView035 = TestView035(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton035 = theButton    //ボタン
        self.aView035 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        

    }
// MARK: NSBezierPath clipRect
    var aButton036 : NSButton?
    var aView036 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction036(sender : AnyObject?){
        //準備
        let aButton = aButton036
        let aView   = aView036
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
        
        let myFont : NSFont = NSFont(name: "HiraMaruPro-W4", size: 69.0)!
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        var aGlyphs : [NSGlyph] = [myFont.glyphWithName("gid1800"),myFont.glyphWithName("gid1801")]
        
        aBezier.moveToPoint(CGPoint(x: 100.0,y: 75.0))
        aBezier.appendBezierPathWithGlyphs( &aGlyphs , count: 2, inFont: myFont)
        
        NSBezierPath.clipRect(CGRect(x: 50,y: 30,width: 80,height: 80))
        
        aBezier.fill()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function036(sender: AnyObject) {
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
        theButton.action = Selector("viewAction036:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton036 = theButton    //ボタン
        self.aView036 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath
    var aButton037 : NSButton?
    var aView037 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func anAction037(sender : AnyObject?){
        NSLog("!!!")
    }
    @IBAction func function037(sender: AnyObject) {
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
        theButton.action = Selector("viewAction035:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : TestView037 = TestView037(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton037 = theButton    //ボタン
        self.aView037 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath
    var aButton038 : NSButton?
    var aView038 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func anAction038(sender : AnyObject?){
        NSLog("!!!")
    }
    @IBAction func function038(sender: AnyObject) {
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
        theButton.action = Selector("viewAction038:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : TestView038 = TestView038(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton038 = theButton    //ボタン
        self.aView038 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath
    @IBAction func function039(sender: AnyObject) {
    }
    //NSBezierPath
    var aButton040 : NSButton?
    var aView040 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func anAction040(sender : AnyObject?){
            NSLog("!!!")
    }
    func viewAction040(sender : AnyObject?){
        //準備
        let aButton = aButton040
        let aView   = aView040
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

    @IBAction func function040(sender: AnyObject) {
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
        theButton.action = Selector("viewAction040:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : TestView040 = TestView040(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton040 = theButton    //ボタン
        self.aView040 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        //NSLog("%@", aView040.layer.description!)
        
    }

    //NSBezierPath
    var aButton041 : NSButton?
    var aView041 : NSView?
    @IBAction func function041(sender: AnyObject) {
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
//        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
//        theButton.title = "Action"
//        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
//        theButton.action = Selector("viewAction040:")
//        theButton.target = self
        
//       aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : TestView041 = TestView041(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        theView.layer?.delegate = theView
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
//        self.aButton041 = theButton    //ボタン
        self.aView041 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        //NSLog("%@", aView040.layer.description!)
    }

    //NSBezierPath
    var aButton042 : NSButton?
    var aView042 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction042(sender : AnyObject?){
        //準備
        let aButton = aButton042
        let aView   = aView042
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
        
        var affine : NSAffineTransform = NSAffineTransform()
        affine.scaleXBy(1.0, yBy: 0.5)
        aBezier.transformUsingAffineTransform(affine)

        
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    //実験用ウインドウ作成、実験用ビュー、実行ボタンを作成してウインドウに貼り付けるところまで
    @IBAction func function042(sender: AnyObject) {
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
        theButton.action = Selector("viewAction042:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton042 = theButton    //ボタン
        self.aView042 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSBezierPath
    @IBAction func function043(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function044(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function045(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function046(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function047(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function048(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function049(sender: AnyObject) {
    }
    //NSBezierPath
    @IBAction func function050(sender: AnyObject) {
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

