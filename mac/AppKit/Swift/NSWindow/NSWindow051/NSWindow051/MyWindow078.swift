//
//  MyWindow078.swift
//  NSWindow051
//
//  Created by air on 2015/03/29.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class MyWindow078: NSWindow,NSWindowDelegate {
    func windowDidResize(notification: NSNotification) {
        NSLog("windowDidResize")
    }
    
//    func windowDidUpdate(notification: NSNotification) {
//        NSLog("windowDidUpdate")
//    }
}
