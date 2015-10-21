//
//  AppDelegate.swift
//  NSApplication
//
//  Created by air on 2014/12/30.
//  Copyright (c) 2014年 oomori. All rights reserved.
//
//  convert Swift 1.1 -> 2.0 2015/10/21
import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    //NSApplication.sharedApplication()
    func function001()  {
        
        let anApplication = NSApplication.sharedApplication()
        
        NSLog("Shared Application Object: \(anApplication).")
        
    }
    //NSApplication delegate
    func function002()  {
        
        let anApplication = NSApplication.sharedApplication()
        let obj = anApplication.delegate
        NSLog("Delegate Object: \(obj).")
        
    }

    
    //NSApplication applicationIconImage
    @IBOutlet weak var imageView: NSImageView!
    @IBAction func function003(sender: AnyObject) {
        NSLog("function003 called")
        let anApplication = NSApplication.sharedApplication()
        let imageObj:NSImage = anApplication.applicationIconImage
        NSLog("Image Object: \(imageObj).")
        imageView.image = imageObj
        
    }
    
    //NSApplication terminate
    func update() {
        NSLog("fire")
    }
    @IBAction func function004(sender: AnyObject) {
        NSLog("function004 called")
        let anApplication = NSApplication.sharedApplication()
        //anApplication.terminate(sender)
        NSLog("%@",anApplication.description)
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        NSLog("%@",timer.description)
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSLog("applicationDidFinishLaunching")
        function001()
        function002()
    }
    func applicationWillFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSLog("applicationWillFinishLaunching")
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        NSLog("applicationWillTerminate")
        
    }


}


