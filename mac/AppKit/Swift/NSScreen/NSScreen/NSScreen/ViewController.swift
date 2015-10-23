//
//  ViewController.swift
//  NSScreen
//
//  Created by air on 2015/04/06.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//Swift2.0

import Cocoa

class ViewController: NSViewController {

    var windowArray : NSMutableArray = []
    
    //NSScreen mainScreen()
    //NSScreen deepestScreen()
    //NSScreen screens()
    //NSScreen supportedWindowDepths()
    //NSScreen deviceDescription
    //NSScreen visibleFrame
    //NSScreen colorSpace
    //NSScreen screensHaveSeparateSpaces
    @IBAction func function001(sender: AnyObject) {
        let theScreen : NSScreen = NSScreen.mainScreen()!
        NSLog("main screen size=  (%.2f✕%.2f)",
                                    Float(theScreen.frame.size.width),
                                    Float(theScreen.frame.size.height) )
        //-> main screen size=  (1366.00✕768.00)
        
        let deepestScreen : NSScreen = NSScreen.deepestScreen()!
        NSLog("deepestScreen screen depth= %d", NSBitsPerPixelFromDepth(deepestScreen.depth) )
        //-> deepestScreen screen depth= 24
        

        
        let supportedWindowDepths : UnsafePointer<NSWindowDepth> = theScreen.supportedWindowDepths
        
        NSLog("supportedWindowDepths = %d", NSBitsPerPixelFromDepth( supportedWindowDepths[0]) )
        //-> supportedWindowDepths = 8
        
        let screenArray : [AnyObject] = NSScreen.screens()!
        for value in screenArray {
            NSLog("screen size=  (%.2f✕%.2f)",
                Float(value.frame.size.width),
                Float(value.frame.size.height) )
        }
        //-> screen size=  (1366.00✕768.00)
        //-> screen size=  (1920.00✕1080.00)

        let descDic : [NSObject:AnyObject] = theScreen.deviceDescription
        NSLog("description = %@", descDic )
        
        //description = {
        //    NSDeviceBitsPerSample = 8;
        //    NSDeviceColorSpaceName = NSCalibratedRGBColorSpace;
        //    NSDeviceIsScreen = YES;
        //    NSDeviceResolution = "NSSize: {72, 72}";
        //    NSDeviceSize = "NSSize: {1366, 768}";
        //    NSScreenNumber = 69680256;
        //}
        
        let visibleFrame : NSRect = theScreen.visibleFrame
        NSLog("visibleFrame = (x=%.2f,y=%.2f,w=%.2f,h=%.2f)",
                                    Float(visibleFrame.origin.x),
                                    Float(visibleFrame.origin.y),
                                    Float(visibleFrame.size.width),
                                    Float(visibleFrame.size.height) )
        // -> visibleFrame = (x=0.00,y=43.00,w=1366.00,h=702.00)
        
        let colorSpace : NSColorSpace = theScreen.colorSpace!
        NSLog("colorSpace = %@",colorSpace.description)
        // -> colorSpace = Color LCD colorspace

        
        if (NSScreen.screensHaveSeparateSpaces()){
            NSLog("screensHaveSeparateSpaces = YES")
        }else{
            NSLog("screensHaveSeparateSpaces = NO")
        }
        
        let aligneRect : NSRect = theScreen.backingAlignedRect(NSMakeRect(0.3, 0.0,
            100.3, 123.5),
            //options: NSAlignmentOptions.AlignMinXInward | .AlignMinYNearest |
            //    .AlignMaxXInward | .AlignMaxYNearest )
            options: NSAlignmentOptions.AlignAllEdgesInward )
        
        
        NSLog("aligneRect = (x=%.1f,y=%.1f,w=%.1f,h=%.1f)",
            Float(aligneRect.origin.x),
            Float(aligneRect.origin.y),
            Float(aligneRect.size.width),
            Float(aligneRect.size.height) )
        
        //NSMakeRect(0.3, 0.0,105.234, 123.5),
        //NSAlignmentOptions.AlignMinXNearest | .AlignMinYNearest |.AlignMaxXNearest | .AlignMaxYNearest )
        // -> aligneRect = (x=0.00,y=0.00,w=106.00,h=124.00)

        
        
        let window : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: theScreen )
        windowArray.addObject(window) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        window.center()//ウインドウをスクリーンの中心に
        window.title = "ウインドウタイトル"//タイトル設定
        window.orderFront(self)//前面に
        window.makeKeyAndOrderFront(self)//表示
    }
    
    //NSScreen
    //Swift2.0
    //作成中
    func calc002(sender:AnyObject){
        NSLog("!!!")
    }
    func calc002_popup(sender:AnyObject){
        NSLog("!!! %@",(sender as! NSPopUpButton).title )
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
            screen: NSScreen.mainScreen()! )
        
        //text field
        let textFieldTopInput : NSTextField = NSTextField(frame: NSMakeRect(50.0, 100.0, 50.0, 30.0))
        textFieldTopInput.action = Selector("calc002:")
        aWindow.contentView!.addSubview(textFieldTopInput)
        
        let textFieldLeftInput : NSTextField = NSTextField(frame: NSMakeRect(0.0, 50.0, 50.0, 30.0))
        textFieldLeftInput.action = Selector("calc002:")
        aWindow.contentView!.addSubview(textFieldLeftInput)
        
        let textFieldRightInput : NSTextField = NSTextField(frame: NSMakeRect(100.0, 50.0, 50.0, 30.0))
        textFieldRightInput.action = Selector("calc002:")
        aWindow.contentView!.addSubview(textFieldRightInput)
        
        let textFieldBottomInput : NSTextField = NSTextField(frame: NSMakeRect(50.0, 0.0, 50.0, 30.0))
        textFieldBottomInput.action = Selector("calc002:")
        aWindow.contentView!.addSubview(textFieldBottomInput)
        
        //popup top
        let popupButtonTop : NSPopUpButton = NSPopUpButton(frame: NSMakeRect(0.0, 0.0, 100.0, 30.0), pullsDown: true)
        let popupMenuTop :NSMenu = NSMenu(title: "Top")
        let popupMenuTopItem1 :NSMenuItem = NSMenuItem(title: "AlignHeightInward", action: Selector("calc002:"), keyEquivalent: "" )
        let popupMenuTopItem2 :NSMenuItem = NSMenuItem(title: "AlignHeightOutward", action: Selector("calc002_popup:"), keyEquivalent: "" )
        popupMenuTop.addItem(popupMenuTopItem1)
        popupMenuTop.addItem(popupMenuTopItem2)
        popupButtonTop.menu = popupMenuTop
        popupMenuTopItem1.target = self
        aWindow.contentView!.addSubview(popupButtonTop)
        
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSScreen backingAlignedRect
    @IBAction func function003(sender: AnyObject) {
        let theScreen : NSScreen = NSScreen.mainScreen()!
        
        //全部内側
        let aligneRect001 : NSRect = theScreen.backingAlignedRect(
                            NSMakeRect(0.3, 0.0, 100.3, 123.5),
            options: NSAlignmentOptions.AlignAllEdgesInward )
        NSLog("aligneRect001 = (x=%.1f,y=%.1f,w=%.1f,h=%.1f)",
            Float(aligneRect001.origin.x),
            Float(aligneRect001.origin.y),
            Float(aligneRect001.size.width),
            Float(aligneRect001.size.height) )
        // ->aligneRect = (x=1.0,y=0.0,w=99.0,h=123.0)
        
        //それぞれ設定
        let aligneRect002 : NSRect = theScreen.backingAlignedRect(
            NSMakeRect(0.3, 0.0, 100.3, 123.5),
            options: [NSAlignmentOptions.AlignMinXInward, .AlignMinYNearest, .AlignMaxXInward, .AlignMaxYNearest] )
        
        NSLog("aligneRect002 = (x=%.1f,y=%.1f,w=%.1f,h=%.1f)",
            Float(aligneRect002.origin.x),
            Float(aligneRect002.origin.y),
            Float(aligneRect002.size.width),
            Float(aligneRect002.size.height) )
        //(0.3, 0.0, 100.3, 123.5)の場合
        // ->aligneRect002 = (x=1.0,y=0.0,w=99.0,h=124.0)
        
        //(-0.3, 0.0, 100.3, 123.5)の場合
        // ->aligneRect002 = (x=-0.0,y=0.0,w=100.0,h=124.0)
        //(-0.8, 0.0, 100.3, 123.5)の場合
        // ->aligneRect002 = (x=-0.0,y=0.0,w=99.0,h=124.0)

        //Flip?
        let aligneRect003 : NSRect = theScreen.backingAlignedRect(
            NSMakeRect(0.3, 0.0, 100.3, 123.5),
            options: [NSAlignmentOptions.AlignRectFlipped, .AlignMinXInward, .AlignMinYNearest, .AlignMaxXInward, .AlignMaxYNearest]  )
        
        NSLog("aligneRect003 = (x=%.1f,y=%.1f,w=%.1f,h=%.1f)",
            Float(aligneRect003.origin.x),
            Float(aligneRect003.origin.y),
            Float(aligneRect003.size.width),
            Float(aligneRect003.size.height) )
        //(0.3, 0.0, 100.3, 123.5)
        //aligneRect003 = (x=1.0,y=-0.0,w=99.0,h=123.0)
        
        //
        let aligneRect004 : NSRect = theScreen.backingAlignedRect(
            NSMakeRect(0.3, 0.0, 100.3, 123.5),
            options: [NSAlignmentOptions.AlignMinXInward, .AlignMinYNearest, .AlignMaxXInward, .AlignMaxYNearest]  )
        
        NSLog("aligneRect004 = (x=%.1f,y=%.1f,w=%.1f,h=%.1f)",
            Float(aligneRect004.origin.x),
            Float(aligneRect004.origin.y),
            Float(aligneRect004.size.width),
            Float(aligneRect004.size.height) )
        //(0.3, 0.0, 100.3, 123.5)
        //aligneRect003 = (x=1.0,y=-0.0,w=99.0,h=123.0)

    }
    //NSScreen backingScaleFactor
    @IBAction func function004(sender: AnyObject) {
        let theScreen : NSScreen = NSScreen.mainScreen()!
        let backingScaleFactor : CGFloat = theScreen.backingScaleFactor
        NSLog("backingScaleFactor = %.2f",Float(backingScaleFactor) )
        // -> 1.0
    }
    //NSScreen　convertRectFromBacking:
    @IBAction func function005(sender: AnyObject) {
        let theScreen : NSScreen = NSScreen.mainScreen()!
        let newRect : NSRect = theScreen.convertRectFromBacking(NSMakeRect(0.3, 0.0, 100.3, 123.5))
        NSLog("newRect = (x=%.2f,y=%.2f,w=%.2f,h=%.2f)",
            Float(newRect.origin.x),
            Float(newRect.origin.y),
            Float(newRect.size.width),
            Float(newRect.size.height) )
        //通常ディスプレイの場合（倍率1.0） -> (x=0.30,y=0.00,w=100.30,h=123.50)
    }
    //NSScreen convertRectToBacking
    @IBAction func function006(sender: AnyObject) {
        let theScreen : NSScreen = NSScreen.mainScreen()!
        let newRect : NSRect = theScreen.convertRectToBacking(NSMakeRect(0.3, 0.0, 100.3, 123.5))
        NSLog("newRect = (x=%.2f,y=%.2f,w=%.2f,h=%.2f)",
            Float(newRect.origin.x),
            Float(newRect.origin.y),
            Float(newRect.size.width),
            Float(newRect.size.height) )
        //通常ディスプレイの場合（倍率1.0） -> newRect = (x=0.30,y=0.00,w=100.30,h=123.50)

    }
    //NSScreen
    @IBAction func function007(sender: AnyObject) {
        
    }
    //NSScreen
    @IBAction func function008(sender: AnyObject) {
        
    }
    //NSScreen
    @IBAction func function009(sender: AnyObject) {
        
    }
    //NSScreen
    @IBAction func function010(sender: AnyObject) {
        
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

