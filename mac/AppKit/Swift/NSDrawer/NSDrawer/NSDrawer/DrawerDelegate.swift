//
//  DrawerDelegate.swift
//  NSDrawer
//
//  Created by air on 2015/04/05.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//Swift2.0
import Cocoa

class DrawerDelegate: NSObject ,NSDrawerDelegate{

    func drawerDidClose(notification: NSNotification) {
        NSLog("drawerDidClose")
    }
    
    //NSDrawer edge
    //NSDrawer preferredEdge
    //Swift1.2
    func drawerDidOpen(notification: NSNotification) {
        let obj : NSDrawer = notification.object as! NSDrawer
       
        
        switch (obj.edge){
        case NSRectEdge.MinX:
            NSLog("左")
        case NSRectEdge.MinY:
            NSLog("下")
        case NSRectEdge.MaxX:
            NSLog("右")
        case NSRectEdge.MaxY:
            NSLog("上")
        //default:
          //  NSLog("default")
        }
        
        switch (obj.preferredEdge){
        case NSRectEdge.MinX:
            NSLog("左")
        case NSRectEdge.MinY:
            NSLog("下")
        case NSRectEdge.MaxX:
            NSLog("右")
        case NSRectEdge.MaxY:
            NSLog("上")
            //default:
            //NSLog("default")
        }
        
    }
    func drawerShouldClose(sender: NSDrawer) -> Bool {
        NSLog("drawerShouldClose")
        return true
    }
    func drawerShouldOpen(sender: NSDrawer) -> Bool {
        NSLog("drawerShouldOpen")
        return true
    }
    func drawerWillClose(notification: NSNotification) {
        NSLog("drawerWillClose")
    }
    func drawerWillOpen(notification: NSNotification) {
        NSLog("drawerWillOpen")
    }
    func drawerWillResizeContents(sender: NSDrawer, toSize contentSize: NSSize) -> NSSize {
        NSLog("drawerWillResizeContents")
        return contentSize
    }

}
