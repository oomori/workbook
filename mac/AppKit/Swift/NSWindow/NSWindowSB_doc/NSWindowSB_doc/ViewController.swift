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

        
        var window : NSWindow = NSWindow(contentRect: NSMakeRect(0, 0, 800, 600), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(window)
        window.center()
        window.title = "Minimal Swift WebKit Browser"
        window.orderFront(self)
        window.makeKeyAndOrderFront(self)
    }
    //NSWindowSB_doc windowController()
    @IBAction func function002(sender: AnyObject) {
        var window : NSWindow = NSWindow(contentRect: NSMakeRect(0, 0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(window)
        window.center()
        window.title = "Window"
        window.orderFront(self)
        window.makeKeyAndOrderFront(self)
        
        //ウインドウのNSWinodowControllerを取得
        var windowContoroller : NSWindowController = sender.window.windowController() as NSWindowController
        
        NSLog("%@",windowContoroller.description )

        windowContoroller.close()
        
        
        
        
    }
    //NSWindowSB_doc
    @IBAction func function003(sender: AnyObject) {
    }
    //NSWindowSB_doc
    @IBAction func function004(sender: AnyObject) {
    }
    //NSWindowSB_doc
    @IBAction func function005(sender: AnyObject) {
    }
    //NSWindowSB_doc
    @IBAction func function006(sender: AnyObject) {
    }
    //NSWindowSB_doc
    @IBAction func function007(sender: AnyObject) {
    }
    //NSWindowSB_doc
    @IBAction func function008(sender: AnyObject) {
    }
    //NSWindowSB_doc
    @IBAction func function009(sender: AnyObject) {
    }
    //NSWindowSB_doc
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

