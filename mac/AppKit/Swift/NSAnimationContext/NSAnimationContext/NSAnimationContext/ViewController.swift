//
//  ViewController.swift
//  NSAnimationContext
//
//  Created by air on 2015/02/15.
//  Copyright (c) 2015年 oomori. All rights reserved.
//  Swift1.2

import Cocoa

class ViewController: NSViewController {

    required init?(coder: NSCoder) {
        didMoveView = false
        super.init(coder: coder)
    }
    @IBOutlet var fiestView: NSView!
    @IBOutlet var secondView: NSView!
    var didMoveView : Bool
    @IBOutlet weak var imageView001: NSImageView!
    //NSAnimationContext
    @IBAction func function001(sender: AnyObject) {
        let newPoint : NSPoint = didMoveView ? NSMakePoint(0.0, 0.0):NSMakePoint(200.0, 0.0)
        imageView001.animator().setFrameOrigin(newPoint)
        didMoveView = !didMoveView
    }
    //NSAnimationContext beginGrouping
    //NSAnimationContext endGrouping
    @IBAction func function002(sender: AnyObject) {
        //var appDelegate = NSApplication.sharedApplication().delegate
        let window : NSWindow = self.view.window!
        
        NSAnimationContext.beginGrouping()
            let nowPosition : NSPoint = window.frame.origin
            let newRect : NSRect = didMoveView ?
                            NSMakeRect(nowPosition.x,nowPosition.y, 500.0, 500.0):
                            NSMakeRect(nowPosition.x,nowPosition.y, 200.0, 200.0)
            window.animator().setFrame(newRect, display: true)
            window.animator().alphaValue = didMoveView ? 1.0 : 0.5
        NSAnimationContext.endGrouping()
        didMoveView = !didMoveView
    }
    //NSAnimationContext completionHandler
    //NSAnimationContext currentContext
    //NSAnimationContext duration
    //NSAnimationContext timingFunction
    @IBAction func function003(sender: AnyObject) {
        //var appDelegate = NSApplication.sharedApplication().delegate
        let window : NSWindow = self.view.window!
        
        NSAnimationContext.beginGrouping()
        let nowPosition : NSPoint = window.frame.origin
        let newRect : NSRect = didMoveView ?
            NSMakeRect(nowPosition.x,nowPosition.y, 500.0, 500.0):
            NSMakeRect(nowPosition.x,nowPosition.y, 500.0, 200.0)
        window.animator().setFrame(newRect, display: true)
        window.animator().alphaValue = didMoveView ? 1.0 : 0.5
        NSAnimationContext.currentContext().duration = 10.0
        let timing : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        NSAnimationContext.currentContext().timingFunction = timing
        NSAnimationContext.currentContext().completionHandler = {NSLog("end!")}
        NSAnimationContext.endGrouping()
        didMoveView = !didMoveView
    }
    //NSAnimationContext runAnimationGroup
    @IBAction func function004(sender: AnyObject) {
        //var appDelegate = NSApplication.sharedApplication().delegate
        let window : NSWindow = self.view.window!
        
        let nowPosition : NSPoint = window.frame.origin
        let newRect : NSRect = didMoveView ?
            NSMakeRect(nowPosition.x,nowPosition.y, 500.0, 500.0):
            NSMakeRect(nowPosition.x,nowPosition.y, 500.0, 200.0)
        
        NSAnimationContext.runAnimationGroup({ context in
            window.animator().setFrame(newRect, display: true)
            window.animator().alphaValue = self.didMoveView ? 1.0 : 0.5
            }, completionHandler: nil)
        didMoveView = !didMoveView
    }
    //NSAnimationContext allowsImplicitAnimation
    @IBOutlet weak var button005: NSButton!
    @IBAction func function005(sender: AnyObject) {
        
        
        
        let redLeftConstraint : NSLayoutConstraint = NSLayoutConstraint(item: button005!,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.button005.superview,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1, constant: 50)
        //button005.superview?.removeConstraint(redLeftConstraint)
        button005.superview?.addConstraint(redLeftConstraint)
        
        /*
        var viewDictionary:Dictionary = ["button005": button005]
        var topSpaceConstraintArray:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[button005]-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary)
        
        button005.superview?.addConstraints(topSpaceConstraintArray)
        */
        button005.superview?.wantsLayer = true

        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 2.0
            context.allowsImplicitAnimation = true
            self.button005.superview?.layoutSubtreeIfNeeded()
            }, completionHandler: nil)
 
        
    }
    //NSAnimationContext
    @IBAction func function006(sender: AnyObject) {
        
    }
    //NSAnimationContext
    @IBAction func function007(sender: AnyObject) {
        
    }
    //NSAnimationContext
    @IBAction func function008(sender: AnyObject) {
        
    }
    //NSAnimationContext
    @IBAction func function009(sender: AnyObject) {
        
    }
    //NSAnimationContext
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

