//
//  ViewController.swift
//  NSAppearance
//
//  Created by air on 2015/11/03.
//  Copyright © 2015年 oomori. All rights reserved.
//
//


import Cocoa

class ViewController: NSViewController {

    var windowArray : NSMutableArray = []   //ウインドウ保持用
    
    
    //NSAppearance initWithAppearanceNamed:bundle:
    //http://cocoaapi.hatenablog.com/entry/Appkit/NSAppearance/initWithAppearanceNamed_bundle_
    //NSAppearance name
    //http://cocoaapi.hatenablog.com/entry/Appkit/NSAppearance/name
    //NSAppearance appearanceNamed:
    //
    func buttonAction001(sender: AnyObject)
    {
        let newAp : NSAppearance = NSAppearance(named: NSAppearanceNameAqua)!
        NSAppearance.setCurrentAppearance(newAp)
        NSLog("name = %@",newAp.name)
    }
    @IBAction func function001( sender: AnyObject) {
        //アピアランスの変更
        let ap : NSAppearance = NSAppearance(named: NSAppearanceNameVibrantDark)!
        NSLog("name = %@",ap.name)
        
        NSLog("name = %@",ap.name)
        //->name = NSAppearanceNameVibrantDark
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
        aWindow.appearance = ap
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction001:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        //.SwitchButton
        //.PushOnPushOffButton
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        NSLog("current name = %@",NSAppearance.currentAppearance().name)
        
        if (ap.allowsVibrancy){
            NSLog("YES")
        }else{
            NSLog("NO")
        }
        
    }
    //NSAppearance 
    //エラーあり
    func buttonAction002(sender: AnyObject)
    {
        NSLog("!!!")
    }
    @IBAction func function002( sender: AnyObject) {
        //アピアランスの変更
        let ap : NSAppearance = NSAppearance(appearanceNamed: NSAppearanceNameVibrantDark, bundle: nil)!

//        let ap : NSAppearance = NSAppearance(named: NSAppearanceNameVibrantDark)!
        NSLog("name = %@",ap.name)
        //->name = NSAppearanceNameVibrantDark
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
        aWindow.appearance = ap
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        //
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Change"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction001:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        //.SwitchButton
        //.PushOnPushOffButton
        aWindow.contentView!.addSubview(theButton)
        
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示

        
    }
    @IBAction func function003( sender: AnyObject) {
        
    }
    @IBAction func function004( sender: AnyObject) {
        
    }
    @IBAction func function005( sender: AnyObject) {
        
    }
    @IBAction func function006( sender: AnyObject) {
        
    }
    @IBAction func function007( sender: AnyObject) {
        
    }
    @IBAction func function008( sender: AnyObject) {
        
    }
    @IBAction func function009( sender: AnyObject) {
        
    }
    @IBAction func function010( sender: AnyObject) {
        
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

