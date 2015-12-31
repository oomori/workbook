//
//  ViewController.swift
//  NSStoryboad
//
//  Created by air on 2015/11/07.
//  Copyright © 2015年 oomori. All rights reserved.
//
//Swift2.0

import Cocoa

class ViewController: NSViewController {

    var windowArray : NSMutableArray = []   //ウインドウ保持用
    
    @IBAction func function001(sender: AnyObject) {
        if (windowArray.count == 0 ) {
            let storyBoard : NSStoryboard = NSStoryboard(name: "NewStoryboard", bundle: NSBundle.mainBundle())
            
            let item1 = storyBoard.instantiateControllerWithIdentifier("anotherSBsecondWi") as! NSWindowController
            
            //ストーリーボードからのウインドウ
            let theWindow : NSWindow = item1.window!
            windowArray.addObject(theWindow)
            
            NSLog("%@", item1.description)
            theWindow.makeKeyAndOrderFront(self)

            var topLevelArray = NSMutableArray()
            let outputValue = AutoreleasingUnsafeMutablePointer<NSArray?>(&topLevelArray)
            
            //ふたつ目のビューコントローラ〜
            let itemPrototype = self.storyboard?.instantiateControllerWithIdentifier("secondVC") as! NSViewController
            
            NSLog("%@", itemPrototype)
            
            //let button001 = self.storyboard?.instantiateControllerWithIdentifier("anotherSBsecondVCButton001") as! NSButton
            
            
            //                for name in topLevelArray {
//                    //読み込んだNibの中のウインドウ
//                    if ((name as! NSObject).className == NSWindow.className() ){
//                        NSLog("%@",name.description)
//                        NSLog("%@",(name as! NSWindow).title)
//                        
//                        let theWindow : NSWindow = (name as! NSWindow)
//                        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
//                        //ウインドウ表示
//                        theWindow.makeKeyAndOrderFront(self)
//                        
//                        //NSLog("%@",((theWindow.contentView?.subviews)?.description)!)
//                        //ウインドウに含まれるオブジェクトの設定
//                        for obj in( (theWindow.contentView?.subviews))! {
//                            if ((obj as NSObject).className == NSButton.className() ){
                                //ボタンの設定
//                                let theButton : NSButton = (obj as! NSButton)
//                                //ボタンにはIDが振ってある
//                                if (theButton.identifier == "A001" ){
//                                    theButton.action = Selector("buttonAction001:")//ボタンを押した時に動かす関数
//                                    theButton.target = self//ターゲット
//                                }else if (theButton.identifier == "A002" ){
//                                    theButton.action = Selector("buttonAction002:")//ボタンを押した時に動かす関数
//                                    theButton.target = self//ターゲット
//                                }
//
//                            }
//                            
//                        }
//                        
//                    }
//                }
            
            outputValue.memory = nil
        }
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

