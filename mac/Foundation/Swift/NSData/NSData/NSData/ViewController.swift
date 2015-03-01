//
//  ViewController.swift
//  NSData
//
//  Created by air on 2015/02/14.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    //NSData getBytes:length:
    //NSData dataWithBytes:length:
    @IBAction func function001(sender: AnyObject) {
        var char : [Byte]
        char = [0x10 , 0x1A, 0xBF , 0x00 , 0xAA , 0xFF]
        var dat1 = NSData(bytes: char, length: 6)
        println("\(dat1)")
        //-><101abf00 aaff>
    }
    //NSData data
    @IBAction func function002(sender: AnyObject) {
        let dat1 = NSData()
        println("\(dat1)")
        //-><>
    }
    //NSData
    @IBAction func function003(sender: AnyObject) {
    }
    //NSData
    @IBAction func function004(sender: AnyObject) {
    }
    //NSData
    @IBAction func function005(sender: AnyObject) {
    }
    //NSData
    @IBAction func function006(sender: AnyObject) {
    }
    //NSData
    @IBAction func function007(sender: AnyObject) {
    }
    //NSData
    @IBAction func function008(sender: AnyObject) {
    }
    //NSData
    @IBAction func function009(sender: AnyObject) {
    }
    //NSData
    @IBAction func function010(sender: AnyObject) {
    }
    //NSData
    @IBAction func function011(sender: AnyObject) {
    }
    //NSData
    @IBAction func function012(sender: AnyObject) {
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

