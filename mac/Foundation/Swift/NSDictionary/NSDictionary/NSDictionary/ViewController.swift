//
//  ViewController.swift
//  NSDictionary
//
//  Created by air on 2015/02/14.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    //NSDictionary
    @IBAction func function001(sender: AnyObject) {
        var aDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("TESTDICTIONARY", ofType: "plist"){
            aDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = aDict {
            NSLog("%@",dict.description )
        }
        
    }
    //NSDictionary
    @IBAction func function002(sender: AnyObject) {
    }
    //NSDictionary
    @IBAction func function003(sender: AnyObject) {
    }
    //NSDictionary
    @IBAction func function004(sender: AnyObject) {
    }
    //NSDictionary
    @IBAction func function005(sender: AnyObject) {
    }
    //NSDictionary
    @IBAction func function006(sender: AnyObject) {
    }
    //NSDictionary
    @IBAction func function007(sender: AnyObject) {
    }
    //NSDictionary
    @IBAction func function008(sender: AnyObject) {
    }
    //NSDictionary
    @IBAction func function009(sender: AnyObject) {
    }
    //NSDictionary
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

