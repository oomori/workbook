//
//  MyButton.swift
//  NSButton
//
//  Created by air on 2015/03/01.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class MyButton: NSButton {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
    override func performKeyEquivalent(key: NSEvent) -> Bool {
        super.performKeyEquivalent(key)
        NSLog("key PUSH!")
        return true 
    }
}
