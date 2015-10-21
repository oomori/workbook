//
//  TestView038.swift
//  NSBezierPath
//  drawrectで書くパターン
//  Created by air on 2015/03/07.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//
//  convert Swift 1.1 -> 2.0 2015/10/21

import Cocoa

class TestView038: NSView {
    //現在のマウスカーソルの位置
    var mouselocation : NSPoint = NSMakePoint(166.71,145.89)
    
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
        aBezier.curveToPoint(mouselocation ,
            controlPoint1: CGPoint(x: mouselocation.x - 90.08,y: mouselocation.y - 69.11),
            controlPoint2: CGPoint(x: mouselocation.x - 84.12,y: mouselocation.y + 40.0))
        aBezier.curveToPoint(CGPoint(x: 176.95,y: 44.90),
            controlPoint1: CGPoint(x: 237.55,y: mouselocation.y + 40.0),
            controlPoint2: CGPoint(x: 276.83,y: mouselocation.y - 40.0))
        aBezier.closePath()

        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        
        //説明 bounds
        let boundsPathBounds : NSRect = aBezier.bounds
        NSColor.blueColor().setStroke()
        let bBezier : NSBezierPath = NSBezierPath()
        NSBezierPath.strokeRect(boundsPathBounds)
        bBezier.lineWidth = 2.0
        bBezier.stroke()
        
        //説明 controlPointBounds
        let controlPointBounds : NSRect = aBezier.controlPointBounds
        NSColor.greenColor().setStroke()
        let cBezier : NSBezierPath = NSBezierPath()
        NSBezierPath.strokeRect(controlPointBounds)
        cBezier.lineWidth = 2.0
        cBezier.stroke()

        let elementCount : Int = aBezier.elementCount
        for (var i = 1 ; i < elementCount ; i++){
            var elementPoint : [NSPoint] = [NSMakePoint(0.0,0.0),NSMakePoint(0.0,0.0),NSMakePoint(0.0,0.0)]
            let element : NSBezierPathElement = aBezier.elementAtIndex(i , associatedPoints: &elementPoint)
            let aPoint0 : NSPoint = elementPoint[0]  //動かしている点のコントロールポイント2
            let aPoint1 : NSPoint = elementPoint[1]  //動かしている点のコントロールポイント1
            let aPoint2 : NSPoint = elementPoint[2]  //動かしている点のアンカーポイント
            NSLog("%.2f,%.2f",Float(aPoint2.x),Float(aPoint2.y))
            switch element {
            case .MoveToBezierPathElement:
                NSLog("MoveToBezierPathElement")
                
            case .LineToBezierPathElement:
                NSLog("LineToBezierPathElement")
            case .CurveToBezierPathElement:
                NSLog("CurveToBezierPathElement")
                
                //コントロールポイント
                NSColor.purpleColor().setFill()
                let c1Bezier : NSBezierPath = NSBezierPath()
                c1Bezier.appendBezierPathWithOvalInRect(NSMakeRect(aPoint0.x-5.0, aPoint0.y-5.0, 10.0, 10.0))
                c1Bezier.fill()
                NSColor.purpleColor().setFill()
                let c2Bezier : NSBezierPath = NSBezierPath()
                c2Bezier.appendBezierPathWithOvalInRect(NSMakeRect(aPoint1.x-5.0, aPoint1.y-5.0, 10.0, 10.0))
                c2Bezier.fill()
                
                //アンカーポイント
                NSColor.greenColor().setFill()
                let anchorBezier : NSBezierPath = NSBezierPath()
                anchorBezier.appendBezierPathWithOvalInRect(NSMakeRect(aPoint2.x-5.0, aPoint2.y-5.0, 10.0, 10.0))
                anchorBezier.fill()

                NSLog("c2Bezier (%.2f,%.2f)",Float(c2Bezier.currentPoint.x),Float(c2Bezier.currentPoint.y))
                
            case .ClosePathBezierPathElement:
                NSLog("ClosePathBezierPathElement")
            //default:
              //  NSLog("default")
            }
            
            
            

        }
        
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        drawObject()
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
