//
//  ViewController.swift
//  NSBundle
//
//  Created by air on 2015/03/20.
//  Copyright (c) 2015年 oomori. All rights reserved.
//  Swift2.0

import Cocoa

class ViewController: NSViewController {

    //NSBundle
    @IBAction func function001(sender: AnyObject) {
        //バンドル取得
        //let nibBundle : NSBundle = NSBundle.mainBundle()
        //ファイルタイプはnibであることに注意
        //let nibPath : NSString = nibBundle.pathForResource("Main.storyboard", ofType: nil)!
        
        
        //NSLog("nibPath %@",nibPath )
    }
    
    //NSBundle mainBundle()
    @IBAction func function002(sender: AnyObject) {
    //バンドル取得
    //let nibBundle : NSBundle = NSBundle.mainBundle()
    //ファイルタイプはnibであることに注意
    let storyboard = NSStoryboard(name: "Main", bundle: nil)
    
    //let storyboard = mainStoryboard()
    let viewController: AnyObject! = storyboard.instantiateInitialController()
    
        
    NSLog("nibPath %@",viewController.description )
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

