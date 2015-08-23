//
//  CustomTableView.swift
//  NSWindow051
//
//  Created by air on 2015/03/28.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class CustomTableView: NSTableView {
    //NSWindow inLiveResize
    override func setFrameSize(newSize: NSSize) {
        
        if ((self.window?.inLiveResize) != nil){
            NSLog("Live resize" )
            
        }else{
            NSLog("Not live resize" )
            super.setFrameSize(newSize)
        }
    }
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
}
