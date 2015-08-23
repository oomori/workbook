//
//  ViewController.swift
//  NSDrawer
//
//  Created by air on 2015/04/05.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController,NSDrawerDelegate {

    var windowArray : NSMutableArray = []
    var delegateObjects : NSMutableArray = []
    
    //NSDrawer drawers
    //NSDrawer initWithContentSize:preferredEdge:
    //NSDrawer toggle
    //Swift1.2
    var theDrawer001 : NSDrawer = NSDrawer(contentSize: NSMakeSize(100.0, 100.0),
        preferredEdge: 1 )
    //preferredEdge 0=左、1=下、2=右、3=上
    func buttonAction001(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
        
        if ((theWindow.drawers) != nil){
            NSLog("%@", theWindow.drawers!.description)
        }
        //drawerを表示／非表示
        theDrawer001.toggle(theWindow)
        
    }
    @IBAction func function001(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Toggle"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction001:")
        theButton.target = self

        aWindow.contentView.addSubview(theButton)
        
        let delegateObj : DrawerDelegate = DrawerDelegate()
        delegateObjects.addObject(delegateObj)
        theDrawer001.delegate = delegateObj
        NSLog("delegate = %@",delegateObj)
        
        //テキストフィールドを作成、引き出しに付ける
        var textField : NSTextField = NSTextField(frame: NSMakeRect(10.0, 10.0, 50.0, 30.0))
        theDrawer001.contentView?.addSubview(textField)
        
        //引き出しのウインドウを設定
        theDrawer001.parentWindow = aWindow
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSDrawer　close()
    //Swift1.2
    var theDrawer002 : MyDrawer = MyDrawer(contentSize: NSMakeSize(100.0, 100.0),
        preferredEdge: 1 )
    //preferredEdge 1=下、2=右、3=上、4=左
    func buttonAction002(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
        //drawerを表示／非表示
        theDrawer002.toggle(theWindow)
    }
    func buttonAction002_close(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
        //drawerを表示／非表示
        theDrawer002.close()
    }
    @IBAction func function002(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 100.0, 30.0))
        theButton1.title = "Toggle"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction002:")
        theButton1.target = self
        aWindow.contentView.addSubview(theButton1)
        
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(150.0, 2.0, 100.0, 30.0))
        theButton2.title = "Close"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction002_close:")
        theButton2.target = self
        aWindow.contentView.addSubview(theButton2)
        
        let delegateObj : DrawerDelegate = DrawerDelegate()
        delegateObjects.addObject(delegateObj)
        
        theDrawer002.delegate = delegateObj
        
        //テキストフィールドを作成、引き出しに付ける
        var textField : NSTextField = NSTextField(frame: NSMakeRect(10.0, 10.0, 50.0, 30.0))
        theDrawer002.contentView?.addSubview(textField)
        
        theDrawer002.parentWindow = aWindow
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSDrawer open()
    //Swift1.2
    var theDrawer003 : MyDrawer = MyDrawer(contentSize: NSMakeSize(100.0, 100.0),
        preferredEdge: 1 )
    //preferredEdge 0=左、1=下、2=右、3=上
    func buttonAction003(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
        //drawerを表示／非表示
        theDrawer003.toggle(theWindow)
    }
    func buttonAction003_open(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
        theDrawer003.open()
    }
    @IBAction func function003(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(50.0, 2.0, 100.0, 30.0))
        theButton1.title = "Toggle"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction003:")
        theButton1.target = self
        aWindow.contentView.addSubview(theButton1)
        
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(150.0, 2.0, 100.0, 30.0))
        theButton2.title = "Open"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction003_open:")
        theButton2.target = self
        aWindow.contentView.addSubview(theButton2)
        
        let delegateObj : DrawerDelegate = DrawerDelegate()
        delegateObjects.addObject(delegateObj)
        
        theDrawer003.delegate = delegateObj
        
        //テキストフィールドを作成、引き出しに付ける
        var textField : NSTextField = NSTextField(frame: NSMakeRect(10.0, 10.0, 50.0, 30.0))
        theDrawer003.contentView?.addSubview(textField)
        
        theDrawer003.parentWindow = aWindow
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSDrawer openOnEdge()
    //NSDrawer notification
    //Swift1.2
    var theDrawer004 : MyDrawer = MyDrawer(contentSize: NSMakeSize(100.0, 100.0),
        preferredEdge: 1 )
    //preferredEdge 0=左、1=下、2=右、3=上
    func buttonAction004(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
        //drawerを表示／非表示
        theDrawer004.toggle(theWindow)
    }
    func buttonAction004_top(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
        theDrawer004.openOnEdge(3)//上
    }
    func buttonAction004_down(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
        theDrawer004.openOnEdge(1)//下
    }
    func buttonAction004_left(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
        theDrawer004.openOnEdge(0)//左
    }
    func buttonAction004_right(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
        theDrawer004.openOnEdge(2)//右
    }
    func handleNotification(notification: AnyObject){
        NSLog("notification %@",notification.description)
    }
    @IBAction func function004(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton1 : NSButton = NSButton(frame: NSMakeRect(100.0, 80.0, 100.0, 30.0))
        theButton1.title = "Toggle"
        theButton1.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton1.action = Selector("buttonAction004:")
        theButton1.target = self
        aWindow.contentView.addSubview(theButton1)
        
        var theButton2 : NSButton = NSButton(frame: NSMakeRect(100.0, 168.0, 100.0, 30.0))
        theButton2.title = "Top"
        theButton2.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton2.action = Selector("buttonAction004_top:")
        theButton2.target = self
        aWindow.contentView.addSubview(theButton2)
        
        var theButton3 : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton3.title = "Down"
        theButton3.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton3.action = Selector("buttonAction004_down:")
        theButton3.target = self
        aWindow.contentView.addSubview(theButton3)
        
        var theButton4 : NSButton = NSButton(frame: NSMakeRect(0.0, 80.0, 100.0, 30.0))
        theButton4.title = "Left"
        theButton4.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton4.action = Selector("buttonAction004_left:")
        theButton4.target = self
        aWindow.contentView.addSubview(theButton4)
        
        var theButton5 : NSButton = NSButton(frame: NSMakeRect(200.0, 80.0, 100.0, 30.0))
        theButton5.title = "Right"
        theButton5.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton5.action = Selector("buttonAction004_right:")
        theButton5.target = self
        aWindow.contentView.addSubview(theButton5)
        
        let delegateObj : DrawerDelegate = DrawerDelegate()
        delegateObjects.addObject(delegateObj)
        
        theDrawer004.delegate = delegateObj
        
        //テキストフィールドを作成、引き出しに付ける
        var textField : NSTextField = NSTextField(frame: NSMakeRect(10.0, 10.0, 50.0, 30.0))
        theDrawer004.contentView?.addSubview(textField)
        
        theDrawer004.parentWindow = aWindow
        
        let nc : NSNotificationCenter = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: Selector("handleNotification:"), name: "NSDrawerDidCloseNotification", object: nil )
        nc.addObserver(self, selector: Selector("handleNotification:"), name: "NSDrawerDidOpenNotification", object: nil )
        nc.addObserver(self, selector: Selector("handleNotification:"), name: "NSDrawerWillCloseNotification", object: nil )
        nc.addObserver(self, selector: Selector("handleNotification:"), name: "NSDrawerWillOpenNotification", object: nil )

        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSDrawer state
    var theDrawer005 : NSDrawer = NSDrawer(contentSize: NSMakeSize(100.0, 100.0),
        preferredEdge: 1 )
    //preferredEdge 0=左、1=下、2=右、3=上
    func buttonAction005(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!
        
        if ((theWindow.drawers) != nil){
            NSLog("%@", theWindow.drawers!.description)
        }
        //drawerを表示／非表示
        theDrawer005.toggle(theWindow)
        
    }
    func checkTimer005(timer:NSTimer!) {

        switch (theDrawer005.state){
        case 0: //NSDrawerState.ClosedState:
            NSLog("閉じている")
        case 1: //NSDrawerState.OpeningState:
            NSLog("開いている途中")
        case 2: //NSDrawerState.OpenState:
            NSLog("開いている")
        case 3: //NSDrawerState.ClosingState:
            NSLog("閉じている途中")
        default:
            NSLog("閉じている")
        }
    }
    @IBAction func function005(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Toggle"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction005:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        
        let delegateObj : DrawerDelegate = DrawerDelegate()
        delegateObjects.addObject(delegateObj)
        theDrawer005.delegate = delegateObj
        NSLog("delegate = %@",delegateObj)
        
        //テキストフィールドを作成、引き出しに付ける
        var textField : NSTextField = NSTextField(frame: NSMakeRect(10.0, 10.0, 50.0, 30.0))
        theDrawer001.contentView?.addSubview(textField)
        
        //引き出しのウインドウを設定
        theDrawer005.parentWindow = aWindow
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("checkTimer005:"), userInfo: nil, repeats: true)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    //NSDrawer contentSize
    //NSDrawer leadingOffset
    //NSDrawer maxContentSize
    //NSDrawer minContentSize
    //NSDrawer trailingOffset
    //NSDrawer contentView
    var theDrawer006 : NSDrawer = NSDrawer(contentSize: NSMakeSize(100.0, 100.0),
        preferredEdge: 1 )
    //preferredEdge 0=左、1=下、2=右、3=上
    func buttonAction006(sender: AnyObject){
        
        var theWindow : NSWindow = (sender as! NSButton).window!

        //drawerを表示／非表示
        theDrawer006.toggle(theWindow)
        
        NSLog("size = (%.2f,%.2f)", Float(theDrawer006.contentSize.width),Float(theDrawer006.contentSize.height))
        
        NSLog("leadingOffset = (%.2f)", Float(theDrawer006.leadingOffset))
       
        NSLog("maxContentSize = (%.2f,%.2f)", Float(theDrawer006.maxContentSize.width),Float(theDrawer006.maxContentSize.height))
        NSLog("minContentSize = (%.2f,%.2f)", Float(theDrawer006.minContentSize.width),Float(theDrawer006.minContentSize.height))
        NSLog("trailingOffset = (%.2f)", Float(theDrawer006.trailingOffset))
        
        NSLog("contentView = %@", theDrawer006.contentView!.description )
        
        
    
    }
    @IBAction func function006(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Toggle"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction006:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        
        let delegateObj : DrawerDelegate = DrawerDelegate()
        delegateObjects.addObject(delegateObj)
        theDrawer006.delegate = delegateObj
        //NSLog("delegate = %@",delegateObj)
        
        let cView : NSView = NSView(frame: NSMakeRect(10.0, 10.0, 100.0, 100.0))
        theDrawer006.contentView?.addSubview(cView)
        
        //テキストフィールドを作成、引き出しに付ける
        var textField : NSTextField = NSTextField(frame: NSMakeRect(10.0, 10.0, 50.0, 30.0))
        cView.addSubview(textField)
        

        
        
        //引き出しのウインドウを設定
        theDrawer006.parentWindow = aWindow
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        
    }
    @IBAction func function007(sender: AnyObject) {
    }
    @IBAction func function008(sender: AnyObject) {
    }
    @IBAction func function009(sender: AnyObject) {
    }
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

