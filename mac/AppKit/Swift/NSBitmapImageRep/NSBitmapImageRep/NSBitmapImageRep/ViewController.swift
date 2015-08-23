//
//  ViewController.swift
//  NSBitmapImageRep
//
//  Created by air on 2015/06/01.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    //ウインドウを保持しておくための配列
    var windowArray : NSMutableArray = []

    //NSBitmapImageRep ビットマップ画像に直接書き込む
    var aButton001 : NSButton?
    var aView001 : NSView?
    //var bitmap001 : NSBitmapImageRep?
    
    //実験用ビューのボタンを押した時に実行されるところ
    //「set」ボタン
    func viewAction001(sender : AnyObject?){
        
        //オフスクリーンを作成
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
        
        //ビットマップの加工、ここでは緑に塗りつぶす
        for y in 20...460 {
            for x in 20...620 {
                theBitmap.setColor(NSColor.orangeColor(), atX: x, y: y)
            }
        }
        var g : NSGraphicsContext = NSGraphicsContext(bitmapImageRep: theBitmap)!
        g.saveGraphicsState()
        NSGraphicsContext.setCurrentContext(g)
        
        let p1 : NSPoint = NSMakePoint(10.0, 10.0)
        let p2 : NSPoint = NSMakePoint(90.0, 90.0)
        NSBezierPath .strokeLineFromPoint(p1, toPoint: p2)
        
        NSGraphicsContext.restoreGraphicsState()
        
        theBitmap.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: [:])?.writeToFile("~/Desktop/test.png".stringByExpandingTildeInPath, atomically: true)
        
        
        
        
    }
    @IBAction func function001  (sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction001:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        
        //ボタンの制約設定
        //falseを設定する
        theButton.translatesAutoresizingMaskIntoConstraints = false
        
        //先にaddSubviewする
        aWindow.contentView.addSubview(theButton)
        
        var viewDictionary:Dictionary = ["theButton": theButton]
        
        var constraints:NSMutableArray = NSMutableArray()
        
        //横方向の制限
        //ボタン真ん中に
        var constraintFormat1:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[theButton]-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary)
        constraints.addObjectsFromArray(constraintFormat1)
        
        aWindow.contentView.addConstraints(constraints as [AnyObject])
        
        
        
        //ビューを作成
        //---------------------------------------------------------
        //オリジナルのスクロールビュー
        //まずはスクロールビュー
        var scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,150.0,170.0))
        //中身のイメージビュー
        var theImageView : NSImageView = NSImageView(frame: NSMakeRect(0.0,30.0,150.0,300.0))
        
        theImageView.image = NSImage(named: "testImage")
        
        scrollView.documentView = theImageView
        scrollView.hasVerticalRuler = true
        scrollView.hasHorizontalScroller = true
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalRuler = true
        aWindow.contentView.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //オリジナルのスクロールビュー終了
        //---------------------------------------------------------

        //加工するためにBitmapデータ作成
        let theImage = theImageView.image
        let theBitmap = NSBitmapImageRep(data:theImage!.TIFFRepresentation!)
        
        NSLog("bitsPerPixel %d", theBitmap!.bitsPerPixel)
        NSLog("samplesPerPixel %d", theBitmap!.samplesPerPixel) //ピクセルのサンプル数

        
        
        //pixelデータの取得
        let pixel = UnsafeMutablePointer<Int>.alloc(4)
        theBitmap?.getPixel(pixel, atX: 10, y: 10)
        NSLog("r=%d,g=%d,b=%d,a=%d", pixel[0] ,pixel[1],pixel[2],pixel[3])
        pixel.dealloc(4)
        
        let pixel2 = UnsafeMutablePointer<Int>.alloc(3)
        let pixel3 = UnsafeMutablePointer<Int>.alloc(3)
        for y in 500...700 {
            for ( var x :Int = 100 ; x < (theBitmap?.pixelsWide)  ; x++ ) {
                theBitmap?.getPixel(pixel2, atX: x, y: y)
                pixel2[0] = 255
                pixel2[1] = 255
                pixel2[2] = 255
                theBitmap?.setPixel(pixel2, atX: x, y: x)
                theBitmap?.getPixel(pixel3, atX: x, y: y)
                //NSLog("r=%d,g=%d,b=%d,a=%d", pixel3[0] ,pixel3[1],pixel3[2],pixel3[3])
                //theBitmap!.setColor(NSColor.greenColor(), atX: x, y: y)
            }
        }
        pixel2.dealloc(3)
        pixel3.dealloc(3)
        
        //カラーのセット
        for y in 20...460 {
            for ( var x :Int = 100 ; x < (theBitmap?.pixelsWide)  ; x++ ) {
                theBitmap!.setColor(NSColor.greenColor(), atX: x, y: y)
            }
        }
        
        //加工したNSBitmapImageRepを右側に表示
        //---------------------------------------------------------
        //ピクセルを加工した方のスクロールビュー
        var scrollView2 : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,150.0,170.0))
        //中身のイメージビュー
        var theImageView2 : NSImageView = NSImageView(frame: NSMakeRect(0.0,30.0,150.0,300.0))
        
        //addRepresentation:
        theImageView2.image = NSImage()
        theImageView2.image?.addRepresentation(theBitmap!)
        
        scrollView2.documentView = theImageView2
        scrollView2.hasVerticalRuler = true
        scrollView2.hasHorizontalScroller = true
        scrollView2.hasVerticalScroller = true
        scrollView2.hasHorizontalRuler = true
        aWindow.contentView.addSubview(scrollView2)
        
        scrollView2.translatesAutoresizingMaskIntoConstraints = false
        
        //ウインドウに対するスクロールビューの制約
        //縦の制約
        var scrollViewConstraints1 : NSMutableArray = NSMutableArray()
        var scrollViewConstraints2 : NSMutableArray = NSMutableArray()
        
        var viewDictionary3 : Dictionary = ["scrollView": scrollView]
        var viewDictionary4 : Dictionary = ["scrollView2": scrollView2]
        
        var scrollViewConstraintV:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(5)-[scrollView(==250)]-(30)-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary3)
        var scrollViewConstraint2V:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(5)-[scrollView2(==250)]-(30)-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary4)
        
        scrollViewConstraints1.addObjectsFromArray(scrollViewConstraintV)
        scrollViewConstraints2.addObjectsFromArray(scrollViewConstraint2V)
        
        //横の制約　スクロールビューが親ビューに対して
        var viewDictionary5 : Dictionary = ["scrollView": scrollView,"scrollView2": scrollView2]
        var scrollViewConstraintH:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(5)-[scrollView(==150)]-(5)-[scrollView2(==150)]-(5)-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary5)

        scrollViewConstraints1.addObjectsFromArray(scrollViewConstraintH)
        
        //ウインドウに対するスクロールビューの制約の追加
        aWindow.contentView.addConstraints(scrollViewConstraints1 as [AnyObject])
        aWindow.contentView.addConstraints(scrollViewConstraints2 as [AnyObject])

        //ピクセルを加工した方のスクロールビュー終了
        //---------------------------------------------------------

        
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        
    }

    //NSBitmapImageRep　カラオケ
    var aButton002 : NSButton?
    var aView002 : NSView?
    var bitmap002 : NSBitmapImageRep?
    
    //実験用ビューのボタンを押した時に実行されるところ
    func viewAction002(sender : AnyObject?){
        
        //Bitmapデータ作成
        let theBitmap = aView002?.bitmapImageRepForCachingDisplayInRect(aView002!.bounds)
        aView002!.cacheDisplayInRect(aView002!.bounds, toBitmapImageRep: theBitmap! )

        theBitmap!.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: [:])?.writeToFile("~/Desktop/view.png".stringByExpandingTildeInPath, atomically: true)
        
        
    }
    @IBAction func function002  (sender: AnyObject) {
        var aWindow : NSWindow
        = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300.0, 200.0),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask,
            backing: .Buffered,
            defer: false,
            screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "NSBitmapImageRep"//タイトル設定
        //ボタン
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 0.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("viewAction002:")
        theButton.target = self
        
        aWindow.contentView.addSubview(theButton)
        //ビュー
        var theView : TestView002 = TestView002(frame: NSMakeRect(0.0, 20.0, 300.0, 200.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        aWindow.contentView.addSubview(theView)
        
        //実験ウインドウにUIパーツを渡す
        self.aButton002 = theButton    //ボタン
        self.aView002 = theView        //テストビュー
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        
    }
    
    //NSBitmapImageRep +imageRepWithData:
    //NSBitmapImageRep
    @IBAction func function003(sender: AnyObject) {
        
        //バンドル取得
        let nibBundle : NSBundle = NSBundle.mainBundle()
        
        //バンドルにある画像から
        let nibPath : NSString = nibBundle.pathForResource("testImage.JPG", ofType: nil )!
        
        //画像データを読み込み
        //NSLog("nibPath %@",nibPath )
        
        var theData : NSMutableData = NSMutableData(contentsOfFile: nibPath as String )!
        
        //オフスクリーンを作成
        let theBitmap : NSBitmapImageRep = NSBitmapImageRep(data: theData)!

        //ビットマップフォーマット
        switch (theBitmap.bitmapFormat){
        case NSBitmapFormat.NSAlphaFirstBitmapFormat :
            NSLog("NSAlphaFirstBitmapFormat ")
        case NSBitmapFormat.NSAlphaNonpremultipliedBitmapFormat :
            NSLog("NSAlphaNonpremultipliedBitmapFormat ")
        case NSBitmapFormat.NSFloatingPointSamplesBitmapFormat :
            NSLog("NSFloatingPointSamplesBitmapFormat ")
        case NSBitmapFormat.NS16BitLittleEndianBitmapFormat :
            NSLog("NS16BitLittleEndianBitmapFormat ")
        case NSBitmapFormat.NS32BitLittleEndianBitmapFormat :
            NSLog("NS32BitLittleEndianBitmapFormat ")
        case NSBitmapFormat.NS16BitBigEndianBitmapFormat :
            NSLog("NS16BitBigEndianBitmapFormat ")
        case NSBitmapFormat.NS32BitBigEndianBitmapFormat :
            NSLog("NS32BitBigEndianBitmapFormat ")
        default:
            NSLog("default")
        }
        
        //ピクセルあたりのビット数
        NSLog("bitsPerPixel = %d",theBitmap.bitsPerPixel)
       
        //Planeごとのバイト数
        NSLog("bytesPerPlane = %d",theBitmap.bytesPerPlane)

        //画像の1ラインのバイト数
        NSLog("bytesPerRow = %d",theBitmap.bytesPerRow)
        
        //プレーンの数
        NSLog("numberOfPlanes = %d",theBitmap.numberOfPlanes)

        //サンプル数
        NSLog("samplesPerPixel = %d",theBitmap.samplesPerPixel)
        
        //チャンネルあたりのバイト数
        NSLog("byte per pixel = %d",(theBitmap.bytesPerRow/theBitmap.samplesPerPixel) )

        
        
        //一度TIFFデータにしてみる
        var theData2 : NSData = theBitmap.TIFFRepresentation!
        var theData3 : NSMutableData = NSMutableData(data: theData2 )
        
        //データ書き換え
        let aLength : Int = 400000
        theData3.replaceBytesInRange(NSMakeRange(100, aLength), withBytes: &theData3, length: aLength)
        
        //imageRepWithData
        var theData4 : NSData = NSData(data: theData3 )
        let theBitmap2 : NSBitmapImageRep = NSBitmapImageRep(data: theData4)!
        
        
        //ビットマップの加工、ここではオレンジに塗りつぶす
        for y in 20...460 {
            for x in 20...620 {
                theBitmap2.setColor(NSColor.orangeColor(), atX: x, y: y)
            }
        }
        
        
        theBitmap2.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: [:])?.writeToFile("~/Desktop/test003.png".stringByExpandingTildeInPath, atomically: true)
        
        
    }
    
    @IBAction func function004(sender: AnyObject) {
    }
    
    @IBAction func function005(sender: AnyObject) {
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

