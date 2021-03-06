//
//  ViewController.swift
//  NSButton
//
//  Created by air on 2015/02/15.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
// Swift2.0
// OS X 10.11.3

//未記載
//springLoaded
//http://cocoaapi.hatenablog.com/entry/Appkit/NSButton/springLoaded

//maxAcceleratorLevel
//http://cocoaapi.hatenablog.com/entry/Appkit/NSButton/maxAcceleratorLevel


import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var myButton: NSButton!
    var windowArray : NSMutableArray = []   //ウインドウ保持用
    
    // MARK: - NSButton
    // MARK: setButtonType
    //NSButton setButtonType
    //http://cocoaapi.hatenablog.com/entry/00011019/NSButton_setButtonType_
    //Swift2.0
    @IBAction func function001(sender: AnyObject) {
        myButton.setButtonType(NSButtonType.PushOnPushOffButton)
        // MomentaryLightButton // was NSMomentaryPushButton
        // PushOnPushOffButton
        // ToggleButton
        // SwitchButton
        // RadioButton
        // MomentaryChangeButton
        // OnOffButton
        // MomentaryPushInButton // was NSMomentaryLight
    }
    
    
    //NSButton title
    //http://cocoaapi.hatenablog.com/entry/00011003/NSButtontitle
    //Swift2.0
    func buttonAction002(sender: AnyObject?){
        //var theWindow : NSWindow = (sender as! NSButton).window!
        NSLog("!!!")
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
        aWindow.title = "ウインドウタイトル"//タイトル設定
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        //.SwitchButton
        //.PushOnPushOffButton
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    // MARK: - getPeriodicDelay
    //NSButton getPeriodicDelay
    //http://cocoaapi.hatenablog.com/entry/00011105/NSButton_getPeriodicDelay_interval_
    @IBAction func function003(sender: AnyObject) {
        //ウインドウ作成
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
        //ボタン作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(80.0, 80.0, 100.0, 30.0))
        theButton.title = "Change"//タイトル
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle//スタイル
        theButton.action = Selector("buttonAction002:")//ボタンを押した時に動かす関数
        theButton.target = self//ターゲット
        theButton.setButtonType(.MomentaryLightButton)
        var floatValue1 : Float = 0 //delayを入れる
        var floatValue2 : Float = 0 //intervalを入れる
        
        theButton.getPeriodicDelay(&floatValue1,
            interval: &floatValue2)
        NSLog("delay = %f,interval = %f", floatValue1,floatValue2)
        //-> delay = 0.400000,interval = 0.075000

        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    // MARK: - setPeriodicDelay
    //NSButton setPeriodicDelay
    //http://cocoaapi.hatenablog.com/entry/00011013/NSButton_setPeriodicDelay_interval_
    //Swift2.0
    var counter004 : Int = 0
    func buttonAction004(sender: AnyObject?){
        //var theWindow : NSWindow = (sender as! NSButton).window!
        (sender as! NSButton).title = String(counter004++)
    }
    @IBAction func function004(sender: AnyObject) {
        //ウインドウ作成
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
        //ボタン作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"//タイトル
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle//スタイル
        theButton.action = Selector("buttonAction004:")//ボタンを押した時に動かす関数
        theButton.target = self//ターゲット
        theButton.continuous = true //メッセージを繰り返し送信する
        
        var floatValue1 : Float = 0 //delayを入れる
        var floatValue2 : Float = 0 //intervalを入れる
        
        theButton.getPeriodicDelay(&floatValue1,
            interval: &floatValue2)
        //-> : 0.400000,2 : 0.075000
        
        theButton.setPeriodicDelay(0.5,interval :0.3)
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    
    // MARK: - alternateTitle
    //NSButton　alternateTitle
    //http://cocoaapi.hatenablog.com/entry/00011108/NSButton_alternateTitle
    @IBOutlet weak var alter: NSButton!
    @IBAction func function005(sender: AnyObject) {
        //ウインドウ作成
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
        //ボタン作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 100.0))
        theButton.title = "Change"//タイトル
        theButton.alternateTitle = "Alter"
        
        //alternateTitleを表示するには
        //MomentaryChangeButtonである必要がある
        theButton.setButtonType(NSButtonType.MomentaryChangeButton)//
        //RegularSquareBezelStyleである必要がある。
        theButton.bezelStyle = NSBezelStyle.RegularSquareBezelStyle//スタイル

        theButton.action = Selector("buttonAction002:")//ボタンを押した時に動かす関数
        theButton.target = self//ターゲット
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    // MARK: bezelStyle
    //NSButton bezelStyle
    //http://cocoaapi.hatenablog.com/entry/00011106/NSButton_bezelStyle
    @IBAction func function006(sender: AnyObject) {
        
        switch (alter.bezelStyle){
        case .RoundedBezelStyle:
            NSLog("RoundedBezelStyle")
        case .ThickSquareBezelStyle:
            NSLog("ThickSquareBezelStyle")
        case .ThickerSquareBezelStyle:
            NSLog("ThickerSquareBezelStyle")
        case .TexturedSquareBezelStyle:
            NSLog("TexturedSquareBezelStyle")
        case .TexturedRoundedBezelStyle:
            NSLog("TexturedRoundedBezelStyle")
        case .SmallSquareBezelStyle:
            NSLog("SmallSquareBezelStyle")
        case .ShadowlessSquareBezelStyle:
            NSLog("ShadowlessSquareBezelStyle")
        case .RoundRectBezelStyle:
            NSLog("RoundRectBezelStyle")
        case .RoundedDisclosureBezelStyle:
            NSLog("RoundedDisclosureBezelStyle")
        //case .RoundedBezelStyle:
        //    NSLog("RoundedBezelStyle")
        case .RegularSquareBezelStyle:
            NSLog("RegularSquareBezelStyle")
        case .RecessedBezelStyle:
            NSLog("RecessedBezelStyle")
        case .InlineBezelStyle:
            NSLog("InlineBezelStyle")
        case .HelpButtonBezelStyle:
            NSLog("HelpButtonBezelStyle")
        case .DisclosureBezelStyle:
            NSLog("DisclosureBezelStyle")
        case .CircularBezelStyle:
            NSLog("CircularBezelStyle")
        //default:
          //  NSLog("default")
        }
        
    }
    
    // MARK: attributedTitle
    //NSButton attributedTitle
    //http://cocoaapi.hatenablog.com/entry/Appkit/NSButton/attributedTitle
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
        aWindow.title = "ウインドウタイトル"//タイトル設定
        
        //ボタンの設定はここから
        let theButton : NSButton = NSButton(frame: NSMakeRect(80.0, 80.0, 150.0, 30.0))
        let attributes : Dictionary = [
                    NSFontAttributeName : NSFont.systemFontOfSize(19.0),
                    NSForegroundColorAttributeName:NSColor.redColor()]
        let attributedString : NSAttributedString =
                    NSAttributedString(string: "赤いタイトル", attributes: attributes)
        theButton.attributedTitle = attributedString
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        //ここまで
        
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    // MARK: - attributedAlternateTitle
    //NSButton attributedAlternateTitle
    //http://cocoaapi.hatenablog.com/entry/00011107/NSButton_attributedAlternateTitle
    //Swift2.0
    @IBAction func function008(sender: AnyObject) {
        //ウインドウ作成
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
        //ボタン作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 100.0))
        //theButton.title = "Change"//タイトル
        //theButton.alternateTitle = "Alter"
        
        //alternateTitleを表示するには
        //MomentaryChangeButtonである必要がある
        theButton.setButtonType(NSButtonType.MomentaryChangeButton)//
        //RegularSquareBezelStyleである必要がある。
        theButton.bezelStyle = NSBezelStyle.RegularSquareBezelStyle//スタイル
        let attributes : Dictionary = [
            NSFontAttributeName : NSFont.systemFontOfSize(19.0),
            NSForegroundColorAttributeName:NSColor.redColor()]
        let attributedString : NSAttributedString =
        NSAttributedString(string: "赤い代替タイトル", attributes: attributes)
        theButton.attributedAlternateTitle = attributedString
        theButton.title = "タイトル"
        theButton.action = Selector("buttonAction002:")//ボタンを押した時に動かす関数
        theButton.target = self//ターゲット
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    // MARK: - image
    //NSButton　image
    //http://cocoaapi.hatenablog.com/entry/00011103/NSButton_image
    //Swift2.0
    @IBAction func function009(sender: AnyObject) {
        //ウインドウ作成
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
        //ボタン作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(70.0, 50.0, 150.0, 120.0))
        theButton.title = "Change"//タイトル
        theButton.alternateTitle = "Alter"
        
        //alternateTitleを表示するには
        //MomentaryChangeButtonである必要がある
        theButton.setButtonType(NSButtonType.MomentaryChangeButton)
        theButton.bezelStyle = NSBezelStyle.RegularSquareBezelStyle
        //スタイル
        theButton.imagePosition = NSCellImagePosition.NoImage
        //NSCellImagePosition.ImageRight 画像が右
        //ImageAbove 画像が上
        //ImageBelow　画像が下 指定しないと
        theButton.image = NSImage(named: "face")
        
        theButton.action = Selector("buttonAction002:")//ボタンを押した時に動かす関数
        theButton.target = self//ターゲット
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        
    }
    
    // MARK: - alternateImage
    //NSButton alternateImage
    //http://cocoaapi.hatenablog.com/entry/00011109/NSButton_alternateImage
    //Swift2.0
    @IBAction func function010(sender: AnyObject) {
        //ウインドウ作成
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
        //ボタン作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(70.0, 50.0, 150.0, 120.0))
        theButton.title = "Change"//タイトル
        theButton.alternateTitle = "Alter"
        
        //alternateTitleを表示するには
        //MomentaryChangeButtonである必要がある
        theButton.setButtonType(NSButtonType.MomentaryChangeButton)
        theButton.bezelStyle = NSBezelStyle.RegularSquareBezelStyle
        //スタイル
        theButton.imagePosition = NSCellImagePosition.NoImage
        //NSCellImagePosition.ImageRight 画像が右
        //ImageAbove 画像が上
        //ImageBelow　画像が下 指定しないと
        theButton.image = NSImage(named: "face")
        theButton.alternateImage = NSImage(named: "face_alternate")
        theButton.action = Selector("buttonAction002:")//ボタンを押した時に動かす関数
        theButton.target = self//ターゲット
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    // MARK: -
    //NSButton
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
        aWindow.title = "ウインドウタイトル"//タイトル設定
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        theButton.bordered = true

        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

    }
    // MARK: - transparent
    //NSButton  transparent
    //http://cocoaapi.hatenablog.com/entry/Appkit/NSButton/transparent
    //Swift2.0
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
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        theButton.transparent = true
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    // MARK: - showsBorderOnlyWhileMouseInside
    //NSButton　showsBorderOnlyWhileMouseInside
    //http://cocoaapi.hatenablog.com/entry/00011006/NSButton_showsBorderOnlyWhileMouseInside
    //Swift2.0
    @IBAction func function013(sender: AnyObject) {
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
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 90.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        theButton.showsBorderOnlyWhileMouseInside = true
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    //NSButton
    @IBAction func function014(sender: AnyObject) {
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
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 90.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RegularSquareBezelStyle
        theButton.setButtonType(NSButtonType.SwitchButton)
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        theButton.allowsMixedState = true
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSButton state
    @IBAction func function015(sender: AnyObject) {
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
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 90.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RegularSquareBezelStyle
        theButton.setButtonType(NSButtonType.SwitchButton)
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        theButton.allowsMixedState = true
        theButton.state = NSMixedState
        //NSOnState
        //NSOffState
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    //NSButton setNextState
    //Swift1.2
    var switchButton: NSButton!
    func buttonAction016(sender: AnyObject?){
        //var theWindow : NSWindow = (sender as! NSButton).window!
        switchButton.setNextState()
        NSLog("!!!")
    }
    @IBAction func function016(sender: AnyObject) {
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
        //
        let theSwitch : NSButton = NSButton(frame: NSMakeRect(100.0, 90.0, 100.0, 30.0))
        theSwitch.title = "Switch"
        theSwitch.bezelStyle = NSBezelStyle.RegularSquareBezelStyle
        theSwitch.setButtonType(NSButtonType.SwitchButton)
        theSwitch.action = Selector("buttonAction002:")
        theSwitch.target = self
        switchButton = theSwitch
        theSwitch.allowsMixedState = true
        theSwitch.state = NSMixedState
        aWindow.contentView!.addSubview(theSwitch)
        
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RegularSquareBezelStyle
        theButton.action = Selector("buttonAction016:")
        theButton.target = self
        theButton.allowsMixedState = true
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        
    }
    //NSButton highlight
    //Swift1.2
    var hilightButton: NSButton!
    func buttonAction017(sender: AnyObject?){
        //var theWindow : NSWindow = (sender as! NSButton).window!
        
        hilightButton.highlight( true )

    }
    @IBAction func function017(sender: AnyObject) {
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
        //
        let theSwitch : NSButton = NSButton(frame: NSMakeRect(100.0, 90.0, 100.0, 30.0))
        theSwitch.title = "Switch"
        theSwitch.bezelStyle = NSBezelStyle.RegularSquareBezelStyle
        theSwitch.setButtonType(NSButtonType.PushOnPushOffButton)
        theSwitch.action = Selector("buttonAction002:")
        theSwitch.target = self
        hilightButton = theSwitch
        aWindow.contentView!.addSubview(theSwitch)
        
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RegularSquareBezelStyle
        theButton.action = Selector("buttonAction017:")
        theButton.target = self
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    //NSButton keyEquivalent
    //NSButton keyEquivalentModifierMask
    @IBAction func function018(sender: AnyObject) {
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
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        //コマンド+シフト＋「l」でボタンを押したことにする
        theButton.keyEquivalent = "l"
        theButton.keyEquivalentModifierMask = Int(NSEventModifierFlags.CommandKeyMask.rawValue | NSEventModifierFlags.ShiftKeyMask.rawValue)
                //.allZeros
        
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSButton
    @IBAction func function019(sender: AnyObject) {
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
        //
        let theButton : MyButton = MyButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        //コマンド+シフト＋「l」でボタンを押したことにする
        theButton.keyEquivalent = "l"
        theButton.keyEquivalentModifierMask = Int(NSEventModifierFlags.CommandKeyMask.rawValue | NSEventModifierFlags.ShiftKeyMask.rawValue)
        
        theButton.setButtonType(.MomentaryLightButton)
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSButton
    @IBAction func function020(sender: AnyObject) {
        
    }
    //NSButton
    @IBAction func function021(sender: AnyObject) {
        
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

