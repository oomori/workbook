//
//  ClickThroughButton.swift
//  NSApplication
//
//  Created by air on 2015/02/01.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

//function037の検証用
import Foundation
import AppKit
@objc(ClickThroughButton)


//作業中
class ClickThroughButton: NSButton {
    override func shouldDelayWindowOrderingForEvent(theEvent: NSEvent) -> Bool {
        let anApplication = MyApplication.sharedApplication()
        return anApplication.active
    }
    
    override func mouseDown(theEvent: NSEvent) {
        let anApplication = MyApplication.sharedApplication()
        if (!anApplication.active){
            NSLog("NO Active")
            anApplication.preventWindowOrdering()
            
            self.highlight(true )
            let theDate:NSDate = NSDate.distantFuture() as NSDate
            let maskUp = NSEventMask.LeftMouseUpMask.rawValue
            let mask = Int( maskUp  ) // cast from UInt
        
        var mouseUpEvent = (anApplication.nextEventMatchingMask(
                Int(mask) ,
                untilDate:(NSDate.distantPast() as NSDate),
                inMode:NSDefaultRunLoopMode,
                dequeue:true))as NSEvent?
        
        if(mouseUpEvent != nil){
        var aPoint :NSPoint = mouseUpEvent!.locationInWindow //NSMakePoint(10.0, 10.0)
        var mouseLocation : NSPoint = self.convertPoint(aPoint, fromView: self)
        var mouseUpInside = self.mouse(mouseLocation, inRect: self.bounds)
        }
        
        self.highlight(false  )

        }else{
            NSLog("YES Active")
            super.mouseDown(theEvent )
        }

    }
}