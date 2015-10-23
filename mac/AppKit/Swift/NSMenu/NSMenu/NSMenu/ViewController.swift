//
//  ViewController.swift
//  NSMenu
//
//  Created by air on 2015/04/08.
//  Copyright (c) 2015年 oomori. All rights reserved.
//  Swift2.0

import Cocoa

class ViewController: NSViewController {

    var windowArray : NSMutableArray = []
    func calc001(sender:AnyObject){
        NSLog("!!!")
    }
    @IBAction func function001(sender: AnyObject) {
        let aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen()! )
        
        
        //popup top
        let popupButton : NSPopUpButton = NSPopUpButton(frame: NSMakeRect(0.0, 0.0, 150.0, 30.0), pullsDown: true)
        let popupMenu :NSMenu = NSMenu(title: "Top")
        let popupMenuItem1 :NSMenuItem = NSMenuItem(title: "AlignHeightInward", action: Selector("calc001:"), keyEquivalent: "" )
        let popupMenuItem2 :NSMenuItem = NSMenuItem(title: "AlignHeightOutward", action: Selector("calc001:"), keyEquivalent: "" )
        popupMenuItem1.target = self
        popupMenuItem2.target = self
        popupMenu.addItem(popupMenuItem1)
        popupMenu.addItem(popupMenuItem2)
        
        popupButton.menu = popupMenu
        aWindow.contentView!.addSubview(popupButton)
        
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
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

