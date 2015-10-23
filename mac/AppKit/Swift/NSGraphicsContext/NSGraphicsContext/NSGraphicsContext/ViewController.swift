//
//  ViewController.swift
//  NSGraphicsContext
//
//  Created by air on 2015/06/04.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//Swift2.0
import Cocoa

class ViewController: NSViewController {

    //ウインドウを保持しておくための配列
    var windowArray : NSMutableArray = []
    
    //NSBitmapImageRep
    var aButton001 : NSButton?
    var aView001 : NSView?
    //var bitmap001 : NSBitmapImageRep?
    
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction001(sender : AnyObject?){
        NSLog("!!!")
        
        //Bitmapデータ作成
        //        let theBitmap = NSBitmapImageRep(
        //            bitmapDataPlanes: nil,
        //            pixelsWide: 640,
        //            pixelsHigh: 480,
        //            bitsPerSample: 8,
        //            samplesPerPixel: 3,
        //            hasAlpha: false,
        //            isPlanar: true,
        //            colorSpaceName: NSCalibratedRGBColorSpace,
        //            bytesPerRow: 0,
        //            bitsPerPixel: 0)
        //
        //        for y in 20...460 {
        //            for x in 20...620 {
        //                theBitmap!.setColor(NSColor.orangeColor(), atX: x, y: y)
        //            }
        //        }
        
        let theBitmap : NSBitmapImageRep = NSBitmapImageRep(
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
        
        for y in 20...460 {
            for x in 20...620 {
                theBitmap.setColor(NSColor.greenColor(), atX: x, y: y)
            }
        }
        let g : NSGraphicsContext = NSGraphicsContext(bitmapImageRep: theBitmap)!
        g.saveGraphicsState()
        NSGraphicsContext.setCurrentContext(g)
        
        let p1 : NSPoint = NSMakePoint(10.0, 10.0)
        let p2 : NSPoint = NSMakePoint(90.0, 90.0)
        NSBezierPath .strokeLineFromPoint(p1, toPoint: p2)
        
        NSGraphicsContext.restoreGraphicsState()
        
        let destiPath : NSString = ("~/Desktop/test.png" as NSString).stringByExpandingTildeInPath
        theBitmap.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: [:])?.writeToFile(destiPath as String, atomically: true)
        
        
        
        
        
        
    }
    @IBAction func function001  (sender: AnyObject) {
        let aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            `defer`: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "NSBezierPath"//タイトル設定
        //ボタン
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction001:")
        theButton.target = self
        
        aWindow.contentView!.addSubview(theButton)
        //ビュー
        let theView : TestView001 = TestView001(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView!.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton001 = theButton    //ボタン
        self.aView001 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

