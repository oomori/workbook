//
//  AppDelegate.swift
//  NSWindow
//
//  Created by air on 2015/02/08.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate,NSWindowDelegate {

    @IBOutlet weak var window: NSWindow!
    

    @IBOutlet weak var thePanel: MyPanel!
    var windowArray : NSMutableArray = []
    //NSWindow initWithContentRect:styleMask:backing:defer
    @IBAction func function001(sender: AnyObject) {
        var window : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
        
    }
    //NSWindow initWithContentRect:styleMask:backing:defer:screen
    @IBAction func function002(sender: AnyObject) {
        var window : NSWindow
            = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow styleMask
    @IBAction func function003(sender: AnyObject) {
        var window : NSWindow = NSWindow(
            contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                        NSClosableWindowMask |
                        NSMiniaturizableWindowMask |
                        NSResizableWindowMask,
            backing: .Buffered,
            defer: false)
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
    @IBAction func function004(sender: AnyObject) {
        window.collectionBehavior = NSWindowCollectionBehavior.FullScreenPrimary
        window.toggleFullScreen(self)
    }
    
    //NSWindow worksWhenModal
    //windowがモーダルでも、panelに文字入力ができる
    //サブクラスのworksWhenModal() で trueを返しているから
    func abortTimer(timer:NSTimer!) {
        NSLog("abort modal")
        let anApplication = NSApplication.sharedApplication()
        var p :MyPanel = timer.userInfo?.objectForKey("panel") as MyPanel
        if (p.worksWhenModal){
            NSLog("panel worksWhenModal YES")
        }else{
            NSLog("panel worksWhenModal NO")
        }
        NSLog("%@",p.title!)
        p.orderOut(self)
        
        //modal stop
        anApplication.abortModal()
    }
    @IBAction func function005(sender: AnyObject) {
        
        var panel : MyPanel = MyPanel(
            contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing: .Buffered,
            defer: false)
        windowArray.addObject(panel) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        panel.center()//ウインドウをスクリーンの中心に
        panel.title = "ウインドウタイトル"//タイトル設定
        //text field
        var textField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        panel.contentView.addSubview(textField)
        panel.orderFront(self)//前面に
        //タイマー
        var timer = NSTimer.scheduledTimerWithTimeInterval(30.0, target: self, selector: Selector("abortTimer:"), userInfo: ["panel":panel], repeats: false)
        
        //タイマー、モーダルに入るとタイマーが動かなくなるので、ランループに追加する
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)


        
        
        let anApplication = NSApplication.sharedApplication()
        //モーダル開始
        var result:NSModalResponse = anApplication.runModalForWindow(window)
        

    }
    //NSWindow alphaValue
    @IBAction func function006(sender: AnyObject) {
        var window : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window.alphaValue = 0.5
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow　backgroundColor
    @IBAction func function007(sender: AnyObject) {
        var window : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
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
        var theColor : NSColor = NSColor(deviceRed: 0.5, green: 1.0, blue: 0.9, alpha: 1.0)
        var window1 : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(window1) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window1.colorSpace = NSColorSpace.adobeRGB1998ColorSpace()
        window1.backgroundColor = theColor
        
        window1.center()//ウインドウをスクリーンの中心に
        window1.title = "ウインドウタイトル1"//タイトル設定
        window1.orderFront(self)//前面に
        window1.makeKeyAndOrderFront(self)//表示
        var window2 : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
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
        //text field
        var textField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        aWindow.contentView.addSubview(textField)
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow canHide
    func buttonAction010(sender: AnyObject){
        var theWindow : NSWindow = (sender as NSButton).window!
        let anApplication = NSApplication.sharedApplication()
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
        aWindow.title = "Hideしたときに表示されない"//タイトル設定
        //
        var theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction010:")
        aWindow.contentView.addSubview(theButton)
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        
    }
    //NSWindow hidesOnDeactivate
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
        if (aWindow.hidesOnDeactivate){
            aWindow.title = "NSWindow YES"
        }else{
            aWindow.title = "NSWindow NO"
        }
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        var aPanel : NSPanel
        = NSPanel(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
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
    func buttonAction012(sender: AnyObject){
        var theWindow : NSWindow = (sender as NSButton).window!
        theWindow.toggleFullScreen(self)
    }
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
        //
        var theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction012:")
        aWindow.contentView.addSubview(theButton)
        aWindow.collectionBehavior = NSWindowCollectionBehavior.FullScreenPrimary
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow opaque
    @IBAction func function013(sender: AnyObject) {
        var window : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
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
        var window : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
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
        var aWindow : TransPanel
        = TransPanel(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSBorderlessWindowMask,
                //| NSMiniaturizableWindowMask
                //| NSClosableWindowMask,
            
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.backgroundColor = NSColor.clearColor()
        aWindow.level = 1000
        aWindow.opaque = false
        
        var theView : NSImageView = NSImageView(frame: NSMakeRect(0.0, 0.0, 300.0, 200.0))
        theView.image = NSImage(named: "IMG_6698")!
        aWindow.contentView.addSubview(theView)
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    //NSWindow　autorecalculatesContentBorderThicknessForEdge
    //NSWindow　setAutorecalculatesContentBorderThickness
    @IBAction func function016(sender: AnyObject) {
        var aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSTexturedBackgroundWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        if( aWindow.autorecalculatesContentBorderThicknessForEdge(NSMaxYEdge) ){
            NSLog("YES")
        }else{
            NSLog("NO")
        }
        var theButton : NSButton = NSButton(frame: NSMakeRect(0.0, 70.0, 300.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction010:")
        aWindow.contentView.addSubview(theButton)
     
        
        aWindow.setAutorecalculatesContentBorderThickness(false , forEdge: NSMaxYEdge)
        aWindow.setAutorecalculatesContentBorderThickness(false , forEdge: NSMinYEdge)
        aWindow.setContentBorderThickness(0.0 , forEdge: NSMaxYEdge)
        aWindow.setContentBorderThickness(60.0 , forEdge: NSMinYEdge)
        
        
    }
    //NSWindow
    @IBAction func function017(sender: AnyObject) {
        var aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask
                | NSTexturedBackgroundWindowMask,
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        var theButton : NSButton = NSButton(frame: NSMakeRect(0.0, 0.0, 300.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction010:")
        aWindow.contentView.addSubview(theButton)
        
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.setContentBorderThickness(10.0, forEdge: NSMaxYEdge)
        //NSLog("Border %f",aWindow.contentBorderThicknessForEdge(NSMinXEdge))

        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

        
        
    }
    //NSWindow delegate
    @IBAction func function018(sender: AnyObject) {
        var aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask
                | NSTexturedBackgroundWindowMask,
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.delegate = self
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow　preventsApplicationTerminationWhenModal
    func abortTimer019(timer:NSTimer!) {
        NSLog("abort modal")
        let anApplication = NSApplication.sharedApplication()
        var p :MyPanel = timer.userInfo?.objectForKey("panel") as MyPanel
        if (p.worksWhenModal){
            NSLog("panel worksWhenModal YES")
        }else{
            NSLog("panel worksWhenModal NO")
        }
        NSLog("%@",p.title!)
        p.orderOut(self)
        
        //modal stop
        anApplication.abortModal()
    }
    @IBAction func function019(sender: AnyObject) {
        var panel : MyPanel = MyPanel(
            contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing: .Buffered,
            defer: false)
        windowArray.addObject(panel) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        panel.preventsApplicationTerminationWhenModal = true //終了できない
        //panel.preventsApplicationTerminationWhenModal = false //終了できる
        
        panel.center()//ウインドウをスクリーンの中心に
        panel.title = "ウインドウタイトル"//タイトル設定
        //text field
        var textField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        panel.contentView.addSubview(textField)
        panel.orderFront(self)//前面に
        //タイマー
        var timer = NSTimer.scheduledTimerWithTimeInterval(30.0, target: self, selector: Selector("abortTimer019:"), userInfo: ["panel":panel], repeats: false)
        
        //タイマー、モーダルに入るとタイマーが動かなくなるので、ランループに追加する
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
        
        let anApplication = NSApplication.sharedApplication()
        //モーダル開始
        var result:NSModalResponse = anApplication.runModalForWindow(panel)
    }
    //NSWindow defaultDepthLimit
    @IBAction func function020(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        var windowDepthLimit : NSWindowDepth = NSWindow.defaultDepthLimit()
        
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
        NSLog("name = %@",NSColorSpaceFromDepth(windowDepthLimit))
        //name = NSCalibratedRGBColorSpace
        NSLog("ビット/サンプル = %d",NSBitsPerSampleFromDepth(windowDepthLimit))
        //ビット/サンプル = 8
    }
    
    //NSWindow windowNumber
    @IBAction func function021(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        var windowNumber : Int = aWindow.windowNumber
        NSLog("windowNumber = %d", windowNumber)
        //-> windowNumber = 2736
    }
    
    //NSWindow windowNumbersWithOptions
    @IBAction func function022(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

        NSLog("gState = %d", (aWindow.gState() ))
        
    }
    
    //NSWindow deviceDescription
    @IBAction func function024(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        let deviceDesc : [NSObject:AnyObject] = aWindow.deviceDescription
        
        if let aSize: AnyObject = deviceDesc["NSDeviceResolution"] {
            NSLog("Size = %@", aSize.description )
            var size : NSSize = aSize.sizeValue as NSSize
            NSLog("Size = %f", Float(size.width),Float(size.height) )
        }
        
        
        
    }
    
    //NSWindow canBecomeVisibleWithoutLogin
    @IBAction func function025(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        default:
            NSLog("None")
        }
    }
    
    //NSWindow backingType
    @IBAction func function027(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        default:
            NSLog("None")
        }
        
    }
    
    //NSWindow　backingLocation
    @IBAction func function028(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        default:
            NSLog("None")
        }

    }
    
    //NSWindow preferredBackingLocation
    @IBAction func function029(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        default:
            NSLog("None")
        }
    }
    
    //NSWindow oneShot
    @IBAction func function030(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        var windowDepthLimit : NSWindowDepth = aWindow.depthLimit
        
        if (NSPlanarFromDepth(windowDepthLimit)){
            NSLog("NSPlanarFromDepth YES")
        }else{
            NSLog("NSPlanarFromDepth NO")
        }
        //NSPlanarFromDepth NO
        NSLog("name = %@",NSColorSpaceFromDepth(windowDepthLimit))
        //name = NSCalibratedBlackColorSpace
        NSLog("ビット/サンプル = %d",NSBitsPerSampleFromDepth(windowDepthLimit))
        //ビット/サンプル = 0
    }
    //NSWindow hasDynamicDepthLimit
    @IBAction func function032(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        var windowRect : NSRect = aWindow.contentRectForFrameRect(NSMakeRect(0.0, 0.0, 100.0, 100.0))
        NSLog("windowRect %.2f,%.2f,%.2f,%.2f",
            Float(windowRect.origin.x),
            Float(windowRect.origin.y),
            Float(windowRect.size.width),
            Float(windowRect.size.height))
        
    }
    //NSWindow contentRectForFrameRect:styleMask:
    @IBAction func function035(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        var windowRect : NSRect =
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
        var windowRect : NSRect =
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
        var aWindow : NSWindow = NSWindow(contentRect: windowRect, styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
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
        var windowRectWidth : CGFloat =
        NSWindow.minFrameWidthWithTitle(
            windowTitle,
            styleMask: NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask)
        NSLog("windowRectWidth %.1f",Float(windowRectWidth)
        )
        //->windowRectWidth 194.0
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, windowRectWidth, 200.0), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = windowTitle//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow contentRectForFrameRect
    @IBAction func function038(sender: AnyObject) {
        var windowRect : NSRect = NSMakeRect(100.0, 0.0, 300.0, 200.0)
        NSLog("windowRect %.2f,%.2f,%.2f,%.2f",
            Float(windowRect.origin.x),
            Float(windowRect.origin.y),
            Float(windowRect.size.width),
            Float(windowRect.size.height))
        //->100.00,0.00,300.00,200.00
        var aWindow : NSWindow = NSWindow(contentRect: windowRect, styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        var contentRect : NSRect = aWindow.contentRectForFrameRect(windowRect)
        NSLog("contentRect %.2f,%.2f,%.2f,%.2f",
            Float(contentRect.origin.x),
            Float(contentRect.origin.y),
            Float(contentRect.size.width),
            Float(contentRect.size.height))
        //->100.00,0.00,300.00,178.00
    }
    //NSWindow frameRectForContentRect
    @IBAction func function039(sender: AnyObject) {
        
        var windowRect : NSRect = NSMakeRect(100.0, 0.0, 300.0, 200.0)
        NSLog("windowRect %.2f,%.2f,%.2f,%.2f",
            Float(windowRect.origin.x),
            Float(windowRect.origin.y),
            Float(windowRect.size.width),
            Float(windowRect.size.height))
        //->100.00,0.00,300.00,200.00
        var aWindow : NSWindow = NSWindow(contentRect: windowRect, styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.setDynamicDepthLimit(true )
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        var frameRect : NSRect = aWindow.frameRectForContentRect(windowRect)
        NSLog("frameRect %.2f,%.2f,%.2f,%.2f",
            Float(frameRect.origin.x),
            Float(frameRect.origin.y),
            Float(frameRect.size.width),
            Float(frameRect.size.height))
        //->100.00,0.00,300.00,222.00


    }
    //NSWindow drawers
    var theDrawer040 : NSDrawer = NSDrawer(contentSize: NSMakeSize(100.0, 100.0),
    preferredEdge: 1 )
    //preferredEdge 1=下、2=右、3=上、4=右
    func buttonAction040(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as NSButton).window!
        
        if ((theWindow.drawers) != nil){
        NSLog("%@", theWindow.drawers!.description)
        }
        //drawerを表示／非表示
        theDrawer040.toggle(theWindow)

    }
    @IBAction func function040(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Toggle"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction040:")
        aWindow.contentView.addSubview(theButton)
        
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
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Toggle"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction041:")
        aWindow.contentView.addSubview(theButton)
        
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSWindow
    @IBAction func function042(sender: AnyObject) {
    }
    //NSWindow
    @IBAction func function043(sender: AnyObject) {
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

