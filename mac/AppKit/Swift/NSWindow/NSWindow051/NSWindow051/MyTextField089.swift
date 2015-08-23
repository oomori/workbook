//
//  MyTextField089.swift
//  NSWindow051
//
//  Created by air on 2015/04/04.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

//NSWindow　disableKeyEquivalentForDefaultButtonCell()
//NSWindow　enableKeyEquivalentForDefaultButtonCell()
class MyTextField089: NSTextField {

    //編集開始
    override func textDidBeginEditing(notification: NSNotification) {
        //ウインドウのデフォルトボタンが反応しないように
        self.window?.disableKeyEquivalentForDefaultButtonCell()
        super.textDidBeginEditing(notification)
        NSLog("textDidBeginEditing")
    }
    //編集終了
    override func textDidEndEditing(notification: NSNotification) {
        //ウインドウのデフォルトのボタン反応するように
        self.window?.enableKeyEquivalentForDefaultButtonCell()
        super.textDidEndEditing(notification)
        NSLog("textDidEndEditing")
    }
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
}
