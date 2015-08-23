//
//  MyView086.swift
//  NSWindow051
//
//  Created by air on 2015/04/01.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class MyView086: NSView {

    var delta : Float = 0.0
    var needDisplayAreaArray : [NSRect] = []

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
//    }
//
//    override func drawLayer(layer: CALayer!, inContext ctx: CGContext!) {
        
        //バックグラウンドカラーを描画
        let backgroundColor = NSColor.whiteColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: (176.95 - CGFloat(delta)),y: 44.90))
        aBezier.curveToPoint(CGPoint(x: 166.71 - CGFloat(delta) ,y: 145.89),
            controlPoint1: CGPoint(x: 76.63 - CGFloat(delta) ,y : 76.78),
            controlPoint2: CGPoint(x: 82.59 - CGFloat(delta),y: 206.70))
        aBezier.curveToPoint(CGPoint(x: 176.95 - CGFloat(delta),y: 44.90),
            controlPoint1: CGPoint(x: 237.55 - CGFloat(delta),y: 224.76),
            controlPoint2: CGPoint(x: 276.83 - CGFloat(delta),y: 95.98))
        aBezier.closePath()
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        let bBezier : NSBezierPath = NSBezierPath()
        bBezier.moveToPoint(CGPoint(x: (176.95 ),y: 44.90 - CGFloat(delta)))
        bBezier.curveToPoint(CGPoint(x: 166.71 ,y: 145.89 - CGFloat(delta)),
            controlPoint1: CGPoint(x: 76.63 ,y : 76.78 - CGFloat(delta)),
            controlPoint2: CGPoint(x: 82.59 ,y: 206.70 - CGFloat(delta)))
        bBezier.curveToPoint(CGPoint(x: 176.95 ,y: 44.90 - CGFloat(delta)),
            controlPoint1: CGPoint(x: 237.55 ,y: 224.76 - CGFloat(delta)),
            controlPoint2: CGPoint(x: 276.83 ,y: 95.98 - CGFloat(delta)))
        bBezier.closePath()
        bBezier.fill()
        bBezier.lineWidth = 2.0
        bBezier.stroke()
        
        needDisplayAreaArray.removeAll(keepCapacity: false)
        needDisplayAreaArray.append(NSMakeRect(aBezier.bounds.origin.x-2.0,aBezier.bounds.origin.y - 2.0,
                                            aBezier.bounds.size.width+4.0,aBezier.bounds.size.height + 4.0 ))
        needDisplayAreaArray.append(NSMakeRect(bBezier.bounds.origin.x-2.0,bBezier.bounds.origin.y - 2.0,
                                            bBezier.bounds.size.width+4.0,bBezier.bounds.size.height + 4.0 ))

    }
    
}
