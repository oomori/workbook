//
//  ViewController.swift
//  NSNib
//
//  Created by air on 2015/11/05.
//  Copyright © 2015年 oomori. All rights reserved.
//

import Cocoa



class ViewController: NSViewController {

    var windowArray : NSMutableArray = []   //ウインドウ保持用
    
    //
    //別のNibのボタン"A001"から呼ばれるメソッド
    func buttonAction001(sender: AnyObject?){
        //var theWindow : NSWindow = (sender as! NSButton).window!
        NSLog("!!!001")
    }
    //別のNibのボタン"A002"から呼ばれるメソッド
    func buttonAction002(sender: AnyObject?){
        //var theWindow : NSWindow = (sender as! NSButton).window!
        NSLog("!!!002")
    }
    @IBAction func function001(sender: AnyObject) {
        if (windowArray.count == 0 ) {
            let nib : NSNib = NSNib(nibNamed: "NewWindow", bundle: NSBundle.mainBundle() )!
            //var topLevelArray : NSArray = []
            var topLevelArray = NSMutableArray()
            let outputValue = AutoreleasingUnsafeMutablePointer<NSArray?>(&topLevelArray)
         
            //NSBundle.mainBundle().loadNibNamed("NewWindow", owner: nil, topLevelObjects: outputValue)
            
            if let result : Bool = nib.instantiateWithOwner(self, topLevelObjects: outputValue) where result {
                for name in topLevelArray {
                    //読み込んだNibの中のウインドウ
                    if ((name as! NSObject).className == NSWindow.className() ){
                        NSLog("%@",name.description)
                        NSLog("%@",(name as! NSWindow).title)
                        
                        let theWindow : NSWindow = (name as! NSWindow)
                        windowArray.addObject(theWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
                        //ウインドウ表示
                        theWindow.makeKeyAndOrderFront(self)
                        
                        //NSLog("%@",((theWindow.contentView?.subviews)?.description)!)
                        //ウインドウに含まれるオブジェクトの設定
                        for obj in( (theWindow.contentView?.subviews))! {
                            if ((obj as NSObject).className == NSButton.className() ){
                                //ボタンの設定
                                let theButton : NSButton = (obj as! NSButton)
                                //ボタンにはIDが振ってある
                                if (theButton.identifier == "A001" ){
                                 theButton.action = Selector("buttonAction001:")//ボタンを押した時に動かす関数
                                 theButton.target = self//ターゲット
                                }else if (theButton.identifier == "A002" ){
                                    theButton.action = Selector("buttonAction002:")//ボタンを押した時に動かす関数
                                    theButton.target = self//ターゲット
                                }
                            
                            }
                            
                        }
                        
                    }
                }
            }
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

