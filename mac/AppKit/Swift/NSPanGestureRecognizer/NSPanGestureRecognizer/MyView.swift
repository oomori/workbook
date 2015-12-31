//
//  MyView.swift
//  NSAlignmentFeedbackFilter
//
//  Created by air on 2015/11/03.
//  Copyright © 2015年 oomori. All rights reserved.
//

import Cocoa

class MyView: NSView {
    
    //起動時の設定
    //パンした時にpan()を呼ぶ設定
    override func awakeFromNib() {
        let pan = NSPanGestureRecognizer(target: self, action: Selector("pan:"))
        self.addGestureRecognizer(pan)
        
        NSLog("Pan")
    }
    
    
    //パンした時
    func pan(pan: NSPanGestureRecognizer){
        let startingPoint: NSPoint = pan.locationInView(self)
        let distancePanned: NSPoint = pan.translationInView(self)
        
        if pan.state.rawValue == 3 {
            let drawingRect = CGRect(x: startingPoint.x, y: startingPoint.y, width: sqrt((distancePanned.x * distancePanned.x)), height: sqrt((distancePanned.y * distancePanned.y)))
            NSLog("Drawingrect is size \(drawingRect)")
            
            //プリントダイアログ
            //self.print("Drawingrect is size \(drawingRect)")
            setNeedsDisplayInRect(drawingRect)
        }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        // Drawing code here.
        super.drawRect(dirtyRect)
        NSColor.blackColor().set()
        let ovalPath = NSBezierPath(ovalInRect: dirtyRect)
        ovalPath.stroke()
    }
    
    
}
