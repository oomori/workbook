//
//  ViewController.swift
//  NSWindowController
//
//  Created by air on 2015/03/20.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var windowArray : NSMutableArray = []
    
    //NSWindowContoroller window
    //
    @IBAction func function001(sender: AnyObject) {
        //ウインドウのNSWinodowControllerを取得
        var theWindowContoroller : NSWindowController = sender.window.windowController() as NSWindowController
        
        NSLog("windowContoroller = %@",theWindowContoroller.description )
        
        let theWindow : NSWindow = theWindowContoroller.window!
        //if (window.title != nil){
        NSLog("window %@",theWindow.title! )
        //}
        let theDocument : NSDocument = theWindowContoroller.document! as NSDocument
        NSLog("window %@",theDocument.description )
        theWindowContoroller.close()
        
        
    }
    //NSWindowContoroller init(windowNibName:)
    //NSWindowContoroller loadWindow()
    //NSWindowContoroller showWindow(self)
    //NSWindowContoroller windowNibPath
    @IBAction func function002(sender: AnyObject) {
        //TestWindow.xibからウインドウコントローラーを作成
        let newWindowController : NSWindowController = NSWindowController(windowNibName: "TestWindow")
        //ウインドウをロード
        newWindowController.loadWindow()//コレは呼んではいけないらしい
        
        //表示
        newWindowController.showWindow(self)
        
        NSLog("windowNibPath %@",newWindowController.windowNibPath! )
    }
    //NSWindowContoroller window
    @IBAction func function003(sender: AnyObject) {
        let theWindowController : NSWindowController = NSWindowController()
        
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, defer: false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        aWindow.center()//ウインドウをスクリーンの中心に
        
        //ウインドウをセット
        theWindowController.window = aWindow
        //表示
        theWindowController.showWindow(self)
        
    }

    //NSWindowContoroller init(windowNibPath:)
    @IBAction func function004(sender: AnyObject) {
        //バンドル取得
        let nibBundle : NSBundle = NSBundle.mainBundle()
        //リソースから"TestWindow.xib"を取得
        //ファイルタイプはnibであることに注意
        let nibPath : NSString = nibBundle.pathForResource("TestWindow", ofType: "nib")!
        
        //TestWindow.xibからウインドウコントローラーを作成
        let newWindowController : NSWindowController = NSWindowController(windowNibPath: nibPath, owner: self )
        //ウインドウをロード
        newWindowController.loadWindow()
        //表示
        newWindowController.showWindow(self)
        
        NSLog("windowNibPath %@",newWindowController.windowNibPath! )
    }

    //NSWindowContoroller storyboardより
    @IBAction func function005(sender: AnyObject) {
        let document : Document = Document()
        let storyboard = NSStoryboard(name: "Main", bundle: nil)!
        let windowController = storyboard.instantiateControllerWithIdentifier("Document Window Controller") as NSWindowController

        document.addWindowController(windowController)
        
        //windowController.showWindow(self)
        NSLog("Main %@",document.description )
        
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

