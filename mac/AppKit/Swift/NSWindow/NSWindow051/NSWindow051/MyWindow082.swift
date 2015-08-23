//
//  MyWindow082.swift
//  NSWindow051
//
//  Created by air on 2015/03/29.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

//NSWindow resignMainWindow()
//NSWindow becomeMainWindow()
class MyWindow082: NSWindow {
    override func resignMainWindow() {
        super.resignMainWindow()
        NSLog("resignMainWindow %@",self.title!)
    }

    override func becomeMainWindow() {
        super.becomeMainWindow()
        NSLog("becomeMainWindow %@",self.title!)
    }

}
