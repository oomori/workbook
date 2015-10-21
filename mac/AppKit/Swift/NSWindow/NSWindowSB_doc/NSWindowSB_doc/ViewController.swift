//
//  ViewController.swift
//  NSWindowSB_doc
//
//  Created by air on 2015/02/17.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//  convert Swift 1.2 -> 2.0 2015/10/21

import Cocoa

class ViewController: NSViewController {
    //ウインドウを保持する配列
    var windowArray : NSMutableArray = []
    
    //NSWindowSB_doc windowController()
    //Swift2.0
    @IBAction func function001(sender: AnyObject) {

        
        let window : NSWindow = NSWindow(contentRect: NSMakeRect(0, 0, 800, 600), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(window)
        window.center()
        window.title = "Minimal Swift WebKit Browser"
        window.orderFront(self)
        window.makeKeyAndOrderFront(self)
    }
    //NSWindowSB_doc windowController()
    //Swift2.0
    @IBAction func function002(sender: AnyObject) {
        let window : NSWindow = NSWindow(contentRect: NSMakeRect(0, 0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask, backing: .Buffered, `defer`: false)
        windowArray.addObject(window)
        window.center()
        window.title = "Window"
        window.orderFront(self)
        window.makeKeyAndOrderFront(self)
        
        //ウインドウのNSWinodowControllerを取得
        let windowContoroller : NSWindowController = ((sender as! NSButton).window?.windowController)!
        //Swift1.2 -> 2.0の変更
        //let windowContoroller : NSWindowController = sender.window().windowController() as! NSWindowController
        
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

