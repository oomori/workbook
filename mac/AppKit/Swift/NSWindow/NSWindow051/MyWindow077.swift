//
//  MyWindow077.swift
//  NSWindow051
//
//  Created by air on 2015/03/29.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class MyWindow077: NSWindow,NSWindowDelegate {
    
    func windowDidChangeOcclusionState(notification: NSNotification) {
        switch ((notification.object as! NSWindow ).occlusionState){
        case NSWindowOcclusionState.Visible:
            NSLog("---Visible")
        default:
            NSLog("---default %u",NSWindowOcclusionState.Visible.rawValue)
            NSLog("---default %u",(notification.object as! NSWindow ).occlusionState.rawValue)
        }
        
    }
    

}
