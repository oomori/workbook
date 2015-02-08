//
//  MyImageView.swift
//  NSApplication
//
//  Created by air on 2014/12/31.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

import AppKit
@objc(MyImageView)

class MyImageView: NSImageView {
    
    override func mouseDown(theEvent: NSEvent) {
        var newEvent: NSEvent!
        NSLog("start")
        //NSApp.preventWindowOrdering()

        let maskUp = NSEventMask.LeftMouseUpMask.rawValue
        let maskDragged = NSEventMask.LeftMouseDraggedMask.rawValue
        let mask = Int( maskUp | maskDragged ) // cast from UInt
        let anApplication = NSApplication.sharedApplication()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        }
        
        var keepOn = true
        while keepOn {
            newEvent = anApplication.nextEventMatchingMask(
                Int(mask) ,
                untilDate:(NSDate.distantPast() as NSDate),
                inMode:NSDefaultRunLoopMode,
                dequeue:true)            
            NSLog("loop")
            
            //var tempEvent = newEvent
            if (newEvent != nil) {
            if newEvent.type == .LeftMouseUp {
                keepOn = false
            }
            }
        }
        dispatch_async(dispatch_get_main_queue()) {
            NSLog("finishLaunching")
        }
    }

    

}