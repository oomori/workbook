//
//  MyImageView068.swift
//  NSWindow051
//
//  Created by air on 2015/03/28.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class MyImageView068: NSImageView {
    //NSWindow inLiveResize
    override func getRectsBeingDrawn(rects: UnsafeMutablePointer<UnsafePointer<NSRect>>, count: UnsafeMutablePointer<Int>) {
        NSLog("getRectsBeingDrawn!!!")
        super.getRectsBeingDrawn(rects,count: count)
    }
    override func drawRect(dirtyRect: NSRect) {
        //NSLog("drawRect call")
        //ライブリサイズ中かどうかで処理を分ける
        if (self.inLiveResize){
            super.drawRect(dirtyRect)
            //バックグラウンドカラーを描画
            let backgroundColor = NSColor.redColor()
            backgroundColor.setFill()
            //NSRectFill(dirtyRect)
            NSRectFill(NSMakeRect(0.0,0.0,10.0,10.0))
            NSRectFill(NSMakeRect(10.0,10.0,10.0,10.0))
            
            
        }else{
            //NSLog("Not live resize" )
            super.drawRect(dirtyRect)
            self.setNeedsDisplay()
        }
     
    }
    
}
