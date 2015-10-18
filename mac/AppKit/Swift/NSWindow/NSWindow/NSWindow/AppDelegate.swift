//
//  AppDelegate.swift
//  NSWindow
//
//  Created by air on 2015/02/08.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//  Swift2.0 2015/10/17

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate,NSWindowDelegate {

    @IBOutlet weak var window: NSWindow!
    

    @IBOutlet weak var thePanel: MyPanel!
    var windowArray : NSMutableArray = []
    
    
    //NSWindow initWithContentRect:styleMask:backing:defer
    //ウインドウの初期化
    //Swift2.0
    @IBAction func function001(sender: AnyObject) {
        let window : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
        
    }
    
    //NSWindow initWithContentRect:styleMask:backing:defer:screen
    //ウインドウの初期化
    //Swift2.0
    @IBAction func function002(sender: AnyObject) {
        let window : NSWindow
            = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow styleMask
    //スタイルマスク
    //Swift2.0
    @IBAction func function003(sender: AnyObject) {
        let window : NSWindow = NSWindow(
            contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                        NSClosableWindowMask |
                        NSMiniaturizableWindowMask |
                        NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false)
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
        //let flag5 = (window.styleMask & 0b010000) >> 4
        //let flag4 = (window.styleMask & 0b001000) >> 3 //NSResizableWindowMask
        //let flag3 = (window.styleMask & 0b000100) >> 2 //NSMiniaturizableWindowMask
        //let flag2 = (window.styleMask & 0b000010) >> 1 //NSClosableWindowMask
        //let flag1 = (window.styleMask & 0b000001)        //NSTitledWindowMask
        if ((window.styleMask & 0b000001)>0){
            NSLog("NSTitledWindowMask")
        }
        if (((window.styleMask & 0b000010) >> 1)>0){
            NSLog("NSClosableWindowMask")
        }
        if (((window.styleMask & 0b000100) >> 2)>0){
            NSLog("NSMiniaturizableWindowMask")
        }
        if (((window.styleMask & 0b001000) >> 3)>0){
            NSLog("NSResizableWindowMask")
        }
        
       
        
    }
    //NSWindow toggleFullScreen
    //フルスクリーンのトグル
    //Swift2.0
    @IBAction func function004(sender: AnyObject) {
        window.collectionBehavior = NSWindowCollectionBehavior.FullScreenPrimary
        window.toggleFullScreen(self)
    }
    
    //NSWindow worksWhenModal
    //windowがモーダルでも、panelに文字入力ができる
    //サブクラスのworksWhenModal() で trueを返しているから
    //Swift2.0
    func abortTimer(timer:NSTimer!) {
        NSLog("abort modal")
        let anApplication = NSApplication.sharedApplication()
        let p :MyPanel = timer.userInfo?.objectForKey("panel") as! MyPanel
        if (p.worksWhenModal){
            NSLog("panel worksWhenModal YES")
        }else{
            NSLog("panel worksWhenModal NO")
        }
        NSLog("%@",p.title)
        p.orderOut(self)
        
        //modal stop
        anApplication.abortModal()
    }
    @IBAction func function005(sender: AnyObject) {
        
        let panel : MyPanel = MyPanel(
            contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false)
        windowArray.addObject(panel) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        panel.center()//ウインドウをスクリーンの中心に
        panel.title = "ウインドウタイトル"//タイトル設定
        //text field
        let textField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        panel.contentView!.addSubview(textField)
        panel.orderFront(self)//前面に
        //タイマー
        let timer = NSTimer.scheduledTimerWithTimeInterval(30.0, target: self, selector: Selector("abortTimer:"), userInfo: ["panel":panel], repeats: false)
        
        //タイマー、モーダルに入るとタイマーが動かなくなるので、ランループに追加する
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)


        
        
        //let anApplication = NSApplication.sharedApplication()
        //モーダル開始
        //var result:NSModalResponse = anApplication.runModalForWindow(window)
        

    }
    
    //NSWindow alphaValue
    //アルファ値（不透明度）
    //Swift2.0
    @IBAction func function006(sender: AnyObject) {
        let window : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window.alphaValue = 0.5
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
    }
    
    //NSWindow　backgroundColor
    //背景色
    //Swift2.0
    @IBAction func function007(sender: AnyObject) {
        let window : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window.backgroundColor = NSColor.redColor()
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow colorSpace
    @IBAction func function008(sender: AnyObject) {
        let theColor : NSColor = NSColor(deviceRed: 0.5, green: 1.0, blue: 0.9, alpha: 1.0)
        let window1 : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window1.colorSpace = NSColorSpace.adobeRGB1998ColorSpace()
        window1.backgroundColor = theColor
        
        window1.center()//ウインドウをスクリーンの中心に
        window1.title = "ウインドウタイトル1"//タイトル設定
        window1.orderFront(self)//前面に
        window1.makeKeyAndOrderFront(self)//表示
        let window2 : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window2) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window2.colorSpace = NSColorSpace.deviceRGBColorSpace()
        window2.backgroundColor = theColor
        window2.center()//ウインドウをスクリーンの中心に
        window2.title = "ウインドウタイトル2"//タイトル設定
        window2.orderFront(self)//前面に
        window2.makeKeyAndOrderFront(self)//表示
        NSLog("%@",windowArray.description)
    }
    //NSWindow contentView
    @IBAction func function009(sender: AnyObject) {
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
        aWindow.title = "ウインドウタイトル"//タイトル設定
        //text field
        let textField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        aWindow.contentView!.addSubview(textField)
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow canHide
    //Swift1.2
    func buttonAction010(sender: AnyObject){
        let theWindow : NSWindow = (sender as! NSButton).window!
        //let anApplication = NSApplication.sharedApplication()
        if (theWindow.canHide){
            NSLog("can hide")
            theWindow.canHide = false
            theWindow.title = "Hideしたときに表示される"
        }else{
            NSLog("can't hide")
            theWindow.canHide = true
            theWindow.title = "Hideしたときに表示されない"
        }
    }
    @IBAction func function010(sender: AnyObject) {
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
        aWindow.title = "Hideしたときに表示されない"//タイトル設定
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction010:")
        aWindow.contentView!.addSubview(theButton)
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        
    }
    //NSWindow hidesOnDeactivate
    @IBAction func function011(sender: AnyObject) {
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
        if (aWindow.hidesOnDeactivate){
            aWindow.title = "NSWindow YES"
        }else{
            aWindow.title = "NSWindow NO"
        }
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        let aPanel : NSPanel
        = NSPanel(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aPanel) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aPanel.center()//ウインドウをスクリーンの中心に
        if (aPanel.hidesOnDeactivate){
            aPanel.title = "NSPanel YES"
        }else{
            aPanel.title = "NSPanel NO"
        }
        aPanel.orderFront(self)//前面に
        aPanel.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow collectionBehavior
    //Swift1.2
    func buttonAction012(sender: AnyObject){
        let theWindow : NSWindow = (sender as! NSButton).window!
        theWindow.toggleFullScreen(self)
    }
    @IBAction func function012(sender: AnyObject) {
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
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction012:")
        aWindow.contentView!.addSubview(theButton)
        aWindow.collectionBehavior = NSWindowCollectionBehavior.FullScreenPrimary
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow opaque
    @IBAction func function013(sender: AnyObject) {
        let window : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        window.alphaValue = 0.5
        //window.opaque = false //透明にする
        window.opaque = true //透明にしない
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow　hasShadow
    @IBAction func function014(sender: AnyObject) {
        let window : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        window.hasShadow = false //影をなくす
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow invalidateShadow
    //調査中
    @IBAction func function015(sender: AnyObject) {
        let aWindow : TransPanel
        = TransPanel(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSBorderlessWindowMask,
                //| NSMiniaturizableWindowMask
                //| NSClosableWindowMask,
            
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.backgroundColor = NSColor.clearColor()
        aWindow.level = 1000
        aWindow.opaque = false
        
        let theView : NSImageView = NSImageView(frame: NSMakeRect(0.0, 0.0, 300.0, 200.0))
        theView.image = NSImage(named: "IMG_6698")!
        aWindow.contentView!.addSubview(theView)
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    //NSWindow　autorecalculatesContentBorderThicknessForEdge
    //NSWindow　setAutorecalculatesContentBorderThickness
    @IBAction func function016(sender: AnyObject) {
        let aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSTexturedBackgroundWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        if( aWindow.autorecalculatesContentBorderThicknessForEdge(NSRectEdge.MaxY) ){
            NSLog("YES")
        }else{
            NSLog("NO")
        }
        let theButton : NSButton = NSButton(frame: NSMakeRect(0.0, 70.0, 300.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction010:")
        aWindow.contentView!.addSubview(theButton)
     
        
        aWindow.setAutorecalculatesContentBorderThickness(false , forEdge: NSRectEdge.MaxY)
        aWindow.setAutorecalculatesContentBorderThickness(false , forEdge: NSRectEdge.MinY)
        aWindow.setContentBorderThickness(0.0 , forEdge: NSRectEdge.MaxY)
        aWindow.setContentBorderThickness(60.0 , forEdge: NSRectEdge.MinY)
        
        
    }
    //NSWindow
    @IBAction func function017(sender: AnyObject) {
        let aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask
                | NSTexturedBackgroundWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        let theButton : NSButton = NSButton(frame: NSMakeRect(0.0, 0.0, 300.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction010:")
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.setContentBorderThickness(10.0, forEdge: NSRectEdge.MaxY)
        //NSLog("Border %f",aWindow.contentBorderThicknessForEdge(NSMinXEdge))

        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

        
        
    }
    //NSWindow delegate
    @IBAction func function018(sender: AnyObject) {
        let aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask
                | NSTexturedBackgroundWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.delegate = self
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow　preventsApplicationTerminationWhenModal
    //Swift1.2
    func abortTimer019(timer:NSTimer!) {
        NSLog("abort modal")
        let anApplication = NSApplication.sharedApplication()
        let p :MyPanel = timer.userInfo?.objectForKey("panel") as! MyPanel
        if (p.worksWhenModal){
            NSLog("panel worksWhenModal YES")
        }else{
            NSLog("panel worksWhenModal NO")
        }
        NSLog("%@",p.title)
        p.orderOut(self)
        
        //modal stop
        anApplication.abortModal()
    }
    @IBAction func function019(sender: AnyObject) {
        let panel : MyPanel = MyPanel(
            contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false)
        windowArray.addObject(panel) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        panel.preventsApplicationTerminationWhenModal = true //終了できない
        //panel.preventsApplicationTerminationWhenModal = false //終了できる
        
        panel.center()//ウインドウをスクリーンの中心に
        panel.title = "ウインドウタイトル"//タイトル設定
        //text field
        let textField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        panel.contentView!.addSubview(textField)
        panel.orderFront(self)//前面に
        //タイマー
        let timer = NSTimer.scheduledTimerWithTimeInterval(30.0, target: self, selector: Selector("abortTimer019:"), userInfo: ["panel":panel], repeats: false)
        
        //タイマー、モーダルに入るとタイマーが動かなくなるので、ランループに追加する
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
        
        let anApplication = NSApplication.sharedApplication()
        //モーダル開始
        let result:NSModalResponse = anApplication.runModalForWindow(panel)
        
        switch result {
        case 1:
            NSLog("1")
        default:
            NSLog("default")
        }
        
    }
    //NSWindow defaultDepthLimit
    @IBAction func function020(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        let windowDepthLimit : NSWindowDepth = NSWindow.defaultDepthLimit()
        
        NSLog("%d",windowDepthLimit)
        if ((windowDepthLimit & 0b000000001)>0){
            NSLog("0b000000001")
        }
        if (((windowDepthLimit & 0b000000010) >> 1)>0){
            NSLog("0b000000010")
        }
        if (((windowDepthLimit & 0b000000100) >> 2)>0){
            NSLog("0b000000100")
        }
        if (((windowDepthLimit & 0b000001000) >> 3)>0){
            NSLog("0b000001000")
        }
        if (((windowDepthLimit & 0b000010000) >> 4)>0){
            NSLog("0b000010000")
        }
        if (((windowDepthLimit & 0b000100000) >> 5)>0){
            NSLog("0b000100000")
        }
        if (((windowDepthLimit & 0b001000000) >> 6)>0){
            NSLog("0b001000000")
        }
        if (((windowDepthLimit & 0b010000000) >> 7)>0){
            NSLog("0b010000000")
        }
        if (((windowDepthLimit & 0b100000000) >> 8)>0){
            NSLog("0b100000000")
        }
        if (((windowDepthLimit & 0b1000000000) >> 9)>0){
            NSLog("0b1000000000")
        }
        if (NSPlanarFromDepth(windowDepthLimit)){
            NSLog("NSPlanarFromDepth YES")
        }else{
            NSLog("NSPlanarFromDepth NO")
        }
        //NSPlanarFromDepth NO
        NSLog("name = %@",NSColorSpaceFromDepth(windowDepthLimit)!)
        //name = NSCalibratedRGBColorSpace
        NSLog("ビット/サンプル = %d",NSBitsPerSampleFromDepth(windowDepthLimit))
        //ビット/サンプル = 8
    }
    
    //NSWindow windowNumber
    @IBAction func function021(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        let windowNumber : Int = aWindow.windowNumber
        NSLog("windowNumber = %d", windowNumber)
        //-> windowNumber = 2736
    }
    
    //NSWindow windowNumbersWithOptions
    @IBAction func function022(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        let windowNumbers : [AnyObject] = NSWindow.windowNumbersWithOptions( NSWindowNumberListAllSpaces | NSWindowNumberListAllApplications as NSWindowNumberListOptions )!
        for value in windowNumbers {
            //NSLog("windowNumber = %@", value.description)
            NSLog("windowNumber = %d", (value.integerValue))
        }
        
    }
    
    //NSWindow gState
    @IBAction func function023(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

        NSLog("gState = %d", (aWindow.gState() ))
        
    }
    
    //NSWindow deviceDescription
    @IBAction func function024(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        let deviceDesc : [NSObject:AnyObject] = aWindow.deviceDescription
        
        if let aSize: AnyObject = deviceDesc["NSDeviceResolution"] {
            NSLog("Size = %@", aSize.description )
            let size : NSSize = aSize.sizeValue as NSSize
            NSLog("Size = %f", Float(size.width),Float(size.height) )
        }
        
        
        
    }
    
    //NSWindow canBecomeVisibleWithoutLogin
    @IBAction func function025(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        aWindow.canBecomeVisibleWithoutLogin = true
        if (aWindow.canBecomeVisibleWithoutLogin){
             NSLog("canBecomeVisibleWithoutLogin = true")
        }else{
             NSLog("canBecomeVisibleWithoutLogin = false")
        }
        
    }
    
    //NSWindow sharingType
    @IBAction func function026(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        switch (aWindow.sharingType){
        case NSWindowSharingType.None:
                NSLog("None")
        case .ReadOnly:
                NSLog("readnly")
        case .ReadWrite:
                NSLog("read write")

        }
    }
    
    //NSWindow backingType
    @IBAction func function027(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        switch (aWindow.backingType){
        case NSBackingStoreType.Retained:
            NSLog("Retained")
        case .Nonretained:
            NSLog("Nonretained")
        case .Buffered:
            NSLog("Buffered")
        //default:
          //  NSLog("None")
        }
        
    }
    
    //NSWindow　backingLocation
    @IBAction func function028(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

        switch (aWindow.backingLocation){
        case NSWindowBackingLocation.Default:
            NSLog("Default")    //OSが決定
        case .VideoMemory:
            NSLog("VideoMemory")//ビデオメモリ
        case .MainMemory:
            NSLog("MainMemory") //メインメモリ
        //default:
          //  NSLog("None")
        }

    }
    
    //NSWindow preferredBackingLocation
    @IBAction func function029(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        switch (aWindow.preferredBackingLocation){
        case NSWindowBackingLocation.Default:
            NSLog("Default")    //OSが決定
        case .VideoMemory:
            NSLog("VideoMemory")//ビデオメモリ
        case .MainMemory:
            NSLog("MainMemory") //メインメモリ
        //default:
          //  NSLog("None")
        }
    }
    
    //NSWindow oneShot
    @IBAction func function030(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        aWindow.oneShot = true
        if (aWindow.oneShot){
            NSLog("One shot YES")
        }else{
            NSLog("One shot NO")
        }
    }
    //NSWindow depthLimit
    @IBAction func function031(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        let windowDepthLimit : NSWindowDepth = aWindow.depthLimit
        
        if (NSPlanarFromDepth(windowDepthLimit)){
            NSLog("NSPlanarFromDepth YES")
        }else{
            NSLog("NSPlanarFromDepth NO")
        }
        //NSPlanarFromDepth NO
        NSLog("name = %@",NSColorSpaceFromDepth(windowDepthLimit)!)
        //name = NSCalibratedBlackColorSpace
        NSLog("ビット/サンプル = %d",NSBitsPerSampleFromDepth(windowDepthLimit))
        //ビット/サンプル = 0
    }
    //NSWindow hasDynamicDepthLimit
    @IBAction func function032(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

        if (aWindow.hasDynamicDepthLimit){
            NSLog("hasDynamicDepthLimit YES")
        }else{
            NSLog("hasDynamicDepthLimit NO")
        }
        //->hasDynamicDepthLimit NO
    }
    //NSWindow setDynamicDepthLimit
    @IBAction func function033(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        if (aWindow.hasDynamicDepthLimit){
            NSLog("hasDynamicDepthLimit YES")
        }else{
            NSLog("hasDynamicDepthLimit NO")
        }
        //->hasDynamicDepthLimit YES
    }
    //NSWindow contentRectForFrameRect
    @IBAction func function034(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        let windowRect : NSRect = aWindow.contentRectForFrameRect(NSMakeRect(0.0, 0.0, 100.0, 100.0))
        NSLog("windowRect %.2f,%.2f,%.2f,%.2f",
            Float(windowRect.origin.x),
            Float(windowRect.origin.y),
            Float(windowRect.size.width),
            Float(windowRect.size.height))
        
    }
    //NSWindow contentRectForFrameRect:styleMask:
    @IBAction func function035(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        let windowRect : NSRect =
                NSWindow.contentRectForFrameRect(
                    NSMakeRect(0.0, 0.0, 300.0, 200.0),
                        styleMask: NSTitledWindowMask |
                            NSClosableWindowMask |
                            NSMiniaturizableWindowMask |
                            NSResizableWindowMask)
        NSLog("windowRect %.1f,%.1f,%.1f,%.1f",Float(windowRect.origin.x) ,
            Float(windowRect.origin.y),
            Float(windowRect.size.width),
            Float(windowRect.size.height)
        )
        //->windowRect 0.0,0.0,300.0,178.0
        
    }
    //NSWindow　frameRectForContentRect
    @IBAction func function036(sender: AnyObject) {
        let windowRect : NSRect =
        NSWindow.frameRectForContentRect(
            NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask)
        NSLog("windowRect %.1f,%.1f,%.1f,%.1f",Float(windowRect.origin.x) ,
            Float(windowRect.origin.y),
            Float(windowRect.size.width),
            Float(windowRect.size.height)
        )
        //->windowRect 0.0,0.0,300.0,222.0
        let aWindow : NSWindow = NSWindow(contentRect: windowRect, styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow minFrameWidthWithTitle:styleMask:
    @IBAction func function037(sender: AnyObject) {
        let windowTitle : String = "ウインドウタイトル"
        let windowRectWidth : CGFloat =
        NSWindow.minFrameWidthWithTitle(
            windowTitle,
            styleMask: NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask)
        NSLog("windowRectWidth %.1f",Float(windowRectWidth)
        )
        //->windowRectWidth 194.0
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, windowRectWidth, 200.0), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = windowTitle//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow contentRectForFrameRect
    @IBAction func function038(sender: AnyObject) {
        let windowRect : NSRect = NSMakeRect(100.0, 0.0, 300.0, 200.0)
        NSLog("windowRect %.2f,%.2f,%.2f,%.2f",
            Float(windowRect.origin.x),
            Float(windowRect.origin.y),
            Float(windowRect.size.width),
            Float(windowRect.size.height))
        //->100.00,0.00,300.00,200.00
        let aWindow : NSWindow = NSWindow(contentRect: windowRect, styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        let contentRect : NSRect = aWindow.contentRectForFrameRect(windowRect)
        NSLog("contentRect %.2f,%.2f,%.2f,%.2f",
            Float(contentRect.origin.x),
            Float(contentRect.origin.y),
            Float(contentRect.size.width),
            Float(contentRect.size.height))
        //->100.00,0.00,300.00,178.00
    }
    //NSWindow frameRectForContentRect
    @IBAction func function039(sender: AnyObject) {
        
        let windowRect : NSRect = NSMakeRect(100.0, 0.0, 300.0, 200.0)
        NSLog("windowRect %.2f,%.2f,%.2f,%.2f",
            Float(windowRect.origin.x),
            Float(windowRect.origin.y),
            Float(windowRect.size.width),
            Float(windowRect.size.height))
        //->100.00,0.00,300.00,200.00
        let aWindow : NSWindow = NSWindow(contentRect: windowRect, styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        let frameRect : NSRect = aWindow.frameRectForContentRect(windowRect)
        NSLog("frameRect %.2f,%.2f,%.2f,%.2f",
            Float(frameRect.origin.x),
            Float(frameRect.origin.y),
            Float(frameRect.size.width),
            Float(frameRect.size.height))
        //->100.00,0.00,300.00,222.00


    }
    //NSWindow drawers
    //引き出し
    //Swift2.0
    var theDrawer040 : NSDrawer = NSDrawer(contentSize: NSMakeSize(100.0, 100.0),
        preferredEdge: NSRectEdge.MaxX)
    //preferredEdge MinY=下、MinX=左、3=上、MaxX=右
    func buttonAction040(sender: AnyObject){
        
        let theWindow : NSWindow = (sender as! NSButton).window!
        
        if ((theWindow.drawers) != nil){
        NSLog("%@", theWindow.drawers!.description)
        }
        //drawerを表示／非表示
        theDrawer040.toggle(theWindow)

    }
    @IBAction func function040(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Toggle"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction040:")
        aWindow.contentView!.addSubview(theButton)
        
        //引き出しのウインドウを設定
        theDrawer040.parentWindow = aWindow
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow setWindowController: 
    //調査中
    func buttonAction041(sender: AnyObject){
        
        //TestWindow.xibからウインドウコントローラーを作成
        let windowController : NSWindowController = NSWindowController(windowNibName: "TestWindow")
        //ウインドウをロード
        windowController.loadWindow()
        //表示
        windowController.showWindow(self)

    }
    @IBAction func function041(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Toggle"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction041:")
        aWindow.contentView!.addSubview(theButton)
        
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSWindow beginSheet:completionHandler:
    //NSWindow attachedSheet
    //NSWindow endSheet:returnCode:
    //NSWindow sheetParent
    //Swift1.2
    func buttonAction042_2(sender: AnyObject){
        //シートの親ウインドウ
        let parentWindow : NSWindow = (sender as! NSButton).window!.sheetParent!
        
        if (parentWindow.attachedSheet != nil){
            NSLog("attachedSheet %@", parentWindow.attachedSheet!)
            //->attachedSheet <NSWindow: 0x6080001e0900>
        }
        //シートの親ウインドウに対して、シートの終了
        parentWindow.endSheet((sender as! NSButton).window!, returnCode: NSModalResponseStop )
//            NSModalResponseStop                 = (-1000),
//            NSModalResponseAbort                = (-1001),
//            NSModalResponseContinue             = (-1002),
        
        
    }
    func buttonAction042(sender: AnyObject){
        
        let theWindow : NSWindow = (sender as! NSButton).window!
        let sheetWindow : NSWindow = NSWindow(
            contentRect: NSMakeRect(0.0, 0.0, 200, 150),
            styleMask: NSBorderlessWindowMask,
            backing: .Buffered,
            `defer`: false)
        sheetWindow.backgroundColor = NSColor.redColor()
        //ボタンを作成
        let sheetButton : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 80.0, 30.0))
        sheetButton.title = "Close"
        sheetButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        sheetButton.action = Selector("buttonAction042_2:")
        sheetWindow.contentView!.addSubview(sheetButton)
        
        theWindow.beginSheet(sheetWindow, completionHandler:{responseCode  in
                if (responseCode == NSModalResponseStop) {
                    NSLog("NSModalResponseStop")
                }else{
                    NSLog("Other")
                }
            })

    }
    @IBAction func function042(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(
            contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask: NSTitledWindowMask |
                        NSClosableWindowMask |
                        NSMiniaturizableWindowMask |
                        NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Sheet"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction042:")
        aWindow.contentView!.addSubview(theButton)
        
        
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
     
    }
    //NSWindow beginCriticalSheet
    //NSWindow sheets
    //Swift1.2
    func buttonAction043_2(sender: AnyObject){
        //シートの親ウインドウ
        let parentWindow : NSWindow = (sender as! NSButton).window!.sheetParent!

        if (parentWindow.sheets.count > 0 ){
            for value in parentWindow.sheets {
                NSLog("sheets = %@", (value.description))
            }
        }
        
        if (parentWindow.attachedSheet != nil){
            NSLog("attachedSheet %@", parentWindow.attachedSheet!)
            //->attachedSheet <NSWindow: 0x6080001e0900>
        }
        //シートの親ウインドウに対して、シートの終了
        parentWindow.endSheet((sender as!NSButton).window!)

    }
    func buttonAction043(sender: AnyObject){
        
        let theWindow : NSWindow = (sender as! NSButton).window!
        let sheetWindow1 : NSWindow = NSWindow(
            contentRect: NSMakeRect(0.0, 0.0, 200, 150),
            styleMask: NSBorderlessWindowMask,
            backing: .Buffered,
            `defer`: false)
        sheetWindow1.backgroundColor = NSColor.blueColor()
        //ボタンを作成
        let sheetButton1 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 80.0, 30.0))
        sheetButton1.title = "Close"
        sheetButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        sheetButton1.action = Selector("buttonAction043_2:")
        sheetWindow1.contentView!.addSubview(sheetButton1)
        
        let sheetWindow2 : NSWindow = NSWindow(
            contentRect: NSMakeRect(0.0, 0.0, 200, 150),
            styleMask: NSBorderlessWindowMask,
            backing: .Buffered,
            `defer`: false)
        sheetWindow2.backgroundColor = NSColor.yellowColor()
        //ボタンを作成
        let sheetButton2 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 80.0, 30.0))
        sheetButton2.title = "Close"
        sheetButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        sheetButton2.action = Selector("buttonAction043_2:")
        sheetWindow2.contentView!.addSubview(sheetButton2)
        
        let sheetWindow3 : NSWindow = NSWindow(
            contentRect: NSMakeRect(0.0, 0.0, 150, 100),
            styleMask: NSBorderlessWindowMask,
            backing: .Buffered,
            `defer`: false)
        sheetWindow3.backgroundColor = NSColor.redColor()
        //ボタンを作成
        let sheetButton3 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 80.0, 30.0))
        sheetButton3.title = "Close"
        sheetButton3.bezelStyle = NSBezelStyle.RoundedBezelStyle
        sheetButton3.action = Selector("buttonAction043_2:")
        sheetWindow3.contentView!.addSubview(sheetButton3)
        
        let sheetWindow4 : NSWindow = NSWindow(
            contentRect: NSMakeRect(0.0, 0.0, 200, 150),
            styleMask: NSBorderlessWindowMask,
            backing: .Buffered,
            `defer`: false)
        sheetWindow4.backgroundColor = NSColor.greenColor()
        //ボタンを作成
        let sheetButton4 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 80.0, 30.0))
        sheetButton4.title = "Close"
        sheetButton4.bezelStyle = NSBezelStyle.RoundedBezelStyle
        sheetButton4.action = Selector("buttonAction043_2:")
        sheetWindow4.contentView!.addSubview(sheetButton4)
        
        theWindow.beginSheet(sheetWindow1, completionHandler:{responseCode  in
            NSLog("sheet1")
        })
        
        theWindow.beginSheet(sheetWindow4, completionHandler:{responseCode  in
            NSLog("sheet4")
        })
        
        theWindow.beginCriticalSheet(sheetWindow3, completionHandler:{responseCode  in
            NSLog("sheet3")
        })

        theWindow.beginSheet(sheetWindow2, completionHandler:{responseCode  in
            NSLog("sheet2")
        })

    }
    @IBAction func function043(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(
            contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask: NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Sheet"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction043:")
        aWindow.contentView!.addSubview(theButton)
        
        
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に

    }
    //NSWindow
    @IBAction func function044(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function045(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function046(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function047(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function048(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function049(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function050(sender: AnyObject) {
    }
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        windowArray.removeAllObjects()
    }


    func windowDidBecomeMain(notification: NSNotification) {
        NSLog("windowDidBecomeMain")
    }
}

