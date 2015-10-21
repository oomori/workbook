//
//  MyWindow068.swift
//  NSWindow051
//
//  Created by air on 2015/03/28.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class MyWindow068: NSWindow {
    
    
    override func setFrame(frameRect: NSRect, display flag: Bool) {
        super.setFrame(frameRect, display: flag )
        if (self.inLiveResize){
 
            let rects : NSRectArray = UnsafeMutablePointer<NSRect>.alloc(5)
            var count : NSInteger = 0


            self.contentView!.getRectsExposedDuringLiveResize( &rects[0] , count: &count)
            

            NSLog("%d",count)
            while (count-- > 0){
                self.contentView!.setNeedsDisplayInRect(rects[count])
                NSLog("(%.2f,%.2f-%.2f,%.2f)",Float(rects[count].origin.x),
                    Float(rects[count].origin.y),
                    Float(rects[count].size.width),
                    Float(rects[count].size.height))
            }

            
        }else{
            self.contentView?.needsDisplay = true
            //self.contentView.setNeedsDisplay()
        }
        
    }
}
