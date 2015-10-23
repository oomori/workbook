//
//  AppDelegate.swift
//  Caliculate
//
//  Created by air on 2015/01/15.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//  convert Swift 1.1 -> 2.0 2015/10/23

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var resultTextField: NSTextField!
    
    //四則演算　定数 let
    @IBAction func finction001(sender: AnyObject) {
        let myConstant :Double = 42.12
        resultTextField.doubleValue = myConstant
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

