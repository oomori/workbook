//
//  TestView037.swift
//  NSBezierPath
//  drawrectで書くパターン
//  Created by air on 2015/03/14.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class TestView037: NSView {
    //現在のマウスカーソルの位置
    var mouselocation : NSPoint = NSZeroPoint
    
    //描画メソッド
    func drawObject(){
        
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 176.95,y: 44.90))
        aBezier.curveToPoint(CGPoint(x: 166.71,y: 145.89),
            controlPoint1: CGPoint(x: 76.63,y: 76.78),
            controlPoint2: CGPoint(x: 82.59,y: 206.70))
        aBezier.curveToPoint(CGPoint(x: 176.95,y: 44.90),
            controlPoint1: CGPoint(x: 237.55,y: 224.76),
            controlPoint2: CGPoint(x: 276.83,y: 95.98))
        aBezier.closePath()
        
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        let bBezier : NSBezierPath = NSBezierPath()
        if (mouselocation != NSZeroPoint){
            bBezier.appendBezierPathWithOvalInRect(NSMakeRect(mouselocation.x-10.0, mouselocation.y-30.0, 20.0, 20.0))
        }
        
        if (aBezier.containsPoint(NSMakePoint(mouselocation.x, mouselocation.y-20.0))){
            NSColor.yellowColor().setFill()
            NSColor.greenColor().setStroke()
            bBezier.lineWidth = 10.0
        }else{
            NSColor.magentaColor().setFill()
            bBezier.lineWidth = 2.0
        }
        bBezier.fill()
        bBezier.stroke()
        

        //NSLog("!!! %@",aBezier.description)
    }
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        drawObject()
    }
    
    //マウスダウンイベント。面倒なのでマウスダウンの後ドラッグやマウスアップの処理もここで行う
    override func mouseDown(theEvent: NSEvent) {
        var newEvent: NSEvent!
        
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
                    mouselocation.x = newEvent.locationInWindow.x
                    mouselocation.y = newEvent.locationInWindow.y
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
