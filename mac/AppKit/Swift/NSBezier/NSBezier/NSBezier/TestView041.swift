//
//  TestView041.swift
//  NSBezierPath
//  drawLayerでの描画
//
//  Created by air on 2015/03/07.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class TestView041: NSView {

    //現在のマウスカーソルの位置
    var mouselocation : NSPoint = NSZeroPoint
    
    //描画
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        
        
        CGContextSetRGBFillColor(ctx, 0.5, 0.0, 0.0, 1.0)
        let rect = CGRectInset(self.bounds, 40, 40)
        let endAngle:CGFloat =  CGFloat(2.0 * M_PI)
        CGContextFillRect(ctx, rect)

        if (mouselocation != NSZeroPoint){
            CGContextSaveGState(ctx);
            CGContextSetLineWidth(ctx,5);
            CGContextSetRGBStrokeColor(ctx,0.8,0.8,0.8,1.0);
            CGContextAddArc(ctx,mouselocation.x,mouselocation.y,30,0.0,endAngle,1);
            CGContextStrokePath(ctx);
        }
        
        //NSLog("!!! %@",aBezier.description)
        //NSLog("layer %.2f",mouselocation.x)
        }
    override func drawRect(dirtyRect: NSRect) {
        //super.drawRect(dirtyRect)
        
    }
    
    //マウスダウンイベント。面倒なのでマウスダウンの後ドラッグやマウスアップの処理もここで行う
    //Swift1.2
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
