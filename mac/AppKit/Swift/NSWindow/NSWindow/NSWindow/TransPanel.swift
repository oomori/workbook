//
//  TransPanel.swift
//  NSWindow
//
//  Created by air on 2015/02/22.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class TransPanel: NSWindow {
    override func invalidateShadow(){
        NSLog("invalidateShadow()")
    }
    override func mouseDown(theEvent: NSEvent) {
        var newEvent: NSEvent!
        NSLog("start")
        //NSApp.preventWindowOrdering()
        let maskDown = NSEventMask.LeftMouseDownMask.rawValue       // 2
        let maskUp = NSEventMask.LeftMouseUpMask.rawValue           // 4
        let maskDragged = NSEventMask.LeftMouseDraggedMask.rawValue //64
        let mask = Int( maskDown | maskUp | maskDragged ) // cast from UInt
        let anApplication = NSApplication.sharedApplication()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        }
        var beforeLocation : NSPoint = NSZeroPoint
        var keepOn = true
        while keepOn {
            newEvent = anApplication.nextEventMatchingMask(
                Int(mask) ,
                untilDate:(NSDate.distantPast() as NSDate),
                inMode:NSDefaultRunLoopMode,
                dequeue:true)
            //NSLog("loop %d",mask)
            
            var newLocation : NSPoint
            if (newEvent != nil) {
                let tempEvent : NSEvent = newEvent

                
                if tempEvent.type == .LeftMouseDown {
                    beforeLocation = NSMakePoint(tempEvent.locationInWindow.x,tempEvent.locationInWindow.y)
                    NSLog("beforeLocation %f",beforeLocation.x)
                    //NSLog("---- %f,%f",Float(newLocation.x),Float( newLocation.y))                    
                }
                if tempEvent.type == .LeftMouseDragged {
                    newLocation = NSMakePoint(newEvent.locationInWindow.x,tempEvent.locationInWindow.y)
                    //NSLog("---- %f",Float(tempEvent.locationInWindow.x))
                    
                    
                    var beforePositionX : CGFloat = CGFloat(beforeLocation.x)
                    //NSLog("beforePositionX %f",beforePositionX)
                    var positionX : CGFloat = CGFloat(tempEvent.locationInWindow.x )
                    var positionY : CGFloat = CGFloat(tempEvent.locationInWindow.y )
                    self.setFrame(NSMakeRect(positionX , positionY, 300, 200), display: false  )
                    
                }
                if tempEvent.type == .LeftMouseUp {
                    keepOn = false
                    
                    newLocation = NSMakePoint(newEvent.locationInWindow.x,tempEvent.locationInWindow.y)
                    //NSLog("---- %f",Float(tempEvent.locationInWindow.x))
                    NSLog("newLocation %f",Float(newLocation.x))
                    var positionX : CGFloat = CGFloat(tempEvent.locationInWindow.x )
                    var positionY : CGFloat = CGFloat(tempEvent.locationInWindow.y )
                    self.setFrame(NSMakeRect(positionX , positionY, 300, 200), display: false  )
                }
                
                
                
                
            }
        }
        dispatch_async(dispatch_get_main_queue()) {
            NSLog("finishLaunching")
        }
    }

}
