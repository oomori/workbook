//
//  ViewController.swift
//  NSString
//
//  Created by air on 2015/02/14.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
// Swift2.0 converted
import Cocoa

class ViewController: NSViewController {
    //NSString mac contentsOfFile:encoding:error:
    //Swift2.0
    @IBAction func function001(sender: AnyObject) {
        let path = NSBundle.mainBundle().pathForResource("TESTFILE", ofType: "txt")
        //var err: NSError? = NSError()
        let string : NSString = try! String(contentsOfFile: path!,
                                    encoding: NSUTF8StringEncoding)
        NSLog("%@", string)
        //->テストファイルです。
    }
    
    //NSString mac stringByExpandingTildeInPath
    //Swift2.0
    @IBAction func function002(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theFilePath : NSString = NSString(string: "~/Desktop/textured.gif")
        //チルダ付きのファイルパスをフルパスに変換する
        let fileFullPath : NSString = theFilePath.stringByExpandingTildeInPath
        NSLog(fileFullPath as String)
        if theWorkspace.openFile(fileFullPath as String, withApplication:"Safari") {
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

