//
//  TestView035.swift
//  NSBezier
//
//  Created by air on 2015/03/14.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class TestView001: NSView {
    //最初のマウスカーソルの位置
    var mouselocation : NSPoint = NSMakePoint(200.0, 400.0)
    var mouseArray : [NSPoint] = []
    var theBitmap001 : NSBitmapImageRep = NSBitmapImageRep(
        bitmapDataPlanes: nil,
        pixelsWide: 640,
        pixelsHigh: 480,
        bitsPerSample: 8,
        samplesPerPixel: 4,
        hasAlpha: true,
        isPlanar: false,
        colorSpaceName:NSDeviceRGBColorSpace,
        bitmapFormat:NSBitmapFormat.NSAlphaFirstBitmapFormat,
        bytesPerRow: 0,
        bitsPerPixel: 0)!
    
    override init(frame frameRect: NSRect){
        super.init( frame: frameRect)
            for y in 20...460 {
                for x in 20...620 {
                    theBitmap001.setColor(NSColor.orangeColor(), atX: x, y: y)
                }
            }
        

        
    }

    required init?(coder: NSCoder) {
        super.init( coder: coder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    //描画メソッド
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        //バックグラウンドカラーを描画
//        let backgroundColor = NSColor.whiteColor()
//        backgroundColor.setFill()
//        NSRectFill(NSMakeRect(0, 20, 300.0, 178.0))
//        
//        
//        let myFont : NSFont = NSFont(name: "HiraMaruPro-W4", size: 69.0)!
//        //空のベジェパスを作成
//        let aBezier : NSBezierPath = NSBezierPath()
//        let bBezier : NSBezierPath = NSBezierPath()
//        var aGlyphs : [NSGlyph] = [ myFont.glyphWithName("gid935"),//カ
//                                    myFont.glyphWithName("gid997"),//ラ
//                                    myFont.glyphWithName("gid934"),//オ
//                                    myFont.glyphWithName("gid941")//ケ
//            //"numbersign"
//                                    ]
//        
//        aBezier.moveToPoint(CGPoint(x: 10.0,y: 75.0))
//        aBezier.appendBezierPathWithGlyphs( &aGlyphs , count: 4, inFont: myFont)
//        bBezier.moveToPoint(CGPoint(x: 10.0,y: 75.0))
//        bBezier.appendBezierPathWithGlyphs( &aGlyphs , count: 4, inFont: myFont)
//        
//        
//        let cBezier : NSBezierPath = NSBezierPath()
//        
//        cBezier.appendBezierPathWithRect(
//                CGRect( x: 10.0,
//                        y: 0.0,
//                        width:mouselocation.x-10.0,
//                        height: 150 ))
//            cBezier.addClip()
//                    NSColor.redColor().setStroke()
//            NSColor.redColor().setFill()
//            aBezier.lineWidth = 10.0
//            aBezier.fill()
//            aBezier.stroke()
//        
//        
//        NSColor.greenColor().setStroke()
//        NSColor.greenColor().setFill()
//        
//        let dBezier : NSBezierPath = NSBezierPath()
//        
//        dBezier.appendBezierPathWithRect(
//            CGRect( x: 0,
//                y: 0.0,
//                width: 500 ,
//                height: 150 ))
//        dBezier.setClip()
//        bBezier.fill()
//        
        //var g : NSGraphicsContext = NSGraphicsContext(bitmapImageRep: self.theBitmap001)!
        var g : NSGraphicsContext = NSGraphicsContext.currentContext()!
        g.saveGraphicsState()
        NSGraphicsContext.setCurrentContext(g)
        
        let p1 : NSPoint = NSMakePoint(10.0, 10.0)
        let p2 : NSPoint = NSMakePoint(90.0, 90.0)
        
        NSBezierPath.strokeLineFromPoint(p1, toPoint: p2)
        
        NSColor.greenColor().setStroke()
        NSColor.greenColor().setFill()

        let dBezier : NSBezierPath = NSBezierPath()

        for aPoint in mouseArray{
            
        
        dBezier.appendBezierPathWithOvalInRect(
            CGRect( x: aPoint.x-(10/2),
                y: aPoint.y-(10/2),
                width: 10 ,
                height: 10 ))
        }
        dBezier.fill()
            
        NSGraphicsContext.restoreGraphicsState()
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
                untilDate:(NSDate.distantPast() as! NSDate),
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
                    
                    mouseArray.append( mouselocation )
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
