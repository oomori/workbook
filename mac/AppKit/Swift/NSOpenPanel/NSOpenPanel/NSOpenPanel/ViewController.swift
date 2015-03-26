//
//  ViewController.swift
//  NSOpenPanel
//
//  Created by air on 2015/03/21.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {


    //NSOpenPanel
    @IBAction func function001(sender: AnyObject) {
        //複製するファイルを選択
        var openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            //オープンパネルでOKを選択したら
            if result == NSFileHandlingPanelOKButton {
                //選択したファイルを複製
                let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
                theWorkspace.duplicateURLs(openPanel.URLs, completionHandler: {
                    (dic : [ NSObject : AnyObject]!, err) in
                    NSLog("%@", (dic as Dictionary).description)
                    //let values: Array = Array(dic.keys)
                    let values: Array = Array(dic.values)
                    for (index, value) in enumerate(values) {
                        println("index: \(index), value: \(value)")
                    }
                })
            }//if result
        }//openPanel.beginWithCompletionHandler
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

