//
//  ViewController.swift
//  NSViewAnimation
//
//  Created by air on 2015/02/15.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    required init?(coder: NSCoder) {
        didMoveView = false
        super.init(coder: coder)
    }
    var didMoveView : Bool
    @IBOutlet weak var imageView001: NSImageView!
    //NSAnimationContext
    @IBAction func function001(sender: AnyObject) {
        let newPoint : NSPoint = didMoveView ? NSMakePoint(0.0, 0.0):NSMakePoint(200.0, 0.0)
        imageView001.animator().setFrameOrigin(newPoint)
        didMoveView = !didMoveView
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

