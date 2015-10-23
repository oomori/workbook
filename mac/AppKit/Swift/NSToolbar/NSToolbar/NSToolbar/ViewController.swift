//
//  ViewController.swift
//  NSToolbar
//
//  Created by air on 2015/03/30.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//  convert Swift 1.1 -> 2.0 2015/10/23

import Cocoa

class ViewController: NSViewController {

    var windowArray : NSMutableArray = []
    
    //NSToolbar
    //Swift1.2
    func buttonAction001(sender: AnyObject){
        let aWindow : NSWindow = (sender as! NSButton).window!
        aWindow.toggleToolbarShown(self)
    }
    
    @IBAction func function001(sender: AnyObject) {
        let theWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Toolbar"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction001:")
        theButton.target = self
        theWindow.contentView!.addSubview(theButton)
        
        //ツールバーを作成
        let theToolBar : NSToolbar = NSToolbar(identifier: "mainToolBar")
        let toolbarDelegate : ToolbarDelegate001 = ToolbarDelegate001()
        theToolBar.delegate = toolbarDelegate
        
        //ツールバーの表示モード
        theToolBar.displayMode = NSToolbarDisplayMode.IconAndLabel //アイコントラベル
        //theToolBar.displayMode = NSToolbarDisplayMode.IconOnly //アイコンのみ
        
        //theToolBar.insertItemWithItemIdentifier("toolBarItem1", atIndex: 0)
        
        theWindow.toolbar = theToolBar
        //ウインドウの表示
        theWindow.center()//ウインドウをスクリーンの中心に
        theWindow.title = "ウインドウタイトル"//タイトル設定
        theWindow.orderFront(self)//前面に
        theWindow.makeKeyAndOrderFront(self)//表示
        
        
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

