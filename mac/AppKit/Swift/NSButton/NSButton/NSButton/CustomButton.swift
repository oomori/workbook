//
//  CustomButton.swift
//  NSButton
//
//  Created by air on 2015/04/05.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

//@IBDesignable追加
@IBDesignable class CustomButton: NSView {

    //@IBInspectable追加
    @IBInspectable var scale : Float = 1.0
    @IBInspectable var lineWidth : CGFloat = 0.0

    override var opaque: Bool {
        //get { return super.opaque }
        get { return false }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        let backgroundColor = NSColor.clearColor()
        backgroundColor.setFill()
        NSRectFill(NSMakeRect(0, 0, 300.0, 178.0))
        
        //NSRectFillUsingOperation(NSMakeRect(0, 0, 300.0, 178.0), NSCompositingOperation.CompositeSourceOver);
        
        NSColor.redColor().setStroke()
        NSColor.magentaColor().setFill()
        //空のベジェパスを作成
        let aBezier : NSBezierPath = NSBezierPath()
        aBezier.moveToPoint(CGPoint(x: 96.95,y: 4.90))
        aBezier.curveToPoint(CGPoint(x: 86.71,y: 105.89),
            controlPoint1: CGPoint(x: -16.63,y: 36.78),
            controlPoint2: CGPoint(x: 2.59,y: 166.70))
        aBezier.curveToPoint(CGPoint(x: 96.95,y: 4.90),
            controlPoint1: CGPoint(x: 157.55,y: 184.76),
            controlPoint2: CGPoint(x: 196.83,y: 55.98))
        aBezier.closePath()
        aBezier.fill()
        aBezier.lineWidth = self.lineWidth
        aBezier.stroke()
        // Drawing code here.
    }
    
}
