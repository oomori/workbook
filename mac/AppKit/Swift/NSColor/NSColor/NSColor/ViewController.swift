//
//  ViewController.swift
//  NSColor
//
//  Created by air on 2015/03/01.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    //ウインドウを保持しておくための配列
    var windowArray : NSMutableArray = []
    
    
    //NSColor greenColor
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
        theButton.title = "Color!"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction001:")
        theButton.target = self
        
        aWindow.contentView!.addSubview(theButton)
        //ビュー
        let theView : NSView = NSView(frame: NSMakeRect(0.0, 30.0, 300.0, 180.0))
                theView.wantsLayer = true
        aWindow.contentView!.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton001 = theButton    //ボタン
        self.aView001 = theView        //テストビュー

        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    // MARK: NSColor colorWithCalibratedHue:saturation:brightness:alpha:
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
        let backgroundColor = NSColor(calibratedHue: 0.9, saturation: 0.9, brightness: 0.9, alpha: 1.0)
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        aView?.unlockFocus()
        
    }
    @IBAction func function002(sender: AnyObject) {
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
        theButton.title = "Color!"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction002:")
        theButton.target = self
        
        aWindow.contentView!.addSubview(theButton)
        //ビュー
        let theView : NSView = NSView(frame: NSMakeRect(0.0, 30.0, 300.0, 180.0))
        theView.wantsLayer = true
        aWindow.contentView!.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton002 = theButton    //ボタン
        self.aView002 = theView        //テストビュー
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    // MARK: NSColor colorWithCalibratedRed:green:blue:alpha:
    //NSColor colorWithCalibratedRed:green:blue:alpha:
    var aButton003 : NSButton?
    var aView003 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction003(sender : AnyObject?){
        //準備
        //let aButton = aButton003
        let aView   = aView003
        //var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        aView?.lockFocus()
        let backgroundColor = NSColor(calibratedRed: 0.9, green: 0.2, blue: 0.5, alpha: 1.0)
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        aView?.unlockFocus()
        
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
        aWindow.title = "View アクション"//タイトル設定
        //ボタン
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 10.0, 100.0, 30.0))
        theButton.title = "Color!"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction003:")
        theButton.target = self
        
        aWindow.contentView!.addSubview(theButton)
        //ビュー
        let theView : NSView = NSView(frame: NSMakeRect(0.0, 30.0, 300.0, 180.0))
        theView.wantsLayer = true
        aWindow.contentView!.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton003 = theButton    //ボタン
        self.aView003 = theView        //テストビュー
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSColor colorWithCalibratedWhite:alpha:
    var aButton004 : NSButton?
    var aView004 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction004(sender : AnyObject?){
        //準備
        //let aButton = aButton004
        let aView   = aView004
        //var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        aView?.lockFocus()
        let backgroundColor = NSColor(calibratedWhite: 0.8, alpha: 1.0)
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        aView?.unlockFocus()
        
    }
    @IBAction func function004(sender: AnyObject) {
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
        theButton.title = "Color!"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction004:")
        theButton.target = self
        
        aWindow.contentView!.addSubview(theButton)
        //ビュー
        let theView : NSView = NSView(frame: NSMakeRect(0.0, 30.0, 300.0, 180.0))
        theView.wantsLayer = true
        aWindow.contentView!.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton004 = theButton    //ボタン
        self.aView004 = theView        //テストビュー
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    //NSColor
    //カラーのファイルを作成
    @IBAction func function005(sender: AnyObject) {
        //バンドル取得
        let nibBundle : NSBundle = NSBundle.mainBundle()
        
        //バンドルにある画像から
        let nibPath : NSString = nibBundle.pathForResource("testImage.png", ofType: nil )!
        
        //画像データを読み込み
        //NSLog("nibPath %@",nibPath )
        
        let theData : NSMutableData = NSMutableData(contentsOfFile: nibPath as String )!
        
        //オフスクリーンを作成
        let theBitmap : NSBitmapImageRep = NSBitmapImageRep(data: theData)!
        
        
        //一度TIFFデータにしてみる
        let theData2 : NSData = theBitmap.TIFFRepresentation!
        let theBitmap2 : NSBitmapImageRep = NSBitmapImageRep(data: theData2)!
        
        
        //ビットマップの加工、ここではオレンジに塗りつぶす
        for y in 0...50 {
            for x in 0...100 {
                theBitmap2.setColor(NSColor.orangeColor(), atX: x, y: y)
            }
        }
        
        let destiPath : NSString = ("~/Desktop/colorTag.png" as NSString).stringByExpandingTildeInPath
        
        theBitmap2.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: [:])?.writeToFile(destiPath as String, atomically: true)
        

    }
    //NSColor
    //colorWithGenericGamma22White:alpha:
    //http://cocoaapi.hatenablog.com/entry/Appkit/NScolor/colorWithGenericGamma22White%3Aalpha
    var aButton006 : NSButton?
    var aView006 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction006(sender : AnyObject?){
        //準備
        let aView   = aView006
        //準備ここまで
        
        aView?.lockFocus()
        let backgroundColor = NSColor(genericGamma22White: 0.6, alpha: 1.0)
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        aView?.unlockFocus()
        
    }
    @IBAction func function006(sender: AnyObject) {
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
        theButton.title = "Color!"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction006:")
        theButton.target = self
        
        aWindow.contentView!.addSubview(theButton)
        //ビュー
        let theView : NSView = NSView(frame: NSMakeRect(0.0, 30.0, 300.0, 180.0))
        theView.wantsLayer = true
        aWindow.contentView!.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton006 = theButton    //ボタン
        self.aView006 = theView        //テストビュー
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSColor
    //colorWithCatalogName:colorName:
    var aButton007 : NSButton?
    var aView007 : NSView?
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction007(sender : AnyObject?){
        //準備
        let aView   = aView007
        //準備ここまで
        
        aView?.lockFocus()
        //let backgroundColor = NSColor(catalogName: "System", colorName: "controlAlternatingRowColor")!
        let backgroundColor = NSColor(catalogName: "PANTONE", colorName: "2071")!
        
        //
        
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        aView?.unlockFocus()
        
    }
    @IBAction func function007(sender: AnyObject) {
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
        theButton.title = "Color!"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction007:")
        theButton.target = self
        
        aWindow.contentView!.addSubview(theButton)
        //ビュー
        let theView : NSView = NSView(frame: NSMakeRect(0.0, 30.0, 300.0, 180.0))
        theView.wantsLayer = true
        aWindow.contentView!.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton007 = theButton    //ボタン
        self.aView007 = theView        //テストビュー
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    //NSColor
    @IBAction func function008(sender: AnyObject) {
        
    }
    //NSColor
    @IBAction func function009(sender: AnyObject) {
        
    }
    //NSColor
    @IBAction func function010(sender: AnyObject) {
        
    }
    //NSColor
    @IBAction func function011(sender: AnyObject) {
        
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

