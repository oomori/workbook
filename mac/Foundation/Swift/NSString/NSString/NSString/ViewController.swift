//
//  ViewController.swift
//  NSString
//
//  Created by air on 2015/02/14.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    //NSString mac contentsOfFile:encoding:error:
    @IBAction func function001(sender: AnyObject) {
        let path = NSBundle.mainBundle().pathForResource("TESTFILE", ofType: "txt")
        var err: NSError? = NSError()
        var string : NSString = String(contentsOfFile: path!,
                                    encoding: NSUTF8StringEncoding,
                                    error: &err)!
        NSLog("%@", string)
        //->テストファイルです。
    }
    //NSString mac stringByExpandingTildeInPath
    @IBAction func function002(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theFilePath : NSString = NSString(string: "~/Desktop/textured.gif")
        //チルダ付きのファイルパスをフルパスに変換する
        let fileFullPath : NSString = theFilePath.stringByExpandingTildeInPath
        NSLog(fileFullPath)
        if theWorkspace.openFile(fileFullPath, withApplication:"Safari") {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSString mac
    @IBAction func function003(sender: AnyObject) {
    }
    //NSString mac
    @IBAction func function004(sender: AnyObject) {
    }
    //NSString mac
    @IBAction func function005(sender: AnyObject) {
    }
    //NSString mac
    @IBAction func function006(sender: AnyObject) {
    }
    //NSString mac
    @IBAction func function007(sender: AnyObject) {
    }
    //NSString mac
    @IBAction func function008(sender: AnyObject) {
    }
    //NSString mac
    @IBAction func function009(sender: AnyObject) {
    }
    //NSString mac
    @IBAction func function010(sender: AnyObject) {
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

