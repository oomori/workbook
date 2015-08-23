//
//  MyWindow.swift
//  NSWindow051
//
//  Created by air on 2015/03/18.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class MyWindow: NSWindow {

    override func constrainFrameRect(frameRect: NSRect, toScreen screen: NSScreen?) -> NSRect {
        
        NSLog("constrainFrameRect call")
        
        return NSMakeRect(100.0, 100.0, 300.0, 200.0)
    }
    
}
