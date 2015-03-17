//
//  TestView029.swift
//  NSBezier
//
//  Created by air on 2015/03/10.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class TestView029: NSView {
    //現在のマウスカーソルの位置
    var mouselocation : NSPoint = NSMakePoint(250.0, 100.0)
    
    //描画メソッド

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 250.0,y: 40.0))
        aBezier.lineToPoint(CGPoint(x: 80.0,y: 40.0))
        
        if (mouselocation != NSZeroPoint){
            aBezier.lineToPoint(mouselocation)
        }
        let lineWidth :CGFloat = 20.0
        aBezier.lineWidth = lineWidth
        
        aBezier.stroke()
        
        
        NSLog("defaultMiterLimit %f",Float(NSBezierPath.defaultMiterLimit()))
        NSLog("miterLimit %f",Float(aBezier.miterLimit))
        //説明用
        //角度　上が0°
        var radian = atan2(Double(mouselocation.x - 80.0 ),
            Double(mouselocation.y - 40.0 ))
        var teihen = ((Double(20.0)) / Double(tan( Double(radian -  3.14159265359/2) )))
        NSLog("!!! %f,%f",radian * 180 / 3.14159265359,teihen)
        //NSLog("!!! %f,%f",radian,teihen)
        
        NSColor.yellowColor().setStroke()
        if ((radian < 1.5) && (radian > 0)){
            let bBezier : NSBezierPath = NSBezierPath()
            bBezier.moveToPoint(CGPoint(x: 80.0 - teihen + 10.0,y: 30.0))
            bBezier.lineToPoint(CGPoint(x: 80.0 - teihen + 10.0,y: 30.0 + 20.0))
            
            //斜めの線
            bBezier.moveToPoint(CGPoint(x: 80.0 + teihen - 10.0,y: 30.0))
            bBezier.lineToPoint(CGPoint(x: 80.0 - teihen + 10.0,y: 30.0 + 20.0))
            
            bBezier.lineWidth = 2.0
            bBezier.stroke()
        }
        //NSLog("!!! %@",aBezier.description)
        

        
    }
    
    //マウスダウンイベント。面倒なのでマウスダウンの後ドラッグやマウスアップの処理もここで行う
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
                untilDate:(NSDate.distantPast() as NSDate),
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
