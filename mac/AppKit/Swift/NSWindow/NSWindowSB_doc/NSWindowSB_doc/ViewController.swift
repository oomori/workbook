//
//  ViewController.swift
//  NSWindowSB_doc
//
//  Created by air on 2015/02/17.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var windowArray : NSMutableArray = []
    @IBAction func function001(sender: AnyObject) {
//        let win = NSWindow(contentRect: NSMakeRect(100, 100, 400, 200),
//            styleMask: NSResizableWindowMask | NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask,
//            backing: NSBackingStoreType.Buffered, defer: true)
//        win.orderFront(self)
//        win.makeKeyAndOrderFront(win)
//        //win.collectionBehavior = NSWindowCollectionBehavior.FullScreenPrimary
//        //win.toggleFullScreen(self)
//        NSLog("!!%@",win)
        
        var window : NSWindow = NSWindow(contentRect: NSMakeRect(0, 0, 800, 600), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(window)
        window.center()
        window.title = "Minimal Swift WebKit Browser"
        window.orderFront(self)
        window.makeKeyAndOrderFront(self)
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

