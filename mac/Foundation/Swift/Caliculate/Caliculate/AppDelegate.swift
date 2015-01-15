//
//  AppDelegate.swift
//  Caliculate
//
//  Created by air on 2015/01/15.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var resultTextField: NSTextField!
    
    //四則演算　定数 let
    @IBAction func finction001(sender: AnyObject) {
        let myConstant :Double = 42.12
        NSLog("%.2f", myConstant)
        resultTextField.doubleValue = myConstant
        
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

