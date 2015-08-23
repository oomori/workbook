//
//  MyWindow067.swift
//  NSWindow051
//
//  Created by air on 2015/03/28.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class MyWindow067: NSWindow {

    //NSWindow inLiveResize
    override func setFrame(frameRect: NSRect, display flag: Bool) {
        super.setFrame(frameRect, display: flag )
        NSLog("setFrame call")
        if (self.inLiveResize){
            NSLog("Live resize" )
            
        }else{
            NSLog("Not live resize" )

        }

    }
}
