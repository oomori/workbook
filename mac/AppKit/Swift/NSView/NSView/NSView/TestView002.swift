//
//  TestView002.swift
//  NSBezier
//
//  Created by air on 2015/06/02.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class TestView002: NSView {
    //最初のマウスカーソルの位置
    var mouselocation : NSPoint = NSMakePoint(200.0, 400.0)
    
    //描画メソッド
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        
        let myFont : NSFont = NSFont(name: "HiraMaruPro-W4", size: 69.0)!
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        let bBezier : NSBezierPath = NSBezierPath()
        var aGlyphs : [NSGlyph] = [ myFont.glyphWithName("gid935"),//カ
                                    myFont.glyphWithName("gid997"),//ラ
                                    myFont.glyphWithName("gid934"),//オ
                                    myFont.glyphWithName("gid941")//ケ
            //"numbersign"
                                    ]
        
        aBezier.moveToPoint(CGPoint(x: 10.0,y: 75.0))
        aBezier.appendBezierPathWithGlyphs( &aGlyphs , count: 4, inFont: myFont)
        bBezier.moveToPoint(CGPoint(x: 10.0,y: 75.0))
        bBezier.appendBezierPathWithGlyphs( &aGlyphs , count: 4, inFont: myFont)
        
        
        let cBezier : NSBezierPath = NSBezierPath()
        
        cBezier.appendBezierPathWithRect(
                CGRect( x: 10.0,
                        y: 0.0,
                        width:mouselocation.x-10.0,
                        height: 150 ))
            cBezier.addClip()
                    NSColor.redColor().setStroke()
            NSColor.redColor().setFill()
            aBezier.lineWidth = 10.0
            aBezier.fill()
            aBezier.stroke()
        
        
        NSColor.greenColor().setStroke()
        NSColor.greenColor().setFill()
        
        let dBezier : NSBezierPath = NSBezierPath()
        
        dBezier.appendBezierPathWithRect(
            CGRect( x: 0,
                y: 0.0,
                width: 500 ,
                height: 150 ))
        dBezier.setClip()
        bBezier.fill()
    }
    
    //マウスダウンイベント。面倒なのでマウスダウンの後ドラッグやマウスアップの処理もここで行う
    //Swift1.2
    override func mouseDown(theEvent: NSEvent) {
        var newEvent: NSEvent!
        
        //デフォルトマイターリミットを設定
        NSBezierPath.setDefaultMiterLimit(5.0)
        
        //イベント取得
        let maskUp = NSEventMask.LeftMouseUpMask.rawValue
        let maskDragged = NSEventMask.LeftMouseDraggedMask.rawValue
        let maskDown = NSEventMask.LeftMouseDownMask.rawValue
        let mask = Int( maskUp | maskDragged | maskDown ) // cast from UInt
        let anApplication = NSApplication.sharedApplication()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        }
        
        var keepOn = true
        while keepOn {
            //マウスダウンして以降、左マウスアップするまでのイベントを取得
            newEvent = anApplication.nextEventMatchingMask(
                Int(mask) ,
                untilDate:(NSDate.distantPast() ),
                inMode:NSDefaultRunLoopMode,
                dequeue:true)
            
            //マウスドラッグイベントがあるか
            if (newEvent != nil) {
                //ある
                
                if newEvent.type == .LeftMouseUp {
                    //Left mouse UPなら
                    keepOn = false
                }else if ((newEvent.type == .LeftMouseDragged)||(newEvent.type == .LeftMouseDown)){
                    //マウスドラッグ
                    mouselocation.x = newEvent.locationInWindow.x-self.frame.origin.x
                    mouselocation.y = newEvent.locationInWindow.y-self.frame.origin.y
                }
                //再描画　できるだけ最小限に絞る。移動した範囲のみなどにする
                //self.setNeedsDisplayInRect(NSMakeRect(mouselocation.x-20.0, mouselocation.y-20.0, 40.0, 40.0))
                //全体の場合はこちら
                self.setNeedsDisplayInRect(self.frame)
                
            }
            
        }
        //マウスイベント終了
        dispatch_async(dispatch_get_main_queue()) {
            NSLog("finishLaunching")
        }
    }
    
}
