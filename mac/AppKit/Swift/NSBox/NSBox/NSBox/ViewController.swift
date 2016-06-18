//
//  ViewController.swift
//  NSBox
//
//  Created by air on 2015/11/03.
//  Copyright © 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    //ウインドウを保持しておくための配列
    var windowArray : NSMutableArray = []
    
    
    var aButton001 : NSButton?
    var aView001 : NSView?
    func viewAction001(sender : AnyObject?){
        //準備
        //let aButton = aButton001
        let aView   = aView001
        //var theWindow : NSWindow = aButton!.window!
        //準備ここまで
        
        //ビューにフォーカスを当てる
        aView?.lockFocus()
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
        
        aBezier.appendBezierPathWithOvalInRect(NSMakeRect(90.0, 35.0, 30.0, 30.0))
        
        aBezier.fill()
        aBezier.lineWidth = 2.0
        aBezier.stroke()
        
        //ビューからフォーカスを外す
        aView?.unlockFocus()
        NSLog("!!! %@",aBezier.description)
    }
    @IBAction func function001(sender: AnyObject) {
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

        //ボックスを作成。ビューに入れる
        let theBox : NSBox = NSBox(frame: NSMakeRect(0.0, 5.0, 300.0, 195.0))
        aWindow.contentView!.addSubview(theBox)
        theBox.title = "ボックスタイトル"
        
        //ビューを作成。ボックスに入れる
        let theView : NSView = NSView(frame: NSMakeRect(0.0, 20.0, 300.0, 100.0))
        //レイヤーバックドにするのだ
        theView.wantsLayer = true
        
        theBox.addSubview(theView)
        
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
