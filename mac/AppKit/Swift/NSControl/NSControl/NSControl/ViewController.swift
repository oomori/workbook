//
//  ViewController.swift
//  NSControl
//
//  Created by air on 2015/08/23.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//  convert Swift 1.1 -> 2.0 2015/10/17

import Cocoa

class ViewController: NSViewController {

    var windowArray : NSMutableArray = []   //ウインドウ保持用
    var dataArray : NSMutableArray = []
    
    //NSControl initWithFrame:
    //Swift1.2
    func buttonAction001(sender: AnyObject?){
        //var theWindow : NSWindow = (sender as! NSButton).window!
        _ = (sender as! NSButton).window!
        NSLog("!!!")
    }
    @IBAction func method001(sender: AnyObject) {
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
        theButton.title = "Action"
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
    
    //NSControl enabled
    //Swift1.2
    func buttonAction002(sender: AnyObject?){
        _  = (sender as! NSButton).window!
        if (sender as! NSButton).enabled == true
        {
            (sender as! NSButton).enabled = false
        }
    }
    @IBAction func method002(sender: AnyObject) {
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
        theButton.title = "Action"
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
    
    //NSControl doubleValue
    //Swift2.0
    var aButton003 : NSButton?
    var aTextField003 : NSTextField?
    func buttonAction003(sender: AnyObject?){
        _  = (sender as! NSButton).window!
        aTextField003?.doubleValue = 1234
    }
    @IBAction func method003(sender: AnyObject) {
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
        //NSButton
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction003:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        //.SwitchButton
        //.PushOnPushOffButton
        aWindow.contentView!.addSubview(theButton)
        
        //NSTextField
        let theTextField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 150.0, 100.0, 30.0))
        //theTextField.action = Selector("buttonAction003:")
        //theTextField.target = self
        aWindow.contentView!.addSubview(theTextField)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton003 = theButton    //ボタン
        self.aTextField003 = theTextField        //テキストフィールド
        
        //ウインドウの表示
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    //NSControl 作成中
    //Swift2.0
    var aButton004 : NSButton?
    var aTableView004 : NSTableView?
    func buttonAction004(sender: AnyObject?){
        _  = (sender as! NSButton).window!
        NSLog("%@", aButton004!.stringValue)
        
    }
    @IBAction func method004(sender: AnyObject) {
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
        //NSButton
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction004:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        //.SwitchButton
        //.PushOnPushOffButton
        aWindow.contentView!.addSubview(theButton)
        

        
        //ボタンの制約設定
        //falseを設定する
        theButton.translatesAutoresizingMaskIntoConstraints = false
        
        //先にaddSubviewする
        aWindow.contentView!.addSubview(theButton)
        
        let viewDictionary:Dictionary = ["theButton": theButton]
        
        //横方向の制限
        //ボタン真ん中に
        let constraintFormat1:[NSLayoutConstraint] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[theButton]-|",
            options : NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewDictionary)
        
        aWindow.contentView!.addConstraints(constraintFormat1 )
        
        
        
        
        
        //テーブルビューを作成
        //まずはスクロールビュー
        let scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //中身のテーブルビュー
        let theTableView : NSTableView = NSTableView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //列
        let tableColumn1 : NSTableColumn = NSTableColumn(identifier: "col1")
        let tableColumn2 : NSTableColumn = NSTableColumn(identifier: "col2")
        tableColumn1.width = 170
        tableColumn2.width = 130
        //列をテーブルにセット
        theTableView.addTableColumn(tableColumn1)
        theTableView.addTableColumn(tableColumn2)
        
        //効いてない？
        
        scrollView.autoresizesSubviews = true
        theTableView.autoresizingMask = ( [.ViewWidthSizable, .ViewHeightSizable] )
        
        //データソースとデリゲートをセット
        let dataObj : TableData002 = TableData002()
        dataArray.addObject(dataObj)
        
        theTableView.setDataSource(dataObj )
        theTableView.setDelegate(dataObj )
        theTableView.reloadData()
        
        scrollView.documentView = theTableView
        scrollView.hasVerticalRuler = true
        aWindow.contentView!.addSubview(scrollView)
        
        //テーブルの制約設定
        //falseを設定する
        //スクロールビューの制約を手動に
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //ウインドウに対するスクロールビューの制約
        let viewDictionary3 : Dictionary = ["scrollView": scrollView]
        let scrollViewConstraintV: [NSLayoutConstraint] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(11)-[scrollView]-(20)-|",
            options : NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewDictionary3)
        //scrollViewConstraints.addObjectsFromArray(scrollViewConstraintV)
        //横の制約　スクロールビューが親ビューに対して
        let scrollViewConstraintH: [NSLayoutConstraint]  =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(11)-[scrollView]-(20)-|",
            options : NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewDictionary3)
 
        //ウインドウに対するスクロールビューの制約の追加
        aWindow.contentView!.addConstraints(scrollViewConstraintH)
        aWindow.contentView!.addConstraints(scrollViewConstraintV)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton004 = theButton    //ボタン
        self.aTableView004 = theTableView        //
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    //NSControl floatValue
    //Swift2.0
    var aButton005 : NSButton?
    var aTextField005 : NSTextField?
    func buttonAction005(sender: AnyObject?){
        _  = (sender as! NSButton).window!
        aTextField005?.floatValue = 1234.1234
    }
    @IBAction func method005(sender: AnyObject) {
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
        //NSButton
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction005:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        aWindow.contentView!.addSubview(theButton)
        
        //NSTextField
        let theTextField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 150.0, 100.0, 30.0))
        aWindow.contentView!.addSubview(theTextField)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton005 = theButton    //ボタン
        self.aTextField005 = theTextField        //テキストフィールド
        
        //ウインドウの表示
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    //NSControl intValue
    //Swift2.0
    var aButton006 : NSButton?
    var aTextField006 : NSTextField?
    func buttonAction006(sender: AnyObject?){
        _  = (sender as! NSButton).window!
        aTextField006?.intValue = 1234
    }
    @IBAction func method006(sender: AnyObject) {
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
        //NSButton
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction006:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        aWindow.contentView!.addSubview(theButton)
        
        //NSTextField
        let theTextField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 150.0, 100.0, 30.0))
        aWindow.contentView!.addSubview(theTextField)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton006 = theButton    //ボタン
        self.aTextField006 = theTextField        //テキストフィールド
        
        //ウインドウの表示
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    //NSControl integerValue
    //Swift2.0
    var aButton007 : NSButton?
    var aTextField007 : NSTextField?
    func buttonAction007(sender: AnyObject?){
        _ = (sender as! NSButton).window!
        aTextField007?.integerValue = 1234
    }
    @IBAction func method007(sender: AnyObject) {
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
        //NSButton
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction007:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        aWindow.contentView!.addSubview(theButton)
        
        //NSTextField
        let theTextField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 150.0, 100.0, 30.0))
        aWindow.contentView!.addSubview(theTextField)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton007 = theButton    //ボタン
        self.aTextField007 = theTextField        //テキストフィールド
        
        //ウインドウの表示
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    //NSControl objectValue
    //Swift2.0
    var aButton008 : NSButton?
    var aTextField008 : NSTextField?
    func buttonAction008(sender: AnyObject?){
        _  = (sender as! NSButton).window!
        NSLog("%@", aTextField008!.description)
        //-><NSTextField: 0x600000184780>
    }
    @IBAction func method008(sender: AnyObject) {
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
        //NSButton
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction008:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        aWindow.contentView!.addSubview(theButton)
        
        //NSTextField
        let theTextField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 150.0, 100.0, 30.0))
        aWindow.contentView!.addSubview(theTextField)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton008 = theButton    //ボタン
        self.aTextField008 = theTextField        //テキストフィールド
        
        //ウインドウの表示
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    //NSControl stringValue
    //Swift2.0
    var aButton009 : NSButton?
    var aTextField009 : NSTextField?
    func buttonAction009(sender: AnyObject?){
        _  = (sender as! NSButton).window!
        aTextField009?.stringValue = "文字！！"
    }
    @IBAction func method009(sender: AnyObject) {
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
        //NSButton
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction009:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        aWindow.contentView!.addSubview(theButton)
        
        //NSTextField
        let theTextField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 150.0, 100.0, 30.0))
        aWindow.contentView!.addSubview(theTextField)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton009 = theButton    //ボタン
        self.aTextField009 = theTextField        //テキストフィールド
        
        //ウインドウの表示
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    //NSControl stringValue
    //Swift2.0
    var aButton010 : NSButton?
    var aTextField010 : NSTextField?
    func buttonAction010(sender: AnyObject?){
        _  = (sender as! NSButton).window!
        
        //テキスト属性を変えるには対象のオブジェクトのallowsEditingTextAttributesをtrueにしておく
        let font:NSFont! = NSFont(name:"HelveticaNeue-Bold",size:20)
        let selectedAttributes:[String:AnyObject] = [NSFontAttributeName:font,NSForegroundColorAttributeName : NSColor(calibratedRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)]
        
        
        let attString : NSAttributedString? = NSAttributedString(string: "文字！！", attributes: selectedAttributes)
        //NSAttributedString(string: "文字！！", attributes: selectedAttributes)
        aTextField010?.attributedStringValue = attString!
    }
    @IBAction func method010(sender: AnyObject) {
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
        //NSButton
        let theButton : NSButton = NSButton(frame: NSMakeRect(50.0, 50.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction010:")
        theButton.target = self
        theButton.setButtonType(.MomentaryLightButton)
        aWindow.contentView!.addSubview(theButton)
        
        //NSTextField
        let theTextField : NSTextField = NSTextField(frame: NSMakeRect(50.0, 150.0, 100.0, 30.0))
        //
        theTextField.allowsEditingTextAttributes = true
        
        aWindow.contentView!.addSubview(theTextField)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton010 = theButton    //ボタン
        self.aTextField010 = theTextField        //テキストフィールド
        
        //ウインドウの表示
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }

    @IBAction func method011(sender: AnyObject) {
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

