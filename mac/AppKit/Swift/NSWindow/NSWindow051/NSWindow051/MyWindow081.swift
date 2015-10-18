//
//  MyWindow081.swift
//  NSWindow051
//
//  Created by air on 2015/03/29.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

//NSWindow resignKeyWindow()
//NSWindow becomeKeyWindow()

class MyWindow081: NSWindow {
    override func resignKeyWindow() {
        super.resignKeyWindow()
        NSLog("resignKeyWindow %@",self.title)
    }
    
    override func becomeKeyWindow() {
        super.becomeKeyWindow()
        NSLog("becomeKeyWindow %@",self.title)
    }
}
